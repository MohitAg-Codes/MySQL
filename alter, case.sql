-- ------------------------------------------------------------------------------------------------
-- UPDATE: Modifies existing rows in a table.
-- DELETE: Removes existing rows from a table.
-- ALTER: Changes the structure of a table itself (like adding or removing columns).
-- SET: This isn't a standalone command but is the keyword used with UPDATE to specify what to change.

-- These commands are powerful and can permanently change your data


-- UPDATE - Modifying Existing Data
-- The UPDATE statement is used to modify existing records in a table.

-- Syntax: UPDATE table_name SET column1 = value1, column2 = value2, ... WHERE condition;

-- Question 1: Simple Update (One Row, One Column)
-- Customer John Doe (customer_id = 1) has moved from New York to a new city, 'Brooklyn'. 
-- Update his record in the customer_details table.

use dena_bank;
SELECT * FROM customer_details;

UPDATE customer_details
SET city = 'Brooklyn'
WHERE customer_id = 1;

-- UPDATE customer_details: We specify which table to modify.
-- SET city = 'Brooklyn': We tell SQL which column to change and what the new value should be.
-- WHERE customer_id = 1: This is the most important part. 
-- It isolates the change to only the row for John Doe. 
-- Without this, you would change the city for every customer to 'Brooklyn'!


-- Question 2: Updating Multiple Columns
-- Customer Jessica Miller (customer_id = 6) has gotten married and is changing her account type.
-- Her new name is 'Jessica Williams' and her new account type is 'Checking'. Update her record.

UPDATE customer_details
SET full_name = 'Jessica Williams',
    account_type = 'Checking'
WHERE customer_id = 6;

-- You can update multiple columns in a single UPDATE statement by separating each column = value pair with a comma. 
-- The WHERE clause still ensures only Jessica's record is affected.

-- Question 3: Updating Multiple Rows
-- The bank has decided to upgrade all 'Checking' accounts in 'Chicago' to a new 'Premier Checking' account type. 
-- Update all relevant records.

-- PS : you might get 1175 error here, which is common in mysql 
-- it is because the "Safe Update Mode" feature is on , which prevents from accidentally
-- updating ot deleting  a large number of rows without explicitly targetting using primary key 
-- Your WHERE clause (WHERE city = 'Chicago' AND account_type = 'Checking') does not include a condition on a KEY column (like a PRIMARY KEY or UNIQUE KEY).
--  For our customer_details table, the PRIMARY KEY is customer_id.

-- Since your WHERE clause (city = 'Chicago' AND account_type = 'Checking') could potentially match multiple rows (as it correctly does here), Safe Update Mode kicks in as a safeguard.

-- first set updates to 0 and then run 

SET SQL_SAFE_UPDATES = 0;

UPDATE customer_details
SET account_type = 'Premier Checking'
WHERE city = 'Chicago' AND account_type = 'Checking';


-- Part 2: ALTER TABLE - Changing the Table Structure
-- The ALTER TABLE statement is used to add, delete, or modify columns in an existing table. 
-- This is part of DDL (Data Definition Language).


-- Question 5: Adding a Column
-- We need to store a phone number for our customers. 
-- Add a new column called phone_number to the customer_details table. 
-- It should be able to store up to 15 characters.

ALTER TABLE customer_details
ADD COLUMN phone_number VARCHAR(15);

SELECT * FROM customer_details;
-- ALTER TABLE customer_details: Specifies the table to change.
-- ADD COLUMN phone_number VARCHAR(15): Defines the new column's name and its data type.
--  After running this, all existing rows will have NULL in the new phone_number column.


-- Question 6: Modifying a Column
-- We realize that 50 characters might not be enough for some customer names.
-- Modify the full_name column to allow up to 100 characters.
desc customer_details;

ALTER TABLE customer_details
MODIFY COLUMN full_name VARCHAR(100);

SELECT * FROM customer_details;

-- MODIFY COLUMN allows you to change the data type or constraints of an existing column. Here, we're simply increasing its size.


-- Question 7: Adding a Column with a Default Value
-- Let's add a status column to the dena_records table to track if a transaction is 'Completed', 'Pending', or 'Failed'.
--  By default, all new transactions should be 'Completed'.

ALTER TABLE dena_records
ADD COLUMN status VARCHAR(10) DEFAULT 'Completed';

SELECT * FROM dena_records;

