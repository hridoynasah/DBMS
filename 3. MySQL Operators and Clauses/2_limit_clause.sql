use  example_db;

SELECT * FROM CUSTOMERS;

# It gives firt four values from the table
SELECT * FROM CUSTOMERS LIMIT 4;

# It will give 4 rows start from the third row 
SELECT * FROM CUSTOMERS LIMIT 4 OFFSET 2;

# It will give 5 rows start from the third row
SELECT * FROM CUSTOMERS LIMIT 2, 5;

# From 1 to 6 whose age is greater than 25 
SELECT * FROM CUSTOMERS WHERE AGE > 25 LIMIT 6;

# 2nd row theke shuru kore jader age > 21 --> 3 ta row dibe
SELECT * FROM CUSTOMERS WHERE AGE > 21 LIMIT 1, 3;

SELECT * FROM CUSTOMERS ORDER BY SALARY DESC LIMIT 5;

SELECT * FROM CUSTOMERS ORDER BY SALARY ASC LIMIT 1, 3;