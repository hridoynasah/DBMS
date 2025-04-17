# View is virtual table 

CREATE DATABASE myExampleDB;
SHOW DATABASES;
USE myExampleDB;
CREATE TABLE Student(
    ID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    CGPA DECIMAL
);
INSERT INTO Student (ID, Name, CGPA) 
VALUES 
(1, 'Alice', 3.8),
(2, 'Bob', 3.5),
(3, 'Charlie', 3.9);

# Data access control
# Reduce complexity
# Security

CREATE TABLE Employee(
    ID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Salary DECIMAL NOT NULL
);

INSERT INTO Employee (ID, Name, Salary) 
VALUES 
(1, 'David', 50000),
(2, 'Emma', 60000),
(3, 'Frank', 55000),
(4, 'Grace', 70000),
(5, 'Hannah', 65000);

CREATE VIEW Manager
AS
SELECT Name, Salary FROM Employee
WHERE Salary > 50000;

SELECT * FROM Manager;

CREATE TABLE Department(
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50) NOT NULL,
    Location VARCHAR(50)
);

INSERT INTO Department (DeptID, DeptName, Location) 
VALUES 
(1, 'HR', 'New York'),
(2, 'Finance', 'London'),
(3, 'IT', 'San Francisco'),
(4, 'Marketing', 'Chicago');

CREATE VIEW CEO AS
SELECT e.Name, e.Salary, d.DeptName FROM
Employee e, Department d WHERE e.id = d.DeptID;

SELECT * FROM CEO;

CREATE OR REPLACE VIEW CEO AS
SELECT e.Name, e.Salary FROM
Employee e, Department d WHERE e.id = d.DeptID;

SELECT * FROM CEO;