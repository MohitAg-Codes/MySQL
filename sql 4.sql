use dena_bank;

-- Creating a table to store customer-specific details

CREATE TABLE customer_details (
    customer_id INT PRIMARY KEY,
    full_name VARCHAR(50),
    city VARCHAR(30),
    state VARCHAR(2), -- Storing state as a 2-letter abbreviation
    account_type VARCHAR(20),
    account_open_date DATE,
    email VARCHAR(50)
);

-- Inserting records for our 20 customers

-- This data logically connects to the dena_records table via customer_id

INSERT INTO customer_details (customer_id, full_name, city, state, account_type, account_open_date, email) VALUES
(1, 'John Doe', 'New York', 'NY', 'Checking', '2022-03-15', 'j.doe@email.com'),
(2, 'Jane Smith', 'Los Angeles', 'CA', 'Savings', '2021-11-20', 'j.smith@email.com'),
(3, 'Emily Johnson', 'New York', 'NY', 'Savings', '2023-01-10', 'e.johnson@email.com'),
(4, 'Michael Brown', 'Chicago', 'IL', 'Checking', '2022-08-01', 'm.brown@email.com'),
(5, 'Chris Davis', 'Los Angeles', 'CA', 'Checking', '2023-05-22', 'c.davis@email.com'),
(6, 'Jessica Miller', 'Houston', 'TX', 'Savings', '2021-06-30', 'j.miller@email.com'),
(7, 'Matthew Wilson', 'New York', 'NY', 'Checking', '2023-02-18', 'm.wilson@email.com'),
(8, 'Ashley Moore', 'Phoenix', 'AZ', 'Savings', '2022-12-05', 'a.moore@email.com'),
(9, 'Daniel Taylor', 'Chicago', 'IL', 'Savings', '2023-09-01', 'd.taylor@email.com'),
(10, 'Laura Anderson', 'Houston', 'TX', 'Checking', '2021-02-14', 'l.anderson@email.com'),
(11, 'James Thomas', 'New York', 'NY', 'Savings', '2022-07-19', 'j.thomas@email.com'),
(12, 'Patricia Jackson', 'Los Angeles', 'CA', 'Savings', '2023-10-25', 'p.jackson@email.com'),
(13, 'Robert White', 'Chicago', 'IL', 'Checking', '2021-04-12', 'r.white@email.com'),
(14, 'Linda Harris', 'Phoenix', 'AZ', 'Checking', '2023-08-11', 'l.harris@email.com'),
(15, 'David Martin', 'Houston', 'TX', 'Savings', '2022-01-29', 'd.martin@email.com'),
(16, 'Barbara Thompson', 'New York', 'NY', 'Savings', '2021-09-05', 'b.thompson@email.com'),
(17, 'Joseph Garcia', 'Los Angeles', 'CA', 'Checking', '2023-04-03', 'j.garcia@email.com'),
(18, 'Susan Martinez', 'Chicago', 'IL', 'Savings', '2022-05-16', 's.martinez@email.com'),
(19, 'Charles Robinson', 'Phoenix', 'AZ', 'Checking', '2021-10-30', 'c.robinson@email.com'),
(20, 'Karen Clark', 'Houston', 'TX', 'Savings', '2023-03-20', 'k.clark@email.com');

SELECT * FROM dena_records;
SELECT * FROM customer_details;

-- both the table have a common column -- primary key(customer id)

-- Total Count : COUNT() : to count all the rows
-- How many customer records are in our customer_details table ? 

SELECT COUNT(*) AS cust_records FROM customer_details;

-- Counting with distinct 
-- DISTINCT() clause used to count the unique non-null values 
-- How many unique cities are our customers from  ? 

SELECT DISTINCT city
FROM customer_details;

SELECT COUNT(DISTINCT city) AS unique_cities
FROM customer_details;

-- MIN() 
-- Finding the earliest date
-- What is the account opening date for our very first customer ? 

SELECT MIN(account_open_date)
FROM customer_details;

-- which is the least amount for deposit transaction

SELECT MIN(transaction_amount) AS min_transaction
FROM dena_records
WHERE transaction_type = "Deposit";

SELECT MAX(transaction_amount) AS max_transaction
FROM dena_records
WHERE transaction_type = "Deposit";

SELECT MIN(transaction_amount) AS min_transaction,
AVG(transaction_amount) AS avg_transaction,
 MAX(transaction_amount) AS max_transaction
FROM dena_records
WHERE transaction_type = "Deposit";

-- rounding off : ROUND(aggregate function , # of decimal places we want)

SELECT MIN(transaction_amount) AS min_transaction, 
ROUND(AVG(transaction_amount), 2) AS average_transaction,
MAX(transaction_amount) AS max_transaction
FROM dena_records
WHERE transaction_type = "Deposit";

-- How many customers are from Los Angeles and have a checking account ? 

SELECT COUNT(*) AS countCustomers
FROM customer_details
WHERE city = "Los Angeles" AND account_type = "Checking";
 
-- List the full names of customers from houston ordered alphabetically. 
SELECT full_name
FROM customer_details
WHERE city = "Houston" ORDER BY full_name ASC;

-- who is the single newest customer from california
SELECT full_name
FROM customer_details
WHERE state = "CA" 
ORDER BY account_open_date DESC
LIMIT 1;

-- GROUP BY : grouping of records which are similar and against which we map values
-- typically used with aggregate functions

-- How many transactions are there for each transaction_type ? 

SELECT transaction_type , COUNT(*) AS number_of_transactions
FROM dena_records
GROUP BY transaction_type;

-- Calculating totals for each group 
-- What is the total transaction amount for Deposit and Withdrawal separately ? 

SELECT transaction_type , SUM(transaction_amount) AS total_trans_amt
FROM dena_records
GROUP BY transaction_type;

-- What is the avg transaction amount for Deposit and Withdrawal separately ?  

SELECT transaction_type, 
ROUND(AVG(transaction_amount),2) AS avg_transaction_amount
FROM dena_records
GROUP BY transaction_type;

-- Finding the min/max within groups 
-- For each transaction type, what was the smallest and the largest transaction amount ?

SELECT transaction_type, 
MIN(transaction_amount) AS min_amount, MAX(transaction_amount) AS max_amount
FROM dena_records
GROUP BY transaction_type;


-- Filter out the top 5 records basis the total deposited amounts by the customers from highest to lowest

SELECT customerName , SUM(transaction_amount) AS total_amt_deposited
FROM dena_records
WHERE transaction_type = "Deposit" 
GROUP BY customerName
ORDER BY total_amt_deposited DESC
LIMIT 5;