-- The DEFAULT keyword is very useful. 
-- When you add this column, all 20 existing records will automatically be given the value 'Completed' in the new status column. 
-- Any new records inserted without a specified status will also get this default value.


-- Question 8: Dropping a Column
-- We've decided the customerName column in dena_records is redundant, 
-- since we can get the name from customer_details using the customer_id. Remove the customerName column.

ALTER TABLE dena_records
DROP COLUMN customerName;

SELECT * FROM dena_records;

-- DROP COLUMN permanently removes a column and all the data within it.
--  Be very careful with this command, as it cannot be easily undone.


-- Part 3: DELETE - Removing Data
-- The DELETE statement is used to remove existing records from a table. 
-- This is the most dangerous command you will learn today.

-- SAFETY FIRST: The SELECT before you DELETE Rule
-- Before you run a DELETE command, it is a best practice to write a SELECT * FROM ... statement with the exact same WHERE clause. 
-- This will show you precisely which rows you are about to delete.

-- Question 9: Deleting a Single Row
-- Customer Patricia Jackson (customer_id = 12) has closed her account. 
-- Delete her transaction from the dena_records table.

-- Step 1: The Safety SELECT
SELECT * FROM dena_records WHERE customer_id = 12;
-- Check the output. Is this the exact row you want to delete? Yes.

-- Step 2: The DELETE Statement
DELETE FROM dena_records
WHERE customer_id = 12;

SELECT * FROM dena_records;  -- you can see the customer_id = 12 is now deleted

-- Just like with UPDATE, the WHERE clause is essential. It targets only the record for customer 12 for deletion.


-- Question 10: Deleting Multiple Rows
-- We need to clean up old, small withdrawal transactions. 
-- Delete all 'Withdrawal' records from dena_records where the transaction_amount was less than $100.

-- Step 1: The Safety SELECT
SELECT * FROM dena_records
WHERE transaction_type = 'Withdrawal' AND transaction_amount < 100;
-- Check the output. You should see two records 

-- Step 2: The DELETE Statement
DELETE FROM dena_records
WHERE transaction_type = 'Withdrawal' AND transaction_amount < 100;

SELECT * FROM dena_records;

-- The WHERE clause finds the two rows that meet both conditions and deletes them.

-- Question 11: The Ultimate Danger - DELETE without WHERE
-- What would happen if you ran the following query? (Again, do not run this!)

DELETE FROM dena_records;

-- This is the most destructive command in this lesson.
-- With no WHERE clause, this query will delete EVERY SINGLE ROW from the dena_records table.
--  The table structure will remain, but it will be completely empty. There is usually no "undo" button in a database.
--  Always, always, always use a WHERE clause with DELETE unless you are absolutely certain you want to clear an entire table.


-- 	CASE statement
-- What is the CASE statement?
-- Think of it as a way to create a temporary, new column in your results based on a set of rules.
--  It allows you to run IF...THEN...ELSE logic on the values in a column and return a custom result 
-- for each row.

-- It's perfect for things like:
-- Categorizing data into groups (e.g., 'High', 'Medium', 'Low').
-- Translating codes into human-readable text (e.g., turning 'NY' into 'New York').
-- Creating custom labels based on multiple conditions.


-- Basic Syntax

/*

CASE
    WHEN condition1 THEN result1
    WHEN condition2 THEN result2
    ...
    ELSE else_result
END AS new_column_name

CASE: Starts the statement.
WHEN condition THEN result: This is your "IF...THEN..." part. 
You can have as many WHEN clauses as you need. The query checks them in order and stops at the first one that is true.
ELSE: This is the fallback, like the "ELSE" in programming. If none of the WHEN conditions are met, this result is used. It's optional, and if you don't include it, the result will be NULL.
END: Finishes the statement.
AS new_column_name: It's crucial to give your new CASE column a name using an alias!

*/

CREATE TABLE dena_records_x (
customer_id INT PRIMARY KEY,
customerName VARCHAR(25),
transaction_id INT ,
transaction_date DATE,
transaction_amount DECIMAL(10,2),
transaction_type VARCHAR(20)
);


