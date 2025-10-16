use dena_bank;
-- Section 1: Data Retrieval and Filtering
-- 1. Customer Segmentation:
-- a) Retrieve the full_name, email, and city for all customers who live in 'Los Angeles'.
-- b) Modify the query to also include customers from 'Phoenix', and order the results by state.
select * from customer_details_x;

SELECT full_name, email, city
FROM customer_details_x
WHERE city = 'Los Angeles';

SELECT full_name, email, city, state
FROM customer_details_x
WHERE city IN ('Los Angeles', 'Phoenix')
ORDER BY state;

-- 2. High-Value Transactions:
-- a) Find all details for transactions in the dena_records table with an amount greater than $600.
-- b) From the results of part (a), display only the top two transactions when sorted
-- by transaction_date in descending order

SELECT * FROM dena_records_x
WHERE transaction_amount > 600;

SELECT * FROM dena_records_x
WHERE transaction_amount > 600
ORDER BY transaction_date DESC
LIMIT 2;

-- 3. Account Analysis:
-- a) List the full_name and account_open_date for all customers with a 'Savings' account.
-- b) Modify the query to find 'Checking' account customers whose accounts were opened in the year
-- 2022.

select full_name, account_open_date
from customer_details_x
where account_type = 'Savings';

select full_name, account_open_date
from customer_details_x
where account_type = 'Checking' 
and year(account_open_date) = '2022';

-- 4. Pattern-Based Searching:
-- a) Retrieve the full_name and email for all customers whose last name is 'Smith' or 'Brown'. Assume
-- the last name is the word following the first space.
-- b) Find all customers whose first name ends with the letter 'a'.

select full_name, email
from customer_details_x
where substring_index(full_name, ' ' , -1) in ('Smith' , 'Brown');

select full_name, email
from customer_details_x
where substring_index(full_name, ' ' , 1)  like '%a';

-- 5. Date-Based Filtering:
-- a) Display all transactions that occurred on or before January 10th, 2024 ('2024-01-10').
-- b) Further filter the results from part (a) to only include transactions with an amount between $100
-- and $300 (inclusive).

select *
from dena_records_x
where transaction_date <= '2024-01-10';

select *
from dena_records_x
where transaction_date <= '2024-01-10'
and transaction_amount between 100 and 300;

-- 6. Combined Criteria Retrieval:
-- a) Find all customers from Texas ('TX') who do NOT have a 'Savings' account.
-- b) List all customers who are either from Illinois ('IL') OR opened their account after June 1st, 2022.

select *
from customer_details_x
where state = 'TX' 
and account_type <> 'Savings';

select *
from customer_details_x
where state = 'IL' 
or account_open_date > '2022-06-01';

-- 7. Exclusionary Filtering:
-- a) Retrieve all transaction details except those with the transaction_id of 1005, 1010, and 1015.
-- b) From the remaining transactions, display all that are not 'Deposit' transactions.

select *
from dena_records_x
where transaction_id not in ('1005', '1010','1015');

select *
from dena_records_x
where transaction_id not in ('1005', '1010','1015')
and transaction_type <> 'Deposit';

-- 8. Ordered Retrieval:
-- a) List all customer details, sorted primarily by city in descending order and secondarily
-- by account_open_date in ascending order.
-- b) Retrieve the details of the 10 most recently opened accounts.

select *
from customer_details_x
order by city desc, account_open_date asc;

select *
from customer_details_x
order by account_open_date desc
limit 10;

-- ------------------------------------------------------------------------------------------------------

-- Section 2: Data Aggregation and Analysis
-- 9. Customer Demographics:
-- a) Calculate the total number of customers in the customer_details table.
-- b) Calculate the number of distinct cities where customers reside.

select count(customer_id) as total_customers
from customer_details_x;

select count(distinct city) as distinct_city
from customer_details_x;

-- 10. Transaction Summary:
-- a) Find the total sum of all transaction amounts in the dena_records table.
-- b) Calculate the average amount for all transactions that occurred after January 15th, 2024.

select sum(transaction_amount) as total_amount
from dena_records_x;

select avg(transaction_amount) as avg_amount
from dena_records_x
where transaction_date > '2024-01-15';

-- 11. Key Performance Indicators:
-- a) Determine the highest transaction amount recorded for a 'Withdrawal'.
-- b) Determine the lowest transaction amount recorded for a 'Deposit'.

