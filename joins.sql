CREATE DATABASE JOINS;

USE JOINS;
CREATE TABLE IF NOT EXISTS Transactions(
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    account_id INT,
    transaction_date DATE,
    transaction_type VARCHAR(20),
    amount DECIMAL(10, 2),
    description VARCHAR(100),
    category VARCHAR(50),
    merchant_name VARCHAR(50),
    merchant_location VARCHAR(100),
    transaction_status VARCHAR(20),
    card_type VARCHAR(20),
    currency VARCHAR(3),
    exchange_rate DECIMAL(10, 4),
    reference_number VARCHAR(50),
    FOREIGN KEY (account_id) REFERENCES Accounts(account_id)
);

INSERT INTO Transactions(account_id, transaction_date, transaction_type, amount, description, category, merchant_name, merchant_location, transaction_status, card_type, currency, exchange_rate, reference_number) VALUES
(1, '2024-01-01', 'Purchase', 50.00, 'Online shopping', 'Shopping', 'Amazon', 'Online', 'Completed', 'Visa', 'USD', 1.0, 'REF123456'),
(2, '2024-01-05', 'Withdrawal', 100.00, 'ATM withdrawal', 'Cash Withdrawal', 'ATM', 'Main Branch', 'Completed', 'Visa', 'USD', 1.0, 'REF234567'),
(3, '2024-01-10', 'Transfer', 200.00, 'Transfer to savings', 'Transfer', 'Savings Account', 'Main Branch', 'Completed', 'Mastercard', 'USD', 1.0, 'REF345678'),
(4, '2024-01-15', 'Purchase', 75.00, 'Grocery shopping', 'Groceries', 'Local Grocery Store', 'Local', 'Completed', 'Visa', 'USD', 1.0, 'REF456789'),
(5, '2024-01-20', 'Deposit', 500.00, 'Salary deposit', 'Income', 'Employer', 'Office', 'Completed', 'Visa', 'USD', 1.0, 'REF567890'),
(6, '2024-01-25', 'Purchase', 30.00, 'Coffee shop', 'Food & Drink', 'Starbucks', 'Main Street', 'Completed', 'Mastercard', 'USD', 1.0, 'REF678901'),
(7, '2024-02-01', 'Withdrawal', 200.00, 'ATM withdrawal', 'Cash Withdrawal', 'ATM', 'East Branch', 'Completed', 'Visa', 'USD', 1.0, 'REF789012'),
(8, '2024-02-05', 'Transfer', 150.00, 'Transfer to savings', 'Transfer', 'Savings Account', 'Main Branch', 'Completed', 'Mastercard', 'USD', 1.0, 'REF890123'),
(9, '2024-02-10', 'Purchase', 120.00, 'Electronics purchase', 'Shopping', 'Best Buy', 'Mall', 'Completed', 'Visa', 'USD', 1.0, 'REF901234'),
(10, '2024-02-15', 'Deposit', 800.00, 'Bonus deposit', 'Income', 'Employer', 'Office', 'Completed', 'Visa', 'USD', 1.0, 'REF012345'),
(11, '2024-02-20', 'Purchase', 45.00, 'Dinner at restaurant', 'Food & Drink', 'Restaurant', 'Downtown', 'Completed', 'Mastercard', 'USD', 1.0, 'REF123456'),
(12, '2024-02-25', 'Withdrawal', 300.00, 'ATM withdrawal', 'Cash Withdrawal', 'ATM', 'Main Branch', 'Completed', 'Visa', 'USD', 1.0, 'REF234567'),
(13, '2024-03-01', 'Transfer', 250.00, 'Transfer to savings', 'Transfer', 'Savings Account', 'East Branch', 'Completed', 'Mastercard', 'USD', 1.0, 'REF345678'),
(14, '2024-03-05', 'Purchase', 80.00, 'Clothing purchase', 'Shopping', 'Fashion Store', 'Mall', 'Completed', 'Visa', 'USD', 1.0, 'REF456789'),
(15, '2024-03-10', 'Deposit', 600.00, 'Bonus deposit', 'Income', 'Employer', 'Office', 'Completed', 'Visa', 'USD', 1.0, 'REF567890'),
(16, '2024-03-15', 'Purchase', 35.00, 'Gas station', 'Transportation', 'Gas Station', 'Highway', 'Completed', 'Mastercard', 'USD', 1.0, 'REF678901'),
(17, '2024-03-20', 'Withdrawal', 150.00, 'ATM withdrawal', 'Cash Withdrawal', 'ATM', 'East Branch', 'Completed', 'Visa', 'USD', 1.0, 'REF789012'),
(18, '2024-03-25', 'Transfer', 180.00, 'Transfer to savings', 'Transfer', 'Savings Account', 'Main Branch', 'Completed', 'Mastercard', 'USD', 1.0, 'REF890123'),
(19, '2024-03-30', 'Purchase', 90.00, 'Restaurant bill', 'Food & Drink', 'Restaurant', 'Downtown', 'Completed', 'Visa', 'USD', 1.0, 'REF901234'),
(20, '2024-04-05', 'Deposit', 700.00, 'Bonus deposit', 'Income', 'Employer', 'Office', 'Completed', 'Visa', 'USD', 1.0, 'REF012345');


