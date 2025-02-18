CREATE DATABASE VARSITY_DB;
USE VARSITY_DB;

CREATE TABLE STUDENTS(
    STUDENT_ID INT PRIMARY KEY,
    NAME VARCHAR(50),
    AGE INT CHECK (AGE > 18),
    CGPA DECIMAL(3,2)
);

ALTER TABLE STUDENTS ADD COLUMN DEPARTMENT VARCHAR(30);
ALTER TABLE STUDENTS MODIFY COLUMN DEPARTMENT VARCHAR(30) AFTER AGE;
SELECT * FROM STUDENTS;
INSERT INTO STUDENTS(STUDENT_ID, NAME, AGE, DEPARTMENT, CGPA)
VALUES(1007,'Rahim Khan',20, 'Physics',3.75);

DELETE FROM STUDENTS WHERE STUDENT_ID = 1007;

INSERT INTO STUDENTS(STUDENT_ID, NAME, AGE, DEPARTMENT, CGPA)
VALUES(1007,'Rahim Khan',20, 'Physics',3.75);

INSERT INTO STUDENTS(STUDENT_ID, NAME, AGE, DEPARTMENT, CGPA)
VALUES(1002,'Asif',19,'Psychology', 3.80),
      (1003,'Sara Ali',21,'Mathematics', 3.90),
      (1004,'John Doe',22,'Computer Science', 3.85),
      (1005,'Jane Smith',20,'Biology', 3.70);

SELECT * FROM STUDENTS;

INSERT INTO STUDENTS(STUDENT_ID, NAME, AGE, DEPARTMENT, CGPA)
VALUES(1006,'Alice Brown',23,'Chemistry', 3.65),
    (1008,'Bob White',21,'Engineering', 3.80),
    (1009,'Charlie Black',22,'History', 3.75);


SELECT * FROM STUDENTS WHERE AGE >= 22;

SELECT * FROM STUDENTS WHERE DEPARTMENT = 'CSE' OR DEPARTMENT = 'Computer Science';
INSERT INTO STUDENTS(STUDENT_ID, NAME, AGE, DEPARTMENT, CGPA)
VALUES(1010,'David Green',24,'CSE',3.60),
    (1011,'Eva Blue',23,'CSE',3.70),
    (1012,'Frank Red',25,'CSE',3.80),
    (1013,'Grace Yellow',22,'CSE',3.90);


SELECT * FROM STUDENTS WHERE CGPA >= 3.80 AND CGPA <= 4.00;
SELECT * FROM STUDENTS WHERE CGPA BETWEEN 3.80 AND 4.00;

DELETE FROM STUDENTS WHERE STUDENT_ID = 1004;

ALTER TABLE STUDENTS ADD COLUMN EMAIL VARCHAR(50) DEFAULT 'student@diu.edu.bd';

ALTER TABLE STUDENTS MODIFY AGE SMALLINT;
ALTER TABLE STUDENTS MODIFY AGE INT;
RENAME TABLE STUDENTS TO STUDENTS_INFO;
SELECT * FROM STUDENTS_INFO;
RENAME TABLE STUDENTS_INFO TO STUDENTS;
ALTER TABLE STUDENTS DROP EMAIL;

ALTER TABLE STUDENTS ADD COLUMN EMAIL VARCHAR(50);
SELECT * FROM STUDENTS WHERE NAME LIKE 'A%' OR NAME LIKE 'F%';
SELECT * FROM STUDENTS WHERE NAME LIKE '%I' OR NAME LIKE '%E';


INSERT INTO STUDENTS(STUDENT_ID, NAME, AGE, DEPARTMENT, CGPA)
VALUES(1014, 'Andrew Scott', 21, 'Physics', 3.85),
    (1015, 'Megan Ryan', 22, 'Biology', 3.75);

SELECT * FROM STUDENTS WHERE NAME LIKE '%an%'; 

SELECT * FROM STUDENTS WHERE NAME LIKE '____';
SELECT * FROM STUDENTS WHERE NAME LIKE '_a%';

UPDATE STUDENTS SET EMAIL ='sarali@gmail.com' WHERE STUDENT_ID = 1003;

SELECT * FROM STUDENTS;

SELECT * FROM STUDENTS ORDER BY NAME ASC , CGPA DESC;
