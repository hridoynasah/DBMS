CREATE DATABASE BankDB;

USE BankDB;

CREATE TABLE accounts (
    account_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    balance DECIMAL(10,2)
);

CREATE TABLE account_audit (
    audit_id INT AUTO_INCREMENT PRIMARY KEY,
    account_id INT,
    old_balance DECIMAL(10,2),
    new_balance DECIMAL(10,2),
    change_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE OR REPLACE TRIGGER after_balance_update 
AFTER UPDATE ON accounts 
FOR EACH ROW
BEGIN 
    INSERT INTO account_audit(account_id, old_balanace, new_balance)
    VALUES(OLD.account_id, OLD.balance,NEW.balance)