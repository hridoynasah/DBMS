USE uniDB;

-- Create the EMP table
CREATE TABLE IF NOT EXISTS EMP (
    ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Salary DECIMAL(10,2)
);

-- Create the EMP_Audit table
CREATE TABLE IF NOT EXISTS EMP_Audit (
    Audit_ID INT AUTO_INCREMENT PRIMARY KEY,
    Action VARCHAR(50),
    ID INT,
    Name VARCHAR(100),
    Salary DECIMAL(10,2),
    Action_Time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create the AFTER INSERT trigger
DELIMITER //

CREATE TRIGGER After_Insert_EMP_Log
AFTER INSERT ON EMP
FOR EACH ROW
BEGIN
    INSERT INTO EMP_Audit (Action, ID, Name, Salary)
    VALUES ('INSERT', NEW.ID, NEW.Name, NEW.Salary);
END //

DELIMITER ;

-- Test the trigger
INSERT INTO EMP (ID, Name, Salary) VALUES (3, 'Alice', 20000.00);
SELECT * FROM EMP_Audit;