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