select max(transaction_amount) as highest_transaction_amount
from dena_records_x
where transaction_type = 'Withdrawal';

select min(transaction_amount) as lowest_transaction_amount
from dena_records_x
where transaction_type = 'Deposit';

-- 12. Account Tenure:
-- a) Find the date when the very first customer account was opened.
-- b) Find the date when the most recent customer account was opened.

SELECT MIN(account_open_date) AS first_account_opened
FROM customer_details_x;

SELECT MAX(account_open_date) AS most_recent_account_opened
FROM customer_details_x;

-- 13. Customer Account Types:
-- a) Count the number of customers who have a 'Checking' account.
-- b) Count the number of customers who have a 'Savings' account

SELECT COUNT(*) AS checking_accounts
FROM customer_details_x
WHERE account_type = 'Checking';

SELECT COUNT(*) AS savings_accounts
FROM customer_details_x
WHERE account_type = 'Savings';

-- 14. Transaction Date Range:
-- a) Find the date of the earliest transaction in the dena_records table.
-- b) Find the date of the latest transaction in the dena_records table

SELECT MIN(transaction_date) AS earliest_transaction
FROM dena_records_x;

SELECT MAX(transaction_date) AS latest_transaction
FROM dena_records_x;

-- 15. Specific Customer Aggregation:
-- a) Calculate the total transaction amount for customer with customer_id = 7.
-- b) Calculate the average transaction amount for the same customer (ID 7)

SELECT SUM(transaction_amount) AS total_amount
FROM dena_records_x
WHERE customer_id = 7;

SELECT AVG(transaction_amount) AS average_amount
FROM dena_records_x
WHERE customer_id = 7;

-- 16. Aggregation with Filtering:
-- a) What is the sum of transaction amounts for all transactions with an ID greater than 1010?
-- b) What is the average amount of all transactions that are not 'Withdrawal' type?

SELECT SUM(transaction_amount) AS total_amount
FROM dena_records_x
WHERE transaction_id > 1010;

SELECT AVG(transaction_amount) AS average_amount
FROM dena_records_x
WHERE transaction_type <> 'Withdrawal';

-- -----------------------------------------------------------------------------------------

-- 17. City-Level Analysis:
-- a) For each city, count the number of customers. The result should show the city name and the
-- count.
-- b) Modify the query from part (a) to only display cities that have exactly 4 customers

select city, count(*) as total_customers
from customer_details_x
group by city;

select city, count(*) as total_customers
from customer_details_x
group by city
having total_customers = 4;

-- 18. Transaction Type Analysis:
-- a) Calculate the average transaction amount for each transaction_type.
-- b) From the results of part (a), only show the transaction type whose average amount is less than
-- $300

SELECT transaction_type, AVG(transaction_amount) AS average_amount
FROM dena_records_x
GROUP BY transaction_type;

SELECT transaction_type, AVG(transaction_amount) AS average_amount
FROM dena_records_x
GROUP BY transaction_type
HAVING AVG(transaction_amount) < 300;

-- 19. State-Level Account Distribution:
-- a) For each state, provide a count of the number of 'Savings' accounts.
-- b) For each state, provide the total number of all accounts and order the results by the count in
-- descending order.

SELECT state, COUNT(*) AS savings_count
FROM customer_details_x
WHERE account_type = 'Savings'
GROUP BY state;

SELECT state, COUNT(*) AS total_accounts
FROM customer_details_x
GROUP BY state
ORDER BY total_accounts DESC;

-- 20. Advanced Grouping:
-- a) Group customers by the year they opened their account and count how many customers joined
-- each year.
-- b) From the results of part (a), show only the years in which more than 7 customers opened an
-- account.

SELECT YEAR(account_open_date) AS open_year, COUNT(*) AS customer_count
FROM customer_details_x
GROUP BY YEAR(account_open_date);

SELECT YEAR(account_open_date) AS open_year, COUNT(*) AS customer_count
FROM customer_details_x
GROUP BY YEAR(account_open_date)
HAVING COUNT(*) > 7;

-- 21. Multi-Column Grouping:
-- a) Provide a count of customers grouped by both state and account_type.
-- b) From the results of part (a), filter to only show groups where the customer count is greater than 2

SELECT state, account_type, COUNT(*) AS customer_count
FROM customer_details_x
GROUP BY state, account_type;

SELECT state, account_type, COUNT(*) AS customer_count
FROM customer_details_x
GROUP BY state, account_type
HAVING COUNT(*) > 2;

