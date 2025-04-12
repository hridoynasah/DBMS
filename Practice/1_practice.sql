-- Create Database
CREATE DATABASE UniversityJoins;
USE UniversityJoins;

-- Table 1: Students
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Major VARCHAR(50),
    GraduationYear INT
);

-- Table 2: Courses
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    Department VARCHAR(50),
    Credits INT,
    Semester VARCHAR(20)
);

-- Table 3: Enrollments
CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    Grade VARCHAR(2),
    EnrollmentDate DATE
);

-- Table 4: Professors
CREATE TABLE Professors (
    ProfessorID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    HireYear INT
);

-- Insert data into Students
INSERT INTO Students (StudentID, FirstName, LastName, Major, GraduationYear) VALUES
(1, 'Alice', 'Smith', 'Computer Science', 2024),
(2, 'Bob', 'Johnson', 'Biology', 2023),
(3, 'Clara', 'Lee', 'Mathematics', 2025),
(4, 'David', 'Kim', 'Physics', 2024),
(5, 'Emma', 'Brown', 'History', 2026);

-- Insert data into Courses
INSERT INTO Courses (CourseID, CourseName, Department, Credits, Semester) VALUES
(101, 'Introduction to Programming', 'Computer Science', 3, 'Fall'),
(102, 'Cell Biology', 'Biology', 4, 'Spring'),
(103, 'Calculus I', 'Mathematics', 3, 'Fall'),
(104, 'Quantum Mechanics', 'Physics', 4, 'Spring'),
(105, 'World History', 'History', 3, 'Fall');

-- Insert data into Enrollments
INSERT INTO Enrollments (EnrollmentID, StudentID, CourseID, Grade, EnrollmentDate) VALUES
(1001, 1, 101, 'A', '2023-08-15'),
(1002, 2, 102, 'B+', '2023-01-10'),
(1003, 3, 103, 'A-', '2023-08-20'),
(1004, NULL, 104, 'C', '2023-01-15'), -- No student assigned
(1005, 1, 103, 'B', '2023-08-20');

-- Insert data into Professors
INSERT INTO Professors (ProfessorID, FirstName, LastName, Department, HireYear) VALUES
(201, 'John', 'Doe', 'Computer Science', 2015),
(202, 'Jane', 'Wilson', 'Biology', 2018),
(203, 'Mark', 'Taylor', 'Mathematics', 2010),
(204, 'Susan', 'Clark', 'Physics', 2012),
(205, 'Laura', 'Adams', 'Chemistry', 2020); -- No course assigned