


-- Create the EMP_Audit table
CREATE TABLE EMP_Audit (
    Audit_ID INT AUTO_INCREMENT PRIMARY KEY,
    Action VARCHAR(50),
    ID INT,
    Name VARCHAR(100),
    Salary DECIMAL(10,2),
    Action_Time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create the AFTER DELETE trigger
DELIMITER //

CREATE TRIGGER After_Delete_EMP_Log
AFTER DELETE ON EMP
FOR EACH ROW
BEGIN
    INSERT INTO EMP_Audit (Action, ID, Name, Salary)
    VALUES ('DELETE', OLD.ID, OLD.Name, OLD.Salary);
END;//

DELIMITER ;

-- Test the trigger
INSERT INTO EMP (ID, Name, Salary) VALUES (1, 'Alice', 20000.00);
DELETE FROM EMP WHERE ID = 1;
SELECT * FROM EMP_Audit;