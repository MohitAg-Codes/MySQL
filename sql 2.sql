-- creating a database

CREATE DATABASE dena_bank;

-- make the db operational, use
USE dena_bank;

-- create a table
CREATE TABLE dena_records (
customer_id INT PRIMARY KEY,
customerName VARCHAR(25),
transaction_id INT,
transaction_date DATE,
transaction_amount DECIMAL(10,2),
transaction_type VARCHAR(20)
);


-- insert 10 records in the table

INSERT INTO dena_records (customer_id,customerName,transaction_id,transaction_date,transaction_amount,transaction_type) VALUES
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

-- show the table
SELECT * FROM dena_records;

select customer_id, customerName , transaction_type from dena_records;

-- SELECT RECORDS FROM TABLE;  -- * means selecting all the records
SELECT * FROM dena_records;

-- I only want to see selected number of columns

SELECT customer_id, customerName , transaction_type
FROM dena_records;


-- WHERE clause
-- it is used for filtering data while manipulation 

-- I want to filter out all the records whose transaction type is Withdrawal

SELECT *
FROM dena_records
WHERE transaction_type = 'Withdrawal';

-- I only want the customer names ... 
SELECT customer_id,customerName
FROM dena_records
WHERE transaction_type = 'Withdrawal';


-- Filter out all the records where the transaction_amount > 500

SELECT *
FROM dena_records
WHERE transaction_amount > 500;

SELECT customerName , transaction_amount
FROM dena_records
WHERE transaction_amount > 500;


-- Filter out all the records where the transaction_amount > 350 and their transaction_type is Deposit
-- AND condition

SELECT *
FROM dena_records
WHERE transaction_amount > 350 AND transaction_type='Deposit';

-- COUNT() : count the number of records that satisfy a condition 

SELECT COUNT(*)
FROM dena_records
WHERE transaction_amount > 350 AND transaction_type='Deposit';


-- Count all the records where the transaction amount is between 200 and 400 and transaction_date > 2024-01-05

-- ALIAS 'AS' [Representing the header by a different name]

SELECT COUNT(*) AS cust_records
FROM dena_records
WHERE transaction_amount >= 200 AND transaction_amount<=400 AND transaction_date > '2024-01-05';

-- Using BETWEEN clause for the above question 
SELECT COUNT(*) AS customer_Records
FROM dena_records
WHERE (transaction_amount BETWEEN 200 AND 400)
AND (transaction_date > '2024-01-05');


-- LIMIT : it limits the number of records that can be displayed in the output
SELECT *
FROM dena_records
WHERE transaction_amount >= 300
LIMIT 5;

-- IN operator : shortcut for multiple OR conditions on the same column

-- Filter out all the records where the customer name is John Doe, Jessica Miller and Chris Davis

SELECT *
FROM dena_records
WHERE customerName IN ('John Doe', 'Jessica Miller', 'Chris Davis');

-- OR condition : You need to satisfy either condition 
-- List all the transactions that are either for John Doe OR have amount over 700 USD

SELECT *
FROM dena_records
WHERE customerName = 'John Doe' OR transaction_amount > 700;


SELECT customerName , transaction_amount 
FROM dena_records
WHERE transaction_amount > 450;

-- ORDER BY -- Ordering and limiting the results

-- List all the transactions , ordered from highest transaction amount to the lowest transaction amount

SELECT * 
FROM dena_records
ORDER BY transaction_amount DESC;

-- List the 5 highest transactions 
SELECT * 
FROM dena_records
ORDER BY transaction_amount DESC
LIMIT 5;

-- List all the records where the transaction_type = Deposit and then list top 5 as per transaction amount

SELECT * 
FROM dena_records
WHERE transaction_type = "Deposit"
ORDER BY transaction_amount DESC
LIMIT 5;