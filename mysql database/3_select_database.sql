# Once you get connected with the MySQL server, it is required to select a database to work with. This is because there might be more than one database available with the MySQL Server.
# syntax: USE DatabaseName;

CREATE DATABASE IF NOT EXISTS myDB;

SHOW DATABASES;

# The following will select/switch the current database to myDB
USE myDB; 
# Database changed

CREATE TABLE CUSTOMERS(
    ID INT AUTO_INCREMENT PRIMARY KEY,
    NAME VARCHAR(20) NOT NULL,
    AGE INT NOT NULL
);

CREATE TABLE STUDENTS(
    ID INT,
    NAME VARCHAR(20) NOT NULL
)

SHOW TABLES;

# If we try to select/switch a non-existent database in a MySQL server, it will result in an error stating that "Unkwown Database".
USE NonExistingDatabase;