-- 22. Customer Transaction Summary:
-- a) For each customer_id in dena_records, calculate their total transaction amount.
-- b) Modify the query to only show customers whose total transaction amount exceeds $700.

SELECT customer_id, SUM(transaction_amount) AS total_transaction_amount
FROM dena_records_x
GROUP BY customer_id;

SELECT customer_id, SUM(transaction_amount) AS total_transaction_amount
FROM dena_records_x
GROUP BY customer_id
HAVING SUM(transaction_amount) > 700;

-- 23. Monthly Activity:
-- a) Count the number of transactions that occurred in each month of the year 2024.
-- b) From the results of part (a), identify if any month had more than 20 transactions.

SELECT MONTH(transaction_date) AS month, COUNT(*) AS transaction_count
FROM dena_records_x
WHERE YEAR(transaction_date) = 2024
GROUP BY MONTH(transaction_date);

SELECT MONTH(transaction_date) AS month, COUNT(*) AS transaction_count
FROM dena_records_x
WHERE YEAR(transaction_date) = 2024
GROUP BY MONTH(transaction_date)
HAVING COUNT(*) > 20;

-- -----------------------------------------------------------------------------

-- Section 4: Data and Table Modification
-- 24. Record Correction:
-- a) The transaction with transaction_id 1003 was incorrectly entered as $50.50. Write
-- an UPDATE statement to change its transaction_amount to $55.00.
-- b) Write a SELECT query to verify that the change in part (a) was successful.

update dena_records
set transaction_amount = 55.00
where transaction_id = 1003;

select * from dena_records
where transaction_id = 1003;

-- 25. Feature Deprecation:
-- a) The company no longer wishes to store the email for its customers. Write an ALTER
-- TABLE statement to remove the email column from customer_details.
-- b) Write a query to describe the structure of the customer_details table to confirm the column has
-- been removed.

alter table customer_details
drop column email;

desc customer_details;

-- 26. Record Removal:
-- a) The transaction with transaction_id 1017 is a fraudulent entry and must be removed. Write
-- a DELETE statement to remove this record.
-- b) Write a query to count the total number of rows in dena_records to verify the deletion.

delete from dena_records
where transaction_id = 1017;

select count(*) from dena_records;

-- ---------------------------------------------------------------------------------------
-- Section 5: Advanced Subqueries and Problem Solving
-- 27. Inter-Table Analysis:
-- a) Using a subquery, retrieve the full_name and city of every customer who made a 'Deposit'.
-- b) Modify the query to find the full_name of customers who made a 'Deposit' of less than $150.

SELECT full_name, city
FROM customer_details_x
WHERE customer_id IN (
    SELECT customer_id
    FROM dena_records_x
    WHERE transaction_type = 'Deposit'
);

SELECT full_name
FROM customer_details_x
WHERE customer_id IN (
    SELECT customer_id
    FROM dena_records_x
    WHERE transaction_type = 'Deposit'
      AND transaction_amount < 150
);

-- 28. Locating Key Customers:
-- a) Find the full_name and account_open_date of the customer who made the single smallest transaction.
-- b) Find the full_name of the customer who has the oldest bank account (i.e., the earliest account_open_date).

SELECT full_name, account_open_date
FROM customer_details_x
WHERE customer_id = (
    SELECT customer_id
    FROM dena_records_x
    ORDER BY transaction_amount ASC
    LIMIT 1
);

SELECT full_name
FROM customer_details_x
ORDER BY account_open_date ASC
LIMIT 1;

-- 29. Cross-Table Filtering:
-- a) Using a subquery, list all transaction details for customers who live in a state other than 'NY' or 'CA'.
-- b) From the result of part (a), calculate the total sum of transaction_amount.

SELECT *
FROM dena_records_x
WHERE customer_id IN (
    SELECT customer_id
    FROM customer_details_x
    WHERE state NOT IN ('NY', 'CA')
);


SELECT SUM(transaction_amount) AS total_amount
FROM dena_records_x
WHERE customer_id IN (
    SELECT customer_id
    FROM customer_details_x
    WHERE state NOT IN ('NY', 'CA')
);

-- 30. Complex Problem Solving:
-- a) Find the full_name of all customers who have a 'Checking' account and whose transaction amount
-- was greater than the overall average transaction amount.
-- b) How many customers from the customer_details table do not have a corresponding transaction in
-- the dena_records table? (Hint: This requires careful use of NOT IN or similar subquery logic).

