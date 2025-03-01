-- Create the database
CREATE DATABASE EmployeePayrollSystem;

-- Use the database
USE EmployeePayrollSystem;

-- Create Employees table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100),
    Department VARCHAR(50),
    Salary DECIMAL(10, 2),
    HireDate DATE
);

-- Create Payroll table
CREATE TABLE Payroll (
    PayrollID INT PRIMARY KEY,
    EmployeeID INT,
    Month INT,
    Year INT,
    GrossSalary DECIMAL(10, 2),
    Deductions DECIMAL(10, 2),
    NetSalary DECIMAL(10, 2),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

-- Create Bonuses table
CREATE TABLE Bonuses (
    BonusID INT PRIMARY KEY,
    EmployeeID INT,
    Year INT,
    BonusAmount DECIMAL(10, 2),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

-- Create Departments table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50),
    Budget DECIMAL(10, 2)
);

INSERT INTO Employees (EmployeeID, EmployeeName, Department, Salary, HireDate) VALUES
(1, 'John Doe', 'IT', 60000.00, '2022-05-15'),
(2, 'Jane Smith', 'HR', 55000.00, '2023-01-10'),
(3, 'Mike Johnson', 'Finance', 65000.00, '2021-08-20');
INSERT INTO Employees (EmployeeID, EmployeeName, Department, Salary, HireDate) VALUES
(4, 'Alice Brown', 'IT', 62000.00, '2022-07-18'),
(5, 'Bob White', 'HR', 53000.00, '2023-03-22'),
(6, 'Charlie Green', 'Finance', 67000.00, '2021-11-30'),
(7, 'Diana Black', 'IT', 61000.00, '2022-09-25'),
(8, 'Eve Blue', 'HR', 54000.00, '2023-05-14'),
(9, 'Frank Yellow', 'Finance', 66000.00, '2021-12-05'),
(10, 'Grace Pink', 'IT', 63000.00, '2022-10-10');

INSERT INTO Payroll (PayrollID, EmployeeID, Month, Year, GrossSalary, Deductions, NetSalary) VALUES
(1, 1, 2, 2025, 5000.00, 500.00, 4500.00), -- John Doe's Feb 2025 payroll
(2, 2, 2, 2025, 4500.00, 400.00, 4100.00), -- Jane Smith's Feb 2025 payroll
(3, 3, 2, 2025, 5500.00, 600.00, 4900.00); -- Mike Johnson's Feb 2025 payroll
INSERT INTO Payroll (PayrollID, EmployeeID, Month, Year, GrossSalary, Deductions, NetSalary) VALUES
(4, 4, 2, 2025, 5200.00, 450.00, 4750.00), -- Alice Brown's Feb 2025 payroll
(5, 5, 2, 2025, 4300.00, 350.00, 3950.00), -- Bob White's Feb 2025 payroll
(6, 6, 2, 2025, 5600.00, 550.00, 5050.00), -- Charlie Green's Feb 2025 payroll
(7, 7, 2, 2025, 5100.00, 500.00, 4600.00), -- Diana Black's Feb 2025 payroll
(8, 8, 2, 2025, 4400.00, 400.00, 4000.00), -- Eve Blue's Feb 2025 payroll
(9, 9, 2, 2025, 5700.00, 600.00, 5100.00), -- Frank Yellow's Feb 2025 payroll
(10, 10, 2, 2025, 5300.00, 450.00, 4850.00); -- Grace Pink's Feb 2025 payroll

INSERT INTO Bonuses (BonusID, EmployeeID, Year, BonusAmount) VALUES
(1, 1, 2024, 2000.00), -- John Doe's 2024 bonus
(2, 2, 2024, 1500.00), -- Jane Smith's 2024 bonus
(3, 3, 2024, 2500.00); -- Mike Johnson's 2024 bonus
INSERT INTO Bonuses (BonusID, EmployeeID, Year, BonusAmount) VALUES
(4, 4, 2024, 2200.00), -- Alice Brown's 2024 bonus
(5, 5, 2024, 1400.00), -- Bob White's 2024 bonus
(6, 6, 2024, 2600.00), -- Charlie Green's 2024 bonus
(7, 7, 2024, 2100.00), -- Diana Black's 2024 bonus
(8, 8, 2024, 1600.00), -- Eve Blue's 2024 bonus
(9, 9, 2024, 2700.00), -- Frank Yellow's 2024 bonus
(10, 10, 2024, 2300.00); -- Grace Pink's 2024 bonus


INSERT INTO Departments (DepartmentID, DepartmentName, Budget) VALUES
(1, 'IT', 500000.00),
(2, 'HR', 300000.00),
(3, 'Finance', 450000.00);
INSERT INTO Departments (DepartmentID, DepartmentName, Budget) VALUES
(4, 'Marketing', 350000.00),
(5, 'Sales', 400000.00),
(6, 'Research', 600000.00),
(7, 'Development', 550000.00),
(8, 'Support', 250000.00),
(9, 'Logistics', 300000.00),
(10, 'Administration', 200000.00);


-- SELECT * FROM EMPLOYEES;
-- SELECT * FROM PAYROLL;
-- SELECT * FROM BONUSES;
-- SELECT * FROM DEPARTMENTS;

-- SELECT * FROM EMPLOYEES LIMIT 3 OFFSET 5; -- OFFSET 5 MEANS 1ST 5 ROWS WILL BE SKIPPED.
-- SELECT * FROM EMPLOYEES LIMIT 3 , 5; -- LIMIT 3 , 5 MEANS FIRST 3 WILL BE SKIPPED.


-- ALL ANSWERS
-- a)
SELECT AVG(SALARY) AS AVG_SALARY 
FROM EMPLOYEES 
GROUP BY DEPARTMENT HAVING AVG_SALARY > 50000.0;

-- b)


-- c)
SELECT GROSSSALARY 
FROM PAYROLL
HAVING GROSSSALARY > 1000000.0
ORDER BY GROSSSALARY DESC;

-- d) 
SELECT COUNT(YEAR) AS COUNT_YEAR 
FROM BONUSES 
GROUP BY YEAR HAVING COUNT_YEAR > 3;


-- e)



-- f)
SELECT EMPLOYEEID, COUNT(BONUSID) AS COUNT_BONUS, SUM(BONUSAMOUNT) AS BM
FROM BONUSES 
GROUP BY BONUSID
HAVING COUNT_BONUS > 5
ORDER BY BM DESC;

