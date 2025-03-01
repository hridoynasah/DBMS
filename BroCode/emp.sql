-- Create the database
CREATE DATABASE EmployeeDB;
USE EmployeeDB;

-- Create the Employees table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(100),
    Age INT,
    Department VARCHAR(50)
);

-- Create the Departments table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100)
);

-- Create the Projects table
CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(100),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Create the Assignments table
CREATE TABLE Assignments (
    AssignmentID INT PRIMARY KEY,
    EmployeeID INT,
    ProjectID INT,
    HoursWorked INT,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
    FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID)
);

-- Create the Salaries table
CREATE TABLE Salaries (
    SalaryID INT PRIMARY KEY,
    EmployeeID INT,
    SalaryAmount DECIMAL(10, 2),
    SalaryDate DATE,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

-- Sample data insertion
INSERT INTO Employees (EmployeeID, Name, Age, Department) VALUES
(1, 'John Doe', 30, 'IT'),
(2, 'Jane Smith', 25, 'HR'),
(3, 'Alice Johnson', 28, 'IT'),
(4, 'Bob Brown', 35, 'Finance'),
(5, 'Charlie Davis', 40, 'IT');

INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Finance');

INSERT INTO Projects (ProjectID, ProjectName, DepartmentID) VALUES
(1, 'Website Redesign', 1),
(2, 'Employee Onboarding', 2),
(3, 'Financial Audit', 3);

INSERT INTO Assignments (AssignmentID, EmployeeID, ProjectID, HoursWorked) VALUES
(1, 1, 1, 25),
(2, 2, 2, 15),
(3, 3, 1, 30),
(4, 4, 3, 10),
(5, 5, 1, 5);

INSERT INTO Salaries (SalaryID, EmployeeID, SalaryAmount, SalaryDate) VALUES
(1, 1, 65000, '2024-01-15'),
(2, 2, 55000, '2024-02-20'),
(3, 3, 70000, '2024-03-25'),
(4, 4, 60000, '2024-04-10'),
(5, 5, 75000, '2024-05-05');

-- A) Find the names of employees who work on the 'Website Redesign' project.
SELECT Name
FROM Employees
WHERE EmployeeID IN (
    SELECT EmployeeID
    FROM Assignments
    WHERE ProjectID = (
        SELECT ProjectID
        FROM Projects
        WHERE ProjectName = 'Website Redesign'
    )
);

-- B) List the names of employees who earn a salary greater than 60,000.
SELECT Name
FROM Employees
WHERE EmployeeID IN (
    SELECT EmployeeID
    FROM Salaries
    WHERE SalaryAmount > 60000
);

-- C) Find the names of employees who are not assigned to any projects.
SELECT Name
FROM Employees
WHERE EmployeeID NOT IN (
    SELECT EmployeeID
    FROM Assignments
);

-- D) Find the names of employees who have worked more than 20 hours on any project.
SELECT Name
FROM Employees
WHERE EmployeeID IN (
    SELECT EmployeeID
    FROM Assignments
    WHERE HoursWorked > 20
);

-- E) Find the names of employees who have worked on a project in the 'IT' department and limit the results to 5 employees.
SELECT Name
FROM Employees
WHERE EmployeeID IN (
    SELECT EmployeeID
    FROM Assignments
    WHERE ProjectID IN (
        SELECT ProjectID
        FROM Projects
        WHERE DepartmentID = (
            SELECT DepartmentID
            FROM Departments
            WHERE DepartmentName = 'IT'
        )
    )
)
LIMIT 5;

-- F) Find the names of employees who have not received a salary greater than 70,000 in the last year.
SELECT Name
FROM Employees
WHERE EmployeeID NOT IN (
    SELECT EmployeeID
    FROM Salaries
    WHERE SalaryAmount > 70000 AND SalaryDate >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
);

-- G) Find the total number of hours worked by 'Jane Smith' on all projects.
SELECT SUM(HoursWorked) AS TotalHoursWorked
FROM Assignments
WHERE EmployeeID = (
    SELECT EmployeeID
    FROM Employees
    WHERE Name = 'Jane Smith'
);