-- Create Accounts table
CREATE TABLE IF NOT EXISTS Accounts (
    account_id INT AUTO_INCREMENT PRIMARY KEY,
    account_number VARCHAR(25),
    account_holder_name VARCHAR(50),
    account_balance DECIMAL(12, 2),
    account_type VARCHAR(20),
    branch_name VARCHAR(30),
    opened_date DATE,
    last_transaction_date DATE,
    account_status VARCHAR(20),
    overdraft_limit DECIMAL(12, 2),
    interest_rate DECIMAL(5, 2),
    monthly_fee DECIMAL(8, 2),
    credit_limit DECIMAL(12, 2),
    available_credit DECIMAL(12, 2),
    card_expiry_date DATE
);

INSERT INTO Accounts (account_number, account_holder_name, account_balance, account_type, branch_name, opened_date, last_transaction_date, account_status, overdraft_limit, interest_rate, monthly_fee, credit_limit, available_credit, card_expiry_date) VALUES
('123456789', 'John Doe', 5000.00, 'Savings', 'Main Branch', '2023-01-01', '2024-03-10', 'Active', 1000.00, 0.75, 0.00, NULL, NULL, '2025-01-01'),
('987654321', 'Jane Smith', 3500.00, 'Checking', 'East Branch', '2023-02-15', '2024-03-15', 'Active', 500.00, 0.50, 5.00, NULL, NULL, '2025-02-15'),
('456789123', 'Alice Johnson', 7000.00, 'Savings', 'Main Branch', '2023-03-20', '2024-03-20', 'Active', 1500.00, 0.80, 0.00, NULL, NULL, '2025-03-20'),
('789123456', 'Bob Williams', 2500.00, 'Checking', 'Downtown Branch', '2023-04-25', '2024-03-25', 'Active', 300.00, 0.60, 5.00, NULL, NULL, '2025-04-25'),
('321654987', 'Emily Brown', 6000.00, 'Savings', 'East Branch', '2023-05-30', '2024-03-30', 'Active', 1200.00, 0.75, 0.00, NULL, NULL, '2025-05-30'),
('654987321', 'Michael Lee', 4000.00, 'Checking', 'Main Branch', '2023-06-05', '2024-03-05', 'Active', 800.00, 0.50, 5.00, NULL, NULL, '2025-06-05'),
('987321654', 'Sophia Davis', 5500.00, 'Savings', 'Downtown Branch', '2023-07-10', '2024-03-10', 'Active', 1000.00, 0.80, 0.00, NULL, NULL, '2025-07-10'),
('654321987', 'James Wilson', 3000.00, 'Checking', 'East Branch', '2023-08-15', '2024-03-15', 'Active', 500.00, 0.60, 5.00, NULL, NULL, '2025-08-15'),
('123987456', 'Olivia Martinez', 6500.00, 'Savings', 'Main Branch', '2023-09-20', '2024-03-20', 'Active', 1500.00, 0.75, 0.00, NULL, NULL, '2025-09-20'),
('789654123', 'William Taylor', 2000.00, 'Checking', 'Downtown Branch', '2023-10-25', '2024-03-25', 'Active', 300.00, 0.50, 5.00, NULL, NULL, '2025-10-25'),
('456321789', 'Isabella Anderson', 5000.00, 'Savings', 'East Branch', '2023-11-30', '2024-03-30', 'Active', 1200.00, 0.80, 0.00, NULL, NULL, '2025-11-30'),
('987456321', 'Benjamin Thomas', 3500.00, 'Checking', 'Main Branch', '2023-12-05', '2024-03-05', 'Active', 800.00, 0.60, 5.00, NULL, NULL, '2025-12-05'),
('321789654', 'Charlotte Rodriguez', 6000.00, 'Savings', 'Downtown Branch', '2024-01-10', '2024-03-10', 'Active', 1000.00, 0.75, 0.00, NULL, NULL, '2026-01-10'),
('654123987', 'Daniel Garcia', 4000.00, 'Checking', 'East Branch', '2024-02-15', '2024-03-15', 'Active', 500.00, 0.50, 5.00, NULL, NULL, '2026-02-15'),
('789456123', 'Mia Lopez', 5500.00, 'Savings', 'Main Branch', '2024-03-20', '2024-03-20', 'Active', 1500.00, 0.80, 0.00, NULL, NULL, '2026-03-20'),
('654789321', 'David Martinez', 3000.00, 'Checking', 'Downtown Branch', '2024-04-25', '2024-03-25', 'Active', 300.00, 0.60, 5.00, NULL, NULL, '2026-04-25'),
('321456987', 'Ella Hernandez', 6500.00, 'Savings', 'East Branch', '2024-05-30', '2024-03-30', 'Active', 1200.00, 0.75, 0.00, NULL, NULL, '2026-05-30'),
('987654123', 'Alexander King', 2000.00, 'Checking', 'Main Branch', '2024-06-05', '2024-03-05', 'Active', 800.00, 0.50, 5.00, NULL, NULL, '2026-06-05'),
('654321987', 'Scarlett Young', 5000.00, 'Savings', 'Downtown Branch', '2024-07-10', '2024-03-10', 'Active', 1000.00, 0.80, 0.00, NULL, NULL, '2026-07-10'),
('321987654', 'Luke Allen', 3500.00, 'Checking', 'East Branch', '2024-08-15', '2024-03-15', 'Active', 500.00, 0.60, 5.00, NULL, NULL, '2026-08-15');

