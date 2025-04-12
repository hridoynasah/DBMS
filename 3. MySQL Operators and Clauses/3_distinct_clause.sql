USE example_db;


# let us retrieve the ADDRESS column from CUSTOMERS table without using the DISTINCT clause.

SELECT ADDRESS FROM CUSTOMERS;
# Duplicate values are not ignored in the ADDRESS column.

# we are using the DISTINCT clause on the ADDRESS column.
SELECT DISTINCT ADDRESS FROM CUSTOMERS;
# duplicate values are ignored in the ADDRESS column.

# 5 Distinct addresses 
SELECT COUNT(DISTINCT ADDRESS) FROM CUSTOMERS;

#  If salary is unique then it will give more than one with duplicate address
SELECT DISTINCT SALARY FROM CUSTOMERS WHERE ADDRESS = 'Hyderabad';

SELECT DISTINCT SALARY FROM CUSTOMERS ORDER BY SALARY;

SELECT DISTINCT ADDRESS, SALARY FROM CUSTOMERS ORDER BY ADDRESS;