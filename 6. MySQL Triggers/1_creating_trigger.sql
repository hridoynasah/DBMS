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