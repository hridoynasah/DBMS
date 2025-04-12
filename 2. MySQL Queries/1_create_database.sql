CREATE DATABASE hridoydb;
SHOW DATABASES;
USE hridoydb;
CREATE TABLE Customer(
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(50) NOT NULL,
    Age INT NOT NULL
);

INSERT INTO Customer(Name, Age) VALUES
('Hridoy', 22),
('John', 23),
('Jerry', 21);

SELECT * FROM Customer;

UPDATE Customer SET Name = 'Tom' WHERE ID = 3;

ALTER TABLE Customer ADD COLUMN bd_year INT;

ALTER TABLE Customer DROP COLUMN bd_year;

ALTER TABLE Customer MODIFY COLUMN bd_year DATE;

ALTER TABLE Customer CHANGE COLUMN bd_year Birth_Date DATE;

DELETE FROM Customer WHERE ID = 3;

# The MySQL truncate table query can be used to remove all the records but not the table itself.

TRUNCATE TABLE Customer;

DROP TABLE Customer;