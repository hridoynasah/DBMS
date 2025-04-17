USE ExampleDB;

CREATE OR REPLACE VIEW ManagerView AS
SELECT ID, SALARY FROM CUSTOMERS;

UPDATE ManagerView SET SALARY = 1800.00
WHERE ID = 2;

SELECT * FROM ManagerView
WHERE ID = 2;

CREATE OR REPLACE VIEW ManagerView AS
SELECT ID, AGE, SALARY FROM CUSTOMERS;

# If we want to modify all the records of AGE column in the ManagerView
UPDATE ManagerView SET AGE = 23;

SELECT * FROM ManagerView;

DELETE FROM ManagerView WHERE ID = 5;
USE ExampleDB;
DROP VIEW ManagerView;