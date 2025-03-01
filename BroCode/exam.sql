-- 1. Find all loans of over $1200.
SELECT *
FROM loan
WHERE amount > 1200;

-- 2. Find the loan number for each loan of an amount greater than $1200.
SELECT loan_number
FROM loan
WHERE amount > 1200;

-- 3. Find the names of all customers who have a loan, an account, or both from the bank.
SELECT customer_name
FROM customer
WHERE customer_name IN (
    SELECT customer_name
    FROM borrower
)
OR customer_name IN (
    SELECT customer_name
    FROM depositor
);

-- 4. Find the names of all customers who have a loan and an account at the bank.
SELECT customer_name
FROM customer
WHERE customer_name IN (
    SELECT customer_name
    FROM borrower
)
AND customer_name IN (
    SELECT customer_name
    FROM depositor
);

-- 5. Find the names of all customers who have a loan at the Perryridge branch.
SELECT customer_name
FROM borrower
WHERE loan_number IN (
    SELECT loan_number
    FROM loan
    WHERE branch_name = 'Perryridge'
);

-- 6. Find the names of all customers who have a loan at the Perryridge branch but do not have an account at any branch of the bank.
SELECT customer_name
FROM borrower
WHERE loan_number IN (
    SELECT loan_number
    FROM loan
    WHERE branch_name = 'Perryridge'
)
AND customer_name NOT IN (
    SELECT customer_name
    FROM depositor
);

-- 7. Find all customers who have an account from at least the “Downtown” and the “Uptown” branches.
SELECT customer_name
FROM depositor
WHERE account_number IN (
    SELECT account_number
    FROM account
    WHERE branch_name = 'Downtown'
)
AND customer_name IN (
    SELECT customer_name
    FROM depositor
    WHERE account_number IN (
        SELECT account_number
        FROM account
        WHERE branch_name = 'Uptown'
    )
);