SELECT * FROM Accounts;
SELECT * FROM Transactions;

-- inner join 
SELECT t.transaction_id,t.account_id,t.transaction_date,t.transaction_type,t.amount,t.description,
t.category,t.merchant_name,t.merchant_location,t.transaction_status,t.card_type,t.currency,t.exchange_rate,t.reference_number,a.account_number,
a.account_holder_name,a.account_balance,a.account_type,a.branch_name,a.opened_date,a.last_transaction_date,a.account_status,
a.overdraft_limit,a.interest_rate,a.monthly_fee,a.credit_limit,a.available_credit,a.card_expiry_date
FROM Transactions t  
INNER JOIN Accounts a ON t.account_id = a.account_id;

-- for each account id , show me what amount have they spent, in which category , what card_type,
-- and also update their account_status, interest rate  and their current branch they are operatin from

select t.account_id, t.amount, t.category, t.card_type, a.account_status, a.interest_rate, a.branch_name
from transactions t
inner join accounts a on t.account_id = a.account_id;


SELECT t.transaction_id,t.account_id,t.transaction_date,t.transaction_type,t.amount,
t.description,t.category,t.merchant_name,t.merchant_location,t.transaction_status,t.card_type,t.currency,
t.exchange_rate,t.reference_number,a.account_number,a.account_holder_name,a.account_balance,
a.account_type,a.branch_name,a.opened_date,a.last_transaction_date,a.account_status,a.overdraft_limit,a.interest_rate,a.monthly_fee,a.credit_limit,
a.available_credit,a.card_expiry_date
FROM Transactions t
LEFT JOIN Accounts a ON t.account_id = a.account_id;
    
    

SELECT a.account_id,a.account_number,a.account_holder_name,a.account_balance,a.account_type,a.branch_name,a.opened_date,
a.last_transaction_date,a.account_status,a.overdraft_limit,a.interest_rate,a.monthly_fee,
a.credit_limit,a.available_credit,a.card_expiry_date,t.transaction_id,t.transaction_date,
t.transaction_type,t.amount,t.description,t.category,t.merchant_name,t.merchant_location,t.transaction_status,
t.card_type,t.currency,t.exchange_rate,t.reference_number
FROM Accounts a
RIGHT JOIN Transactions t ON a.account_id = t.account_id;


SELECT a.account_id,a.account_number,a.account_holder_name,a.account_balance,
a.account_type,a.branch_name,a.opened_date,a.last_transaction_date,a.account_status,
a.overdraft_limit,a.interest_rate,a.monthly_fee,a.credit_limit,a.available_credit,
a.card_expiry_date,t.transaction_id,t.transaction_date,t.transaction_type,
t.amount,t.description,t.category,t.merchant_name,t.merchant_location,t.transaction_status,t.card_type,
t.currency,t.exchange_rate,t.reference_number
FROM Accounts a
UNION Transactions t ON a.account_id = t.account_id;


-- UNION BETWEEN LEFT AND RIGHT JOIN -- FULL OUTER JOIN
SELECT t.transaction_id,t.account_id,t.transaction_date,t.transaction_type,t.amount,
t.description,t.category,t.merchant_name,t.merchant_location,t.transaction_status,t.card_type,t.currency,
t.exchange_rate,t.reference_number,a.account_number,a.account_holder_name,a.account_balance,
a.account_type,a.branch_name,a.opened_date,a.last_transaction_date,a.account_status,a.overdraft_limit,a.interest_rate,a.monthly_fee,a.credit_limit,
a.available_credit,a.card_expiry_date
FROM Transactions t
LEFT JOIN Accounts a ON t.account_id = a.account_id
UNION ALL -- full outer JOIN
SELECT a.account_id,a.account_number,a.account_holder_name,a.account_balance,a.account_type,a.branch_name,a.opened_date,
a.last_transaction_date,a.account_status,a.overdraft_limit,a.interest_rate,a.monthly_fee,
a.credit_limit,a.available_credit,a.card_expiry_date,t.transaction_id,t.transaction_date,
t.transaction_type,t.amount,t.description,t.category,t.merchant_name,t.merchant_location,t.transaction_status,
t.card_type,t.currency,t.exchange_rate,t.reference_number
FROM Accounts a
RIGHT JOIN Transactions t ON a.account_id = t.account_id;
