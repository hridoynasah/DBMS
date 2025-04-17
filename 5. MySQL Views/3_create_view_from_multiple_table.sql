-- Create the database
CREATE DATABASE SampleDB;
USE SampleDB;

-- Create the first table
CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerName VARCHAR(100),
    ContactNumber VARCHAR(15)
);

-- Insert 5 values into the Customers table
INSERT INTO Customers (CustomerName, ContactNumber) VALUES
('Alice Johnson', '1234567890'),
('Bob Smith', '9876543210'),
('Charlie Brown', '4561237890'),
('Diana Prince', '7894561230'),
('Eve Adams', '3216549870');

-- Create the second table
CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Insert 5 values into the Orders table
INSERT INTO Orders (CustomerID, OrderDate, TotalAmount) VALUES
(1, '2023-01-01', 250.50),
(2, '2023-01-05', 150.75),
(3, '2023-01-10', 300.00),
(4, '2023-01-15', 450.25),
(5, '2023-01-20', 500.00);

-- Create the third table
CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(100),
    Price DECIMAL(10, 2)
);

-- Insert 5 values into the Products table
INSERT INTO Products (ProductName, Price) VALUES
('Laptop', 1200.00),
('Smartphone', 800.00),
('Tablet', 400.00),
('Headphones', 150.00),
('Smartwatch', 200.00);

# Create View from Multiple Table

CREATE OR REPLACE VIEW ManagerView AS
Select c.CustomerName, c.CustomerID, o.OrderDate 
FROM Customers c, Orders o 
WHERE c.CustomerID = o.CustomerID;

SELECT * FROM ManagerView;