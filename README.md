# Database Management System (DBMS) Examples

This repository contains a collection of SQL examples, tutorials, and practice files for learning database management systems with MySQL.

## Repository Structure

- **1. mysql database/** - Basic MySQL database operations
  - `1_create_database.sql`: Creates a new database.
  - `2_drop_database.sql`: Drops an existing database.
  - `3_select_database.sql`: Selects a database to use.
  - `4_show_databases.sql`: Shows all available databases.
  - `5_copy_database.sql`: Copies an existing database.
  - `6_database_export.sql`: Exports a database to a file.
  - `7_database_import.sql`: Imports a database from a file.
  - `8_database_info.sql`: Retrieves information about a database.

- **2. mysql tables/** - MySQL table operations 

- **BroCode/** - Example databases for various scenarios
  - Library Management System
  - Employee Management
  - Customer database examples
  - School database
  - Example exam queries

- **LAB01/** - SQL exercises and lab assignments
  - Basic SQL operations
  - Table creation and manipulation
  - Data filtering and querying
  - GROUP BY, HAVING, and aggregate functions

## Getting Started

### Prerequisites

- MySQL Server installed on your system
- MySQL client or GUI tool like MySQL Workbench

### Using the Examples

1. Clone or download this repository to your local machine
2. Open your MySQL client or MySQL Workbench
3. Connect to your MySQL server
4. Execute the SQL scripts in the desired order

### Example Usage

For learning basic database operations:
1. Start with the files in the `1. mysql database` folder
2. Execute the scripts in numerical order (1_create_database.sql, 2_drop_database.sql, etc.)

For more advanced examples:
- Explore the BroCode folder for real-world database scenarios
- Check the LAB01 folder for structured learning exercises

## Important Concepts Covered

- Database creation, selection, and deletion
- Table creation with various column types and constraints
- Data insertion, updating, and deletion
- Basic and advanced queries using SELECT statements
- Data filtering with WHERE clauses
- Pattern matching with LIKE operator
- Aggregate functions (SUM, AVG, COUNT, MIN, MAX)
- GROUP BY and HAVING for data grouping and filtering
- Table modification with ALTER TABLE
- Table relationships and foreign key constraints

## Notes

- SQL commands in the examples follow MySQL syntax
- Some scripts may contain intentional errors for learning purposes
- The `.ipynb` files contain Jupyter notebook tutorials with explanations

## Recommended Learning Path

1. Start with basic database operations in `1. mysql database`
2. Move to table creation and manipulation
3. Learn basic data querying and filtering
4. Advance to more complex queries with joins and subqueries
5. Study the notebook files for comprehensive explanations of concepts

## Additional Resources

The repository contains several Jupyter notebooks with detailed explanations:
- `BroCode/Lecture-1.ipynb` - Detailed explanation of SQL commands
- `LAB01/LAB-2 Tutorial.ipynb` - Tutorial on GROUP BY, HAVING, ORDER BY, and Aggregate Functions
- `LAB01/Note1.ipynb` and `Note2.ipynb` - Notes on various SQL concepts




For router 1:

en 
conf t 
int fa1/0
ip nat outside
exit
int fa0/0
ip nat inside
exit
ip nat inside source static 192.168.10.2 8.0.0.3
ip nat inside source static 192.168.10.3 8.0.0.4
ip nat inside source static 192.168.10.4 8.0.0.5
exit
show ip nat translations 

For router 3:

en
conf t
int fa1/0
ip nat outside
exit
int fa0/0
ip nat inside
exit 
ip nat inside source static 192.168.20.2 9.0.0.3
exit
show ip nat translations 

for router 2:
en 
conf t
int fa1/0
ip nat outside
exit
int fa0/0
ip nat inside
exit
int fa6/0
ip nat outside
exit
access-list 1 permit 192.168.30.0 0.0.0.255
ip nat pool 1 9.0.0.4 9.0.0.10 netmask 255.0.0.0
ip nat inside source list 1 pool 1
exit
show ip nat statistics