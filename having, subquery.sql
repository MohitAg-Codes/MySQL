use dena_bank;
-- HAVING CLAUSE

 --  It filters individual rows before any grouping happens. The HAVING clause is different: it filters entire groups of rows after 
 -- they have been created by the GROUP BY clause.
 -- This is why you almost always see HAVING used with aggregate functions like COUNT(), SUM(), AVG(), etc.

SELECT * FROM customer_details;

-- The key rule to remember is:
-- WHERE filters rows.
-- HAVING filters groups.

-- Find all cities that have more than 3 customers.
SELECT 
    city, 
    COUNT(customer_id) AS number_of_customers
FROM 
    customer_details
GROUP BY 
    city
HAVING 
    COUNT(customer_id) > 3;

-- We first GROUP BY city to count customers in each city. Then, HAVING filters these groups, only showing the ones where the count 
-- is greater than 3.

-- From the dena_records table, find which transaction_type has an average transaction amount greater than $350.

SELECT 
    transaction_type, 
    AVG(transaction_amount) AS average_amount
FROM 
    dena_records
GROUP BY 
    transaction_type
HAVING 
    AVG(transaction_amount) > 350;
    
-- Show which account_type is held by exactly 10 customers.

SELECT account_type, count(customer_id) as total_customers
FROM customer_details
GROUP BY account_type
HAVING total_customers = 10;

-- Show which transaction_type has a total (sum) transaction amount greater than $3000.

SELECT transaction_type, SUM(transaction_amount) as total_amount
FROM dena_records
GROUP BY transaction_type
HAVING total_amount> 3000;

-- List the states that have fewer than 4 customers

SELECT state , COUNT(customer_id) AS total_customers
FROM customer_details
GROUP BY state
HAVING total_customers < 4;

select * from customer_details;

-- For accounts opened in the year 2023, find states that have more than 1 new customer.
SELECT 
    state, 
    COUNT(customer_id) AS new_customers_2023
FROM 
    customer_details
WHERE 
    YEAR(account_open_date) = 2023
GROUP BY 
    state
HAVING 
    COUNT(customer_id) > 1;
    
    
-- Considering only 'Deposit' transactions, which customers (customer_id) have a total deposit amount of more than $650?

SELECT customer_id, SUM(transaction_amount) AS total_deposit
FROM dena_records
WHERE transaction_type = 'deposit'
GROUP BY customer_id
HAVING total_deposit > 650;

-- From the customers in New York ('NY'), find which account_type has more than 2 customers.

SELECT account_type, COUNT(customer_id) AS total_customers
FROM customer_details
WHERE state = 'NY'
GROUP BY account_type
HAVING total_customers>2;

-- Considering only transactions with an amount over $200, which transaction_type has more than 4 such transactions?

SELECT transaction_type, COUNT(transaction_id) AS total_transactions
FROM dena_records
WHERE transaction_amount > 200
GROUP BY transaction_type
HAVING total_transactions >4;


-- For accounts opened before 2022, list the cities that have more than 1 of these older accounts.

SELECT
    city,
    COUNT(customer_id) as older_accounts
FROM
    customer_details
WHERE
    account_open_date < '2022-01-01'
GROUP BY
    city
HAVING
    COUNT(customer_id) > 1;
    
-- From all 'Withdrawal' transactions that occurred on or after '2024-01-05', 
-- find the total withdrawal amount for each customer and only show customers whose total is greater than $200.

SELECT customerName , SUM(transaction_amount) AS total_amount
FROM dena_records
WHERE transaction_date >='2024-01-05' AND transaction_type = 'Withdrawal'
GROUP BY customerName
HAVING total_amount > 200;

-- ----------------------------------------------------------------------------------------------------------------


-- SUBQUERIES

-- A subquery is simply a SELECT statement written inside another statement. The database runs the inner query first, and its result is then used by the outer query.
-- in subquery, the inner query runs first and then the outer query

-- We'll break this down into two parts:
-- Pure Subqueries: Using a subquery in a WHERE clause to create a dynamic filter list.
-- Advanced Subqueries: Combining subqueries with GROUP BY, HAVING, and even placing them in the FROM or SELECT clause.

-- Find the full_name and email of all customers who made a 'Withdrawal'.
 
SELECT
    full_name,
    email
FROM
    customer_details
WHERE
    customer_id IN (SELECT customer_id FROM dena_records WHERE transaction_type = 'Withdrawal');
    
-- The inner query (SELECT customer_id FROM dena_records WHERE transaction_type = 'Withdrawal') runs first. It returns a list of customer IDs: (2, 5, 7, 10, 12, 15, 17, 19).
-- The outer query then becomes: SELECT full_name, email FROM customer_details WHERE customer_id IN (2, 5, 7, 10, 12, 15, 17, 19);
-- It uses this list to find and display the matching customer details.

-- Display the customerName and transaction_amount for the transaction with the highest amount.
-- This is a SCALAR SUBQUERY because it returns a single value.

SELECT
    customerName,
    transaction_amount
FROM
    dena_records
WHERE
    transaction_amount = (SELECT MAX(transaction_amount) FROM dena_records);

-- List all transactions with an amount that is greater than the average transaction amount.

SELECT
    customerName,
    transaction_amount
FROM
    dena_records
WHERE
    transaction_amount > (SELECT AVG(transaction_amount) FROM dena_records);
    
-- Find the details of all customers who do NOT have a 'Savings' account.

SELECT
    *
FROM
    customer_details
WHERE
    account_type NOT IN ('Savings');

-- Or, to demonstrate a subquery for a similar problem:
-- Find customers who are NOT from New York or Chicago
SELECT
    full_name, city
FROM
    customer_details
WHERE
    city NOT IN (SELECT DISTINCT city FROM customer_details WHERE city IN ('New York', 'Chicago'));

-- While a simple WHERE account_type = 'Checking' would also work here, using NOT IN is a key subquery concept. 
-- The subquery would create a list of values to exclude. The second example shows how you could exclude a list of cities dynamically.


-- Advanced Subqueries (Combining with Aggregates, HAVING, etc.)

-- Find the full_name and city of customers whose total transaction amount is greater than $700.
SELECT
    full_name,
    city
FROM
    customer_details
WHERE
    customer_id IN (
        SELECT customer_id
        FROM dena_records
        GROUP BY customer_id
        HAVING SUM(transaction_amount) > 700
    );
    

-- It first groups all transactions by customer_id.
-- The HAVING clause filters these groups, keeping only those customers whose SUM(transaction_amount) is over $700. This produces a list of customer IDs (11, 18, 19).
-- The outer query takes this list and finds the details for those specific customers.



-- First, find the total transaction amount for each transaction_type. Then, from that result, find the maximum total amount.

SELECT
   MAX(total_amount) AS max_of_totals
FROM
    (
        SELECT
            transaction_type,
            SUM(transaction_amount) AS total_amount
        FROM
            dena_records
        GROUP BY
            transaction_type
    ) AS type_totals;
    

-- Find the details of customers from 'Chicago' who made a 'Deposit'.

SELECT * FROM customer_details
WHERE customer_id IN (SELECT customer_id FROM customer_details WHERE city = 'Chicago')
  AND customer_id IN (SELECT customer_id FROM dena_records WHERE transaction_type = 'Deposit');