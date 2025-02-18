-- Drop table only if it exists
DROP DATABASE IF EXISTS TRANS_DB;

-- Create a new database
CREATE DATABASE TRANS_DB;
USE TRANS_DB;

-- Create the customers table first
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100) NOT NULL
);

-- Insert some customers to avoid foreign key issues
INSERT INTO customers (customer_name) VALUES
    ('Alice'),
    ('Bob'),
    ('Charlie'),
    ('David');

-- Create the transactions table
CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    amount DECIMAL(5, 2) NOT NULL,
    customer_id INT,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Insert transactions (fixing customer_id references)
INSERT INTO transactions (amount, customer_id, order_date)
VALUES  (4.99, 3, '2023-01-01'),
        (2.89, 2, '2023-01-01'),
        (3.38, 3, '2023-01-02'),
        (4.99, 1, '2023-01-02'),
        (1.00, NULL, '2023-01-03'),  -- Allowing NULL for unknown customers
        (2.49, 4, '2023-01-03'),
        (5.48, NULL, '2023-01-03');

-- Check if the data is inserted correctly
SELECT * FROM transactions;
SELECT * FROM customers;

SELECT SUM(AMOUNT), ORDER_DATE FROM TRANSACTIONS GROUP BY ORDER_DATE;
SELECT AMOUNT FROM TRANSACTIONS; 
SELECT AMOUNT,ORDER_DATE FROM TRANSACTIONS; 

SELECT SUM(AMOUNT), CUSTOMER_ID FROM TRANSACTIONS GROUP BY CUSTOMER_ID;
SELECT MAX(AMOUNT), CUSTOMER_ID FROM TRANSACTIONS GROUP BY CUSTOMER_ID;
SELECT MIN(AMOUNT), CUSTOMER_ID FROM TRANSACTIONS GROUP BY CUSTOMER_ID;
SELECT COUNT(AMOUNT), CUSTOMER_ID FROM TRANSACTIONS GROUP BY CUSTOMER_ID;

SELECT COUNT(AMOUNT), CUSTOMER_ID FROM TRANSACTIONS GROUP BY CUSTOMER_ID HAVING COUNT(AMOUNT) > 1 AND CUSTOMER_ID IS NOT NULL;

