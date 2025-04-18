USE uniDB;

-- Create the BEFORE UPDATE trigger
DELIMITER //

CREATE TRIGGER Before_Update_Salary_Check
BEFORE UPDATE ON EMP
FOR EACH ROW
BEGIN
    IF NEW.Salary < OLD.Salary THEN
        SET NEW.Salary = OLD.Salary;
    END IF;
END //

DELIMITER ;

-- Test the trigger
UPDATE EMP SET Salary = 15000.00 WHERE ID = 3; -- Salary stays 20000.00
UPDATE EMP SET Salary = 25000.00 WHERE ID = 3; -- Salary updates to 25000.00
SELECT * FROM EMP;