SELECT cd.full_name
FROM customer_details_x cd
JOIN dena_records_x dr 
ON cd.customer_id = dr.customer_id
WHERE cd.account_type = 'Checking'
  AND dr.transaction_amount > (
            SELECT AVG(transaction_amount) 
			FROM dena_records_x
);
 
SELECT COUNT(*) AS customers_without_transaction
FROM customer_details_x
WHERE customer_id NOT IN (
    SELECT DISTINCT customer_id
    FROM dena_records_x
);        

-- 31. Correlated Subquery Analysis:
-- a) Using a correlated subquery with EXISTS, find the full_name and email of every customer
-- in customer_details who has at least one corresponding transaction in dena_records.
-- b) Using NOT EXISTS, modify the query to identify all "inactive" customers—those who are
-- in customer_details but have no transactions in dena_records

SELECT full_name, email
FROM customer_details_x cd
WHERE EXISTS (
    SELECT 1
    FROM dena_records_x dr
    WHERE dr.customer_id = cd.customer_id
);

SELECT full_name, email
FROM customer_details_x cd
WHERE NOT EXISTS (
    SELECT 1
    FROM dena_records_x dr
    WHERE dr.customer_id = cd.customer_id
);

-- 32. Comparative Group Analysis (Subquery in HAVING):
-- a) For each city, find the total number of customers. Only display the cities where the customer
-- count is greater than the overall average number of customers per city.
-- b) For each customer_id in dena_records, find their average transaction amount. Only display the
-- customers whose average transaction amount is higher than the average amount of all transactions
-- in the entire table-

SELECT city, COUNT(*) AS customer_count
FROM customer_details_x
GROUP BY city
HAVING COUNT(*) > (
    SELECT AVG(city_count) 
    FROM (
        SELECT COUNT(*) AS city_count
        FROM customer_details_x
        GROUP BY city
    ) AS subquery
);

SELECT customer_id, AVG(transaction_amount) AS avg_transaction
FROM dena_records_x
GROUP BY customer_id
HAVING AVG(transaction_amount) > (
         SELECT AVG(transaction_amount) 
		FROM dena_records_x
);

-- 33. Derived Table Aggregation (Subquery in FROM):
-- a) First, create a result set that calculates the total transaction amount for each customer_id. From
-- this temporary result set (a derived table), calculate the overall average of these total amounts.
-- b) Using the same derived table concept from part (a), find the customer_id that has the maximum
-- total transaction amount.

SELECT AVG(total_amount) AS overall_average
FROM (
    SELECT customer_id, SUM(transaction_amount) AS total_amount
    FROM dena_records_x
    GROUP BY customer_id
) AS customer_totals;

SELECT customer_id, total_amount
FROM (
    SELECT customer_id, SUM(transaction_amount) AS total_amount
    FROM dena_records_x
    GROUP BY customer_id
) AS customer_totals
ORDER BY total_amount DESC
LIMIT 1;

-- 34. Contextual Data Display (Scalar and Correlated Subqueries in SELECT):
-- a) For every transaction in dena_records, display its transaction_id, its transaction_amount, and a
-- new column called max_overall_amount that shows the single highest transaction amount from the
-- entire table on every row.
-- b) For each customer in the customer_details table, display their full_name and a new
-- column total_transaction_value which calculates the sum of all transactions for that specific
-- customer. The calculation must be done by a correlated subquery in the SELECT clause.

SELECT transaction_id, 
       transaction_amount, 
       (SELECT MAX(transaction_amount) FROM dena_records_x) AS max_overall_amount
FROM dena_records_x;

SELECT full_name,
       (SELECT SUM(transaction_amount)
        FROM dena_records_x dr
        WHERE dr.customer_id = cd.customer_id) AS total_transaction_value
FROM customer_details_x cd;

-- 35. Multi-Criteria Intersection and Exclusion:
-- a) Find the full_name of all customers who are from 'Chicago' AND have made at least one
-- 'Withdrawal' transaction.
-- b) Find the full_name of all customers who are from 'Chicago' BUT have NOT made any 'Withdrawal'
-- transactions.

SELECT full_name
FROM customer_details_x cd
WHERE city = 'Chicago'
  AND customer_id IN (
      SELECT customer_id
      FROM dena_records_x
      WHERE transaction_type = 'Withdrawal'
  );
  
 SELECT full_name