-- insert 10 records in the table
-- INSERT INTO <table_name> (column_names) VALUES ()
INSERT INTO dena_records_x (customer_id,customerName,transaction_id,transaction_date,transaction_amount,transaction_type) VALUES
(1, 'John Doe', 1001, '2024-01-01', 150.75, 'Deposit'),
(2, 'Jane Smith', 1002, '2024-01-02', 200.00, 'Withdrawal'),
(3, 'Emily Johnson', 1003, '2024-01-03', 50.50, 'Deposit'),
(4, 'Michael Brown', 1004, '2024-01-04', 400.00, 'Deposit'),
(5, 'Chris Davis', 1005, '2024-01-05', 300.25, 'Withdrawal'),
(6, 'Jessica Miller', 1006, '2024-01-06', 100.00, 'Deposit'),
(7, 'Matthew Wilson', 1007, '2024-01-07', 600.75, 'Withdrawal'),
(8, 'Ashley Moore', 1008, '2024-01-08', 250.00, 'Deposit'),
(9, 'Daniel Taylor', 1009, '2024-01-09', 450.50, 'Deposit'),
(10, 'Laura Anderson', 1010, '2024-01-10', 50.00, 'Withdrawal'),
(11, 'James Thomas', 1011, '2024-01-11', 700.75, 'Deposit'),
(12, 'Patricia Jackson', 1012, '2024-01-12', 150.00, 'Withdrawal'),
(13, 'Robert White', 1013, '2024-01-13', 500.50, 'Deposit'),
(14, 'Linda Harris', 1014, '2024-01-14', 600.00, 'Deposit'),
(15, 'David Martin', 1015, '2024-01-15', 300.00, 'Withdrawal'),
(16, 'Barbara Thompson', 1016, '2024-01-16', 100.50, 'Deposit'),
(17, 'Joseph Garcia', 1017, '2024-01-17', 50.00, 'Withdrawal'),
(18, 'Susan Martinez', 1018, '2024-01-18', 700.00, 'Deposit'),
(19, 'Charles Robinson', 1019, '2024-01-19', 800.75, 'Withdrawal'),
(20, 'Karen Clark', 1020, '2024-01-20', 200.50, 'Deposit');

SELECT * FROM dena_records_x;

-- --------------------------------------------

