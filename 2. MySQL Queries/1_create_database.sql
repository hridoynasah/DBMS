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

