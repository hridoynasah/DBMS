USE uniDB;

-- Create the EMP_Audit table
CREATE TABLE EMP_Salary_Audit (
    Audit_ID INT AUTO_INCREMENT PRIMARY KEY,
    Action VARCHAR(50),
    ID INT,
    Old_Salary DECIMAL(10,2),
    New_Salary DECIMAL(10,2),
    Action_Time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create the AFTER UPDATE trigger
DELIMITER //

CREATE TRIGGER After_Update_Salary_Log
AFTER UPDATE ON EMP
FOR EACH ROW
BEGIN
    INSERT INTO EMP_Salary_Audit (Action, ID, Old_Salary, New_Salary)
    VALUES ('UPDATE', NEW.ID, OLD.Salary, NEW.Salary);
END //

DELIMITER ;

-- Test the trigger
UPDATE EMP SET Salary = 28000.00 WHERE ID = 3;
SELECT * FROM EMP_Salary_Audit;