CREATE TABLE customer_details_x (
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
INSERT INTO customer_details_x (customer_id, full_name, city, state, account_type, account_open_date, email) VALUES
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

SELECT * FROM customer_details_x;

-- Question 1: Categorizing Based on Ranges
-- Management wants to classify transactions from the dena_records table into different sizes. 
-- Write a query that shows the transaction_id, transaction_amount, 
-- and a new column transaction_size with the following rules:

-- Amount > 500: 'Large'
-- Amount between 200 and 500 (inclusive): 'Medium'
-- Amount < 200: 'Small'

SELECT
    transaction_id,
    transaction_amount,
    CASE 
        WHEN transaction_amount > 500 THEN 'Large'
        WHEN transaction_amount >= 200 AND transaction_amount <= 500 THEN 'Medium'
        WHEN transaction_amount < 200 THEN 'Small'
    END AS transaction_size
FROM
    dena_records_x;


-- Question 2: Using CASE with Aggregate Functions (COUNT)
-- Let's get a count of customers by region.
--  Create a report that groups customers into 'East Coast' (NY), 'West Coast' (CA, AZ), 
-- and 'Central/South' (IL, TX) and shows the number of customers in each group.

SELECT
    CASE
        WHEN state = 'NY' THEN 'East Coast'
        WHEN state IN ('CA', 'AZ') THEN 'West Coast'
        WHEN state IN ('IL', 'TX') THEN 'Central/South'
        ELSE 'Other'
    END AS region,
    COUNT(customer_id) AS number_of_customers
FROM
    customer_details
GROUP BY
    region;

/*
This is a very powerful technique. 
The CASE statement first assigns a region to each customer. 
Then, the GROUP BY clause uses this newly created alias (region) 
to group the rows and COUNT the customers within each group.

*/


/*

Question 4: Creating a Customer Loyalty Status
We want to label customers based on when they opened their account. Show the full_name, account_open_date, and a new loyalty_status column based on these rules:
Account opened before 2022: 'Veteran'
Account opened during 2022: 'Established'
Account opened in 2023 or later: 'New'

*/

SELECT
    full_name,
    account_open_date,
    CASE
        WHEN YEAR(account_open_date) < 2022 THEN 'Veteran'
        WHEN YEAR(account_open_date) = 2022 THEN 'Established'
        ELSE 'New'
    END AS loyalty_status
FROM
    customer_details;
    
/*

This example shows that you can use functions like YEAR() inside your WHEN conditions.
The ELSE clause is a great catch-all for any customers from 2023 or any future years, 
so we don't have to write a separate WHEN for them.
*/

/*
Question : Using CASE with SUM to Pivot Data
For the dena_records table, calculate the total amount of money from 'Deposits' 
and the total amount from 'Withdrawals' in a single row.
*/

SELECT
    SUM(CASE WHEN transaction_type = 'Deposit' THEN transaction_amount ELSE 0 END) AS total_deposits,
    SUM(CASE WHEN transaction_type = 'Withdrawal' THEN transaction_amount ELSE 0 END) AS total_withdrawals
FROM
    dena_records;


/*
CASE with GROUP BY and HAVING Questions
Question 7: Filtering by Regional Customer Count
Let's revisit the customer regions.
 Create a report that groups customers into 'East Coast' (NY), 'West Coast' (CA, AZ), 
 and 'Central/South' (IL, TX). From this, only show the regions that have more than 6 customers.
*/

SELECT
    CASE
        WHEN state = 'NY' THEN 'East Coast'
        WHEN state IN ('CA', 'AZ') THEN 'West Coast'
        WHEN state IN ('IL', 'TX') THEN 'Central/South'
        ELSE 'Other'
    END AS region,
    COUNT(customer_id) AS number_of_customers
FROM
    customer_details
GROUP BY
    region
HAVING
    COUNT(customer_id) > 6;

/*
Explanation:
CASE: The CASE statement first evaluates each row and assigns a region ('East Coast', 'West Coast', etc.).
GROUP BY region: The query then groups all the rows based on this new region label.
COUNT(customer_id): The number of customers in each region group is counted.
HAVING COUNT(...) > 6: Finally, the HAVING clause filters these grouped results,
 keeping only the rows where the customer count is greater than 6.
*/


-- Question 8: Filtering by Total Transaction Value of Size Categories
-- Using the dena_records table, first categorize transactions as small (<200),
-- Medium (200-500) and large (>500)
-- Then, calculate the total SUM amount  for each category. 
-- Finally, only display the categories where the total transaction amount is greater than $2500.

SELECT
    CASE
        WHEN transaction_amount > 500 THEN 'Large'
        WHEN transaction_amount >= 200 AND transaction_amount <= 500 THEN 'Medium'
        ELSE 'Small'
    END AS transaction_size,
    SUM(transaction_amount) AS total_value
FROM
    dena_records
GROUP BY
    transaction_size
HAVING
    SUM(transaction_amount) > 2500;


/*
Question 9: Finding Active Customer Loyalty Tiers
Categorize customers from the customer_details table as 'Veteran' (account opened before 2022), 
'Established' (opened in 2022), and 'New' (opened in 2023 or later). 
Show only the loyalty tiers that have at least 6 members.
*/

SELECT
    CASE
        WHEN YEAR(account_open_date) < 2022 THEN 'Veteran'
        WHEN YEAR(account_open_date) = 2022 THEN 'Established'
        ELSE 'New'
    END AS loyalty_status,
    COUNT(customer_id) AS number_of_members
FROM
    customer_details
GROUP BY
    loyalty_status
HAVING
    COUNT(customer_id) >= 6;
    


/*
Question 10: Analyzing Transaction Periods with WHERE, CASE, GROUP BY, and HAVING
This question combines everything! We want to analyze withdrawals only. 
First, categorize transactions into 'First Half' (day 1-15) and 'Second Half' (day 16-31) of the month. 
Then, calculate the average withdrawal amount for each period. 
Finally, only show the period if its average withdrawal amount was greater than $300.
*/


SELECT
    CASE
        WHEN DAY(transaction_date) <= 15 THEN 'First Half of Month'
        ELSE 'Second Half of Month'
    END AS month_period,
    AVG(transaction_amount) AS average_withdrawal
FROM
    dena_records
WHERE
    transaction_type = 'Withdrawal'
GROUP BY
    month_period
HAVING
    average_withdrawal > 300;
    
/*
Explanation:
This query demonstrates the full order of operations:
FROM: The query starts with the dena_records table.
WHERE: It first filters out all rows that are not 'Withdrawal' transactions.
CASE: On the remaining rows, it assigns a month_period to each transaction.
GROUP BY: It groups these withdrawal transactions into the 'First Half' and 'Second Half' buckets.
AVG(...): It calculates the average transaction amount for each of these two groups.
HAVING: It checks the calculated average for each group and finds that only the 'Second Half' has an average over $300.
*/
