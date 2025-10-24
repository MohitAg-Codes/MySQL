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
  
  select substring_index('apple,banana,orange', ',', -2);