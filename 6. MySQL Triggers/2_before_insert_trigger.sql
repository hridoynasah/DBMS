USE uniDB;

-- Create the EMP table
CREATE TABLE EMP (
    ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Salary DECIMAL(10,2)
);

-- Create the BEFORE INSERT trigger
DELIMITER //

CREATE TRIGGER Before_Insert_Salary_Check
BEFORE INSERT ON EMP
FOR EACH ROW
BEGIN
    IF NEW.Salary < 10000.00 THEN
        SET NEW.Salary = 10000.00;
    END IF;
END //

DELIMITER ;

-- Test the trigger
INSERT INTO EMP (ID, Name, Salary) VALUES (1, 'Alice', 5000.00); -- Salary will be set to 10000.00
INSERT INTO EMP (ID, Name, Salary) VALUES (2, 'Bob', 15000.00); -- Salary unchanged
SELECT * FROM EMP;