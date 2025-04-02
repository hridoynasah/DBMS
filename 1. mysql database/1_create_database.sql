-- Create database using CREATE statement
CREATE DATABASE myDB;

-- Show all databases using SHOW statement
SHOW DATABASES;

-- Try to create a database with existing name
CREATE DATABASE myDB;
-- Can't create database myDB; database exists.

-- Now let's try to create a existing database using IF NOT EXISTS clause.

CREATE DATABASE IF NOT EXISTS myDB;

-- Best practice to create database using the clause -> IF NOT EXISTS
CREATE DATABASE IF NOT EXISTS myDBO;
SHOW DATABASES;