CREATE DATABASE CompanyDB;
USE CompanyDB;

CREATE TABLE EMPLOYEES (
    ID INT PRIMARY KEY,
    NAME VARCHAR(50) NOT NULL,
    SALARY DECIMAL(10,2) NOT NULL,
    DEPARTMENT VARCHAR(50) NOT NULL
);

INSERT INTO EMPLOYEES (ID, NAME, SALARY, DEPARTMENT) VALUES
(1, 'Alice', 5000.00, 'Sales'),
(2, 'Bob', 4500.00, 'Engineering'),
(3, 'Charlie', 6000.00, 'Sales'),
(4, 'David', 7000.00, 'Marketing'),
(5, 'Eve', 4800.00, 'Engineering'),
(6, 'Frank', 5200.00, 'Sales'),
(7, 'Grace', 6500.00, 'Marketing'),
(8, 'Heidi', 4700.00, 'Engineering'),
(9, 'Ivan', 5500.00, 'Sales'),
(10, 'Judy', 6200.00, 'Marketing');

# 1. Total Salary by Department
SELECT Department, SUM(Salary) AS TotalSalary 
FROM Employees 
GROUP BY Department;

# 2. Average Salary by Department

SELECT Department, AVG(Salary) AS AverageSalary
FROM Employees 
GROUP BY Department;

# 3. Number of Employees by Department

SELECT Department, COUNT(ID) AS AverageSalary
FROM Employees 
GROUP BY Department;


SELECT Department, COUNT(*) AS AverageSalary
FROM Employees 
GROUP BY Department;

# 4. Maximum Salary by Department

SELECT DEPARTMENT, MAX(SALARY) AS Max_Salary
FROM EMPLOYEES
GROUP BY DEPARTMENT;

# 5. Combining Aggregations

SELECT DEPARTMENT, 
       COUNT(*) AS Employee_Count, 
       SUM(SALARY) AS Total_Salary, 
       AVG(SALARY) AS Avg_Salary
FROM EMPLOYEES
GROUP BY DEPARTMENT;


SELECT Name, (Salary + Salary * .10) AS BonusSalary 
FROM Employees;
SELECT Name, (Salary * .10) AS Bonus
FROM Employees;