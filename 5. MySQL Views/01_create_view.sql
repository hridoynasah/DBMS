CREATE DATABASE IF NOT EXISTS ExampleDB;

USE ExampleDB;

CREATE TABLE IF NOT EXISTS CUSTOMERS (
   ID INT NOT NULL,
   NAME VARCHAR(15) NOT NULL,
   AGE INT NOT NULL,
   ADDRESS VARCHAR(25),
   SALARY DECIMAL(10, 2),
   PRIMARY KEY(ID)
);

INSERT INTO CUSTOMERS VALUES 
(1, 'Ramesh', '32', 'Ahmedabad', 2000),
(2, 'Khilan', '25', 'Delhi', 1500),
(3, 'Kaushik', '23', 'Kota', 2500),
(4, 'Chaitali', '26', 'Mumbai', 6500),
(5, 'Hardik','27', 'Bhopal', 8500),
(6, 'Komal', '22', 'MP', 9000),
(7, 'Muffy', '24', 'Indore', 5500);

CREATE VIEW Customers_View AS
SELECT ID, NAME, SALARY FROM CUSTOMERS;


SELECT * FROM Customers_View;

CREATE OR REPLACE VIEW Customers_View AS
SELECT ID, NAME, SALARY FROM CUSTOMERS 
WHERE SALARY > 2500;

CREATE OR REPLACE VIEW Customers_View AS
SELECT ID, NAME, SALARY FROM CUSTOMERS 
WHERE SALARY > 2500
WITH CHECK OPTION;

UPDATE Customers_View 
SET SALARY = 1000 
WHERE ID = 5;
# This will fail with an error like:
# Error Code: 1369. CHECK OPTION failed 'database_name.Customers_View'
INSERT INTO Customers_View (ID, NAME, SALARY) 
VALUES (3, 'Charlie', 2000);
# This will fail with an error like:
# Error Code: 1369. CHECK OPTION failed 'database_name.Customers_View'
UPDATE Customers_View 
SET SALARY = 1000 
WHERE ID = 1;
