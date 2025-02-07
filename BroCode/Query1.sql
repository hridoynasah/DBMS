CREATE DATABASE myDB;
SHOW DATABASES;
USE myDB;
DROP DATABASE folksync_db;
SHOW DATABASES;
/*
    Read only mode can not be modified
*/
ALTER DATABASE myDB READ ONLY = 1;
-- DROP DATABASE myDB;  --ERROR: Schema 'mydb' is in read only mode.
-- ALTER DATABASE myDB READ ONLY = 0; --TURN OF READ ONLY MODE 

CREATE TABLE EMPLOYEES(
    EMP_ID INT,
    FIRST_NAME VARCHAR(50),
    LAST_NAME VARCHAR(50),
    HOURLY_PAY DECIMAL(5,2),
    HIRE_DATE DATE
);

SELECT * FROM EMPLOYEES;

-- RENAME TABLE
RENAME TABLE EMPLOYEES TO WORKERS;

SELECT * FROM TABLE WORKERS;