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