FROM customer_details_x cd
WHERE city = 'Chicago'
  AND customer_id NOT IN (
      SELECT customer_id
      FROM dena_records_x
      WHERE transaction_type = 'Withdrawal'
  );
  

-- 36. Using Quantifiers (ANY, ALL):
-- a) Find the details of any transaction whose amount is greater than ANY transaction made by a
-- customer from California ('CA').
-- b) Find the details of any transaction whose amount is greater than ALL transactions made by
-- customers from California ('CA')

SELECT *
FROM dena_records_x
WHERE transaction_amount > ANY (
    SELECT transaction_amount
    FROM dena_records_x
    WHERE customer_id IN (
        SELECT customer_id
        FROM customer_details_x
        WHERE state = 'CA'
    )
);

SELECT *
FROM dena_records_x
WHERE transaction_amount > ALL (
    SELECT transaction_amount
    FROM dena_records_x
    WHERE customer_id IN (
        SELECT customer_id
        FROM customer_details_x
        WHERE state = 'CA'
    )
);

-- 37. Multi-Level Nested Subqueries:
-- a) Find all transaction details for the customer who has the most recently opened account (the
-- latest account_open_date).
-- b) Find the full_name and city of the customer who made the second-highest value transaction.
-- (Hint: This requires careful use of LIMIT and OFFSET within a subquery).

SELECT *
FROM dena_records_x
WHERE customer_id = (
    SELECT customer_id
    FROM customer_details_x
    ORDER BY account_open_date DESC
    LIMIT 1
);

SELECT full_name, city
FROM customer_details_x
WHERE customer_id = (
    SELECT customer_id
    FROM dena_records_x
    ORDER BY transaction_amount DESC
    LIMIT 1 OFFSET 1
);

-- 38. Self-Referential Analysis:
-- a) Find all customers who opened their account in the same month and year as 'Michael Brown'
-- (customer_id = 4), excluding Michael Brown himself from the results.
-- b) From the dena_records table, find all transactions that have a transaction_amount identical to at
-- least one other transaction in the table.

select *
from customer_details_x
where customer_id <> 4
and month(account_open_date) = (
                           select month(account_open_date)
                           from customer_details_x
                           where customer_id = 4
                           )
and year(account_open_date) = (
                           select year(account_open_date)
                           from customer_details_x
                           where customer_id = 4
);


select *
from dena_records_x
where transaction_amount in (
                select transaction_amount
                from dena_records_x
                group by transaction_amount
                having count(*) > 1
);

-- 39. Subqueries in Data Modification:
-- a) The bank wants to flag its top customer. First, add a new column status of type VARCHAR(20) to
-- the customer_details table. Then, write an UPDATE statement that sets the status to 'VIP' for the
-- customer who has the highest total transaction amount.
-- b) Write an UPDATE statement to set the status to 'At Risk' for all customers from 'New York' who
-- have made a withdrawal.

alter table customer_details_x
add column status varchar(20);

set sql_safe_updates = 0;

update customer_details_x
set status = 'VIP'
where customer_id = (
                  select customer_id
                  from dena_records_x
                  group by customer_id
                  order by sum(transaction_amount) desc
                  limit 1
);


update customer_details_x
set status = 'At Risk'
where city = 'New York'
and customer_id in (
              select customer_id
              from dena_records_x
              where transaction_type ='Withdrawal'
);

select *
from customer_details_x;


-- 40. Comprehensive Challenge:
-- a) Identify the customer_id of the customer whose single transaction amount is closest to the overall
-- average transaction amount. (Hint: This will involve calculating the absolute difference and finding
-- the minimum).
-- b) Using the customer_id found in part (a), retrieve that customer's full_name, city,
-- and account_type.

SELECT customer_id
FROM (
    SELECT customer_id,
           ABS(transaction_amount - (SELECT AVG(transaction_amount) FROM dena_records_x)) AS diff
    FROM dena_records_x
) AS sub
ORDER BY diff
LIMIT 1;

SELECT full_name, city, account_type
FROM customer_details_x
WHERE customer_id = (
    SELECT customer_id
    FROM (
        SELECT customer_id,
               ABS(transaction_amount - (SELECT AVG(transaction_amount) FROM dena_records_x)) AS diff
        FROM dena_records_x
    ) AS sub
    ORDER BY diff
    LIMIT 1
);


