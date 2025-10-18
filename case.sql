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