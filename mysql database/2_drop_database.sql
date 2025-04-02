# The DROP DATABASE statement in MySQL is used to delete a database along with all the data such as tables, views, indexes, stored procedures, and constraints.
CREATE DATABASE IF NOT EXISTS myDBT;

SHOW DATABASES;

DROP DATABASE myDBT;

SHOW DATABASES;

DROP DATABASE myDBO;

SHOW DATABASES;
# Good practice to use it.
DROP DATABASE IF EXISTS myDBO;
# Error: Can't drop database myDBO;database doesn't exist.  
DROP DATABASE myDBO;