CREATE DATABASE myUni;
USE myUni;

CREATE TABLE Student (
    ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Section CHAR(1)
);

INSERT INTO Student (ID, Name, Age, Section) VALUES
(1, 'Alice', 20, 'A'),
(2, 'Bob', 21, 'B'),
(3, 'Charlie', 20, 'A'),
(4, 'David', 22, 'C'),
(5, 'Eve', 21, 'B'),
(6, 'Frank', 20, 'A'),
(7, 'Grace', 23, 'C'),
(8, 'Hannah', 22, 'B'),
(9, 'Ivy', 21, 'A'),
(10, 'Jack', 20, 'C'),
(11, 'Kate', 23, 'B'),
(12, 'Leo', 22, 'A');

DELIMITER //

CREATE PROCEDURE Get_Student()
BEGIN
    SELECT * FROM Student;
END //

DELIMITER ;

CALL Get_Student();

DELIMITER //
CREATE PROCEDURE Get_Student_Age(IN age INT)
BEGIN
    SELECT * FROM Student WHERE Student.age = age;
END //
DELIMITER ;

-- Call the second stored procedure
CALL Get_Student_Age(23);