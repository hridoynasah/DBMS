USE example_db;
# Must use aggregate function with GROUP BY clause
SELECT AGE, COUNT(NAME) FROM CUSTOMERS
GROUP BY AGE;