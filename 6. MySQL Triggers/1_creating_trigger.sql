# Trigger Syntax
/*

CREATE TRIGGER trigger_name
    { BEFORE | AFTER } { INSERT | UPDATE | DELETE }
    ON table_name
    FOR EACH ROW
    BEGIN
        -- Trigger logic (SQL statements)
    END;

- trigger_name: Unique name for the trigger.
- BEFORE | AFTER: When the trigger fires relative to the event.
- INSERT | UPDATE | DELETE: The event that activates the trigger.
- table_name: The table the trigger is associated with.
- FOR EACH ROW: Indicates the trigger runs for each affected row.
- BEGIN ... END: Contains the trigger’s logic.

Special Keywords:

NEW: Refers to the new row being inserted or updated (available in INSERT and UPDATE).
OLD: Refers to the old row being deleted or updated (available in DELETE and UPDATE).

*/

CREATE DATABASE uniDB;
USE uniDB;

CREATE TABLE Student(
   Name varchar(35), 
   Age INT, 
   Score INT
);

DELIMITER //
CREATE TRIGGER sample_trigger 
BEFORE INSERT ON STUDENT 
FOR EACH ROW
BEGIN
IF NEW.Score < 0 THEN SET NEW.Score = 0;
END IF;
END //
DELIMITER ;

INSERT INTO STUDENT VALUES
('Jeevan', 22, 8),
('Raghav', 26, -3),
('Pooja', 21, -9),
('Devi', 30, 9);

SELECT * FROM Student;

SHOW TRIGGERS \G;