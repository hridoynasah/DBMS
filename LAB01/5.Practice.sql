# grocery store
CREATE DATABASE GROCERY_STORE;

USE GROCERY_STORE;

CREATE TABLE SALES(
    OrderID INT PRIMARY KEY,
    Product VARCHAR(50) NOT NULL,
    Quantity INT NOT NULL,
    Price FLOAT NOT NULL
);

INSERT INTO SALES(OrderID, Product, Quantity, Price) VALUES
(1, 'Apple', 10, 1.20),
(2, 'Banana', 15, 0.50),
(3, 'Apple', 20, 0.80),
(4, 'Orange', 5, 1.50),
(5, 'Banana', 8, 2.00),
(6, 'Orange', 12, 0.10),
(7, 'Apple', 7, 3.00),
(8, 'Grape', 6, 2.50),
(9, 'Banana', 4, 5.00),
(10, 'Grape', 3, 7.00),
(11, 'Orange', 9, 6.00),
(12, 'Apple', 25, 0.90)

SELECT * FROM SALES;

SELECT Product, SUM(Price) AS TotalPrice FROM SALES GROUP BY Product;
# SELECT PRODUCT, SUM(QUANTITY) AS TOTALSALES FROM SALES GROUP BY PRODUCT;
SELECT PRODUCT, SUM(QUANTITY) AS TOTALSALES FROM SALES GROUP BY PRODUCT HAVING TOTALSALES > 10 AND TOTALSALES < 30; 
SELECT PRODUCT, SUM(QUANTITY) AS TOTALSALES FROM SALES GROUP BY PRODUCT HAVING TOTALSALES > 10 AND TOTALSALES < 30 ORDER BY TOTALSALES ASC;
SELECT PRODUCT, ORDERID FROM SALES ORDER BY PRODUCT ASC, ORDERID DESC; 