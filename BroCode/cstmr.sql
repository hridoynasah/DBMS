-- Create the Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Age INT,
    City VARCHAR(50),
    Country VARCHAR(50)
);

-- Create the Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Create the Products table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10, 2)
);

-- Create the OrderDetails table
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Create the Suppliers table
CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY,
    SupplierName VARCHAR(100),
    Country VARCHAR(50)
);

-- Sample data insertion
INSERT INTO Customers (CustomerID, Name, Age, City, Country) VALUES
(1, 'John Doe', 30, 'New York', 'USA'),
(2, 'Jane Smith', 25, 'Los Angeles', 'USA'),
(3, 'Alice Johnson', 28, 'Chicago', 'USA'),
(4, 'Bob Brown', 35, 'Houston', 'USA'),
(5, 'Charlie Davis', 40, 'Phoenix', 'USA');

INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount) VALUES
(1, 1, '2024-01-15', 600.00),
(2, 2, '2024-02-20', 450.00),
(3, 3, '2024-03-25', 700.00),
(4, 4, '2024-04-10', 300.00),
(5, 5, '2024-05-05', 800.00);

INSERT INTO Products (ProductID, ProductName, Category, Price) VALUES
(1, 'Laptop', 'Electronics', 1000.00),
(2, 'Phone', 'Electronics', 500.00),
(3, 'Tablet', 'Electronics', 300.00),
(4, 'Monitor', 'Electronics', 200.00),
(5, 'Keyboard', 'Electronics', 50.00);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity) VALUES
(1, 1, 1, 1),
(2, 2, 2, 1),
(3, 3, 3, 2),
(4, 4, 4, 1),
(5, 5, 5, 4);

INSERT INTO Suppliers (SupplierID, SupplierName, Country) VALUES
(1, 'Supplier A', 'USA'),
(2, 'Supplier B', 'China'),
(3, 'Supplier C', 'Germany'),
(4, 'Supplier D', 'Japan'),
(5, 'Supplier E', 'India');

-- A) Find the names of customers who have placed an order with a total amount greater than $500.
-- π_Name(σ_TotalAmount>500(Orders) ⨝ Customers)
SELECT Name
FROM Customers
WHERE CustomerID IN (
    SELECT CustomerID
    FROM Orders
    WHERE TotalAmount > 500
);

-- B) List the names of products ordered by customers from 'USA'.
-- π_ProductName((σ_Country='USA'(Customers) ⨝ Orders) ⨝ OrderDetails ⨝ Products)
SELECT ProductName
FROM Products
WHERE ProductID IN (
    SELECT ProductID
    FROM OrderDetails
    WHERE OrderID IN (
        SELECT OrderID
        FROM Orders
        WHERE CustomerID IN (
            SELECT CustomerID
            FROM Customers
            WHERE Country = 'USA'
        )
    )
);

-- C) Find the names of customers who have never placed an order.
-- π_Name(Customers) - π_Name(Orders ⨝ Customers)
SELECT Name
FROM Customers
WHERE CustomerID NOT IN (
    SELECT CustomerID
    FROM Orders
);

-- D) Find the names of products that were ordered more than 10 times.
-- π_ProductName(σ_Quantity>10(OrderDetails) ⨝ Products)
SELECT ProductName
FROM Products
WHERE ProductID IN (
    SELECT ProductID
    FROM OrderDetails
    GROUP BY ProductID
    HAVING SUM(Quantity) > 10
);

-- E) Find the names of products whose price is less than the price of any product in the 'Electronics' category.
-- π_ProductName(σ_Price<π_Price(σ_Category='Electronics'(Products))(Products))
SELECT ProductName
FROM Products
WHERE Price < ANY (
    SELECT Price
    FROM Products
    WHERE Category = 'Electronics'
);

-- F) List the names of employees whose salary is greater than the salary of all employees in the 'HR' department.
-- π_Name(σ_SalaryAmount>π_SalaryAmount(σ_Department='HR'(Employees ⨝ Salaries))(Employees ⨝ Salaries))
-- Note: This query assumes there is an Employees table with a Department column and a Salaries table with SalaryAmount.
-- SELECT Name
-- FROM Employees
-- WHERE SalaryAmount > ALL (
--     SELECT SalaryAmount
--     FROM Salaries
--     WHERE EmployeeID IN (
--         SELECT EmployeeID
--         FROM Employees
--         WHERE Department = 'HR'
--     )
-- );

-- G) Find the names of the top 3 customers who have placed the highest total order amount.
-- π_Name(τ_TotalAmount↓3(Orders ⨝ Customers))
WITH TopCustomers AS (
    SELECT CustomerID
    FROM Orders
    GROUP BY CustomerID
    ORDER BY SUM(TotalAmount) DESC
    LIMIT 3
)
SELECT Name
FROM Customers
WHERE CustomerID IN (SELECT CustomerID FROM TopCustomers);

-- H) Find the names of customers who placed an order in the year 2024.
-- π_Name(σ_OrderDate∈2024(Orders) ⨝ Customers)
SELECT Name
FROM Customers
WHERE CustomerID IN (
    SELECT CustomerID
    FROM Orders
    WHERE YEAR(OrderDate) = 2024
);