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