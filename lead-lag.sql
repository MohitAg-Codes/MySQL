/* -------------------------- LEAD() & LAG()  --------------------------------*/



-- 1. Setup Database
DROP DATABASE IF EXISTS BankDemo;
CREATE DATABASE BankDemo;
USE BankDemo;

-- ==========================================
-- TABLE 1: BANKING CUSTOMERS (20 Records)
-- ==========================================
CREATE TABLE Banking_Customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(20),
    account_type VARCHAR(20),
    join_date DATE,
    branch VARCHAR(50),
    risk_score INT,
    is_active BOOLEAN
);

INSERT INTO Banking_Customers VALUES 
(1, 'John', 'Doe', 'john@mail.com', '555-0101', 'Savings', '2022-01-10', 'New York', 10, 1),
(2, 'Jane', 'Smith', 'jane@mail.com', '555-0102', 'Current', '2022-02-15', 'New York', 25, 1),
(3, 'Mike', 'Brown', 'mike@mail.com', '555-0103', 'Savings', '2022-03-20', 'Chicago', 5, 1),
(4, 'Sarah', 'Wilson', 'sarah@mail.com', '555-0104', 'Corporate', '2022-04-05', 'Chicago', 15, 1),
(5, 'David', 'Taylor', 'david@mail.com', '555-0105', 'Savings', '2022-05-12', 'Boston', 60, 0),
(6, 'Emily', 'Jones', 'emily@mail.com', '555-0106', 'Savings', '2022-06-01', 'Boston', 8, 1),
(7, 'Chris', 'White', 'chris@mail.com', '555-0107', 'Current', '2022-07-10', 'Seattle', 30, 1),
(8, 'Anna', 'Martin', 'anna@mail.com', '555-0108', 'Savings', '2022-08-15', 'Seattle', 12, 1),
(9, 'James', 'Thompson', 'james@mail.com', '555-0109', 'Corporate', '2022-09-01', 'Austin', 20, 1),
(10, 'Robert', 'Garcia', 'rob@mail.com', '555-0110', 'Savings', '2022-10-05', 'Austin', 45, 1),
(11, 'Linda', 'Martinez', 'linda@mail.com', '555-0111', 'Savings', '2022-11-20', 'Miami', 5, 1),
(12, 'William', 'Robinson', 'will@mail.com', '555-0112', 'Current', '2022-12-01', 'Miami', 18, 1),
(13, 'Elizabeth', 'Clark', 'liz@mail.com', '555-0113', 'Savings', '2023-01-10', 'Denver', 10, 1),
(14, 'Richard', 'Rodriguez', 'rich@mail.com', '555-0114', 'Corporate', '2023-02-14', 'Denver', 80, 0),
(15, 'Joseph', 'Lewis', 'joe@mail.com', '555-0115', 'Savings', '2023-03-05', 'Atlanta', 15, 1),
(16, 'Susan', 'Lee', 'sue@mail.com', '555-0116', 'Savings', '2023-04-01', 'Atlanta', 7, 1),
(17, 'Thomas', 'Walker', 'tom@mail.com', '555-0117', 'Current', '2023-05-20', 'Dallas', 22, 1),
(18, 'Margaret', 'Hall', 'maggie@mail.com', '555-0118', 'Savings', '2023-06-15', 'Dallas', 11, 1),
(19, 'Charles', 'Allen', 'charles@mail.com', '555-0119', 'Corporate', '2023-07-01', 'Phoenix', 25, 1),
(20, 'Karen', 'Young', 'karen@mail.com', '555-0120', 'Savings', '2023-08-10', 'Phoenix', 9, 1);

-- ==========================================
-- TABLE 2: BANKING TRANSACTIONS (20 Records)
-- ==========================================
-- Note: Designed with sequences for Customer 1 & 2 for LEAD/LAG examples
CREATE TABLE Banking_Transactions (
    txn_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    txn_date DATE,
    txn_type VARCHAR(20),
    amount DECIMAL(10, 2),
    channel VARCHAR(20), -- Mobile, ATM, Branch
    status VARCHAR(20), -- Success, Failed, Pending
    merchant VARCHAR(50),
    currency VARCHAR(3),
    flagged BOOLEAN,
    FOREIGN KEY (customer_id) REFERENCES Banking_Customers(customer_id)
);

INSERT INTO Banking_Transactions (customer_id, txn_date, txn_type, amount, channel, status, merchant, currency, flagged) VALUES
(1, '2023-10-01', 'Deposit', 5000.00, 'Branch', 'Success', NULL, 'USD', 0),
(1, '2023-10-02', 'Withdrawal', 200.00, 'ATM', 'Success', NULL, 'USD', 0),
(1, '2023-10-05', 'Purchase', 150.00, 'Online', 'Success', 'Amazon', 'USD', 0),
(1, '2023-10-08', 'Purchase', 200.00, 'Card', 'Success', 'Walmart', 'USD', 0),
(1, '2023-10-15', 'Deposit', 1000.00, 'Mobile', 'Success', NULL, 'USD', 0),
(1, '2023-10-20', 'Withdrawal', 500.00, 'ATM', 'Success', NULL, 'USD', 0),
(2, '2023-10-01', 'Deposit', 10000.00, 'Wire', 'Success', NULL, 'USD', 0),
(2, '2023-10-03', 'Purchase', 500.00, 'Card', 'Success', 'Apple Store', 'USD', 0),
(2, '2023-10-03', 'Purchase', 60.00, 'Card', 'Success', 'Uber', 'USD', 0),
(2, '2023-10-10', 'Transfer', 2000.00, 'Mobile', 'Failed', NULL, 'USD', 1), -- Failed/Flagged for Stored Proc
(2, '2023-10-11', 'Transfer', 2000.00, 'Mobile', 'Success', NULL, 'USD', 0),
(3, '2023-10-05', 'Deposit', 300.00, 'Branch', 'Success', NULL, 'USD', 0),
(3, '2023-10-07', 'Withdrawal', 50.00, 'ATM', 'Success', NULL, 'USD', 0),
(3, '2023-10-09', 'Purchase', 20.00, 'Online', 'Success', 'Netflix', 'USD', 0),
(4, '2023-10-01', 'Deposit', 50000.00, 'Wire', 'Success', NULL, 'USD', 0),
(4, '2023-10-02', 'Purchase', 1200.00, 'CorpCard', 'Success', 'Delta Air', 'USD', 0),
(5, '2023-10-12', 'Withdrawal', 100.00, 'ATM', 'Success', NULL, 'USD', 0),
(6, '2023-10-15', 'Deposit', 500.00, 'Branch', 'Pending', NULL, 'USD', 0),
(7, '2023-10-20', 'Purchase', 45.00, 'Card', 'Success', 'Shell Gas', 'USD', 0),
(8, '2023-10-21', 'Deposit', 1200.00, 'Mobile', 'Success', NULL, 'USD', 0);

SELECT * FROM Banking_Customers;
SELECT * FROM Banking_Transactions;


/*
To teach this effectively, I recommend using the analogy of "Time Travel" or "Standing in a Line."

In standard SQL (like SELECT *), the database looks at one row at a time. 
It has "tunnel vision"—it doesn't know what happened in the row before or the row after.

LEAD and LAG break this rule. They allow a row to "peek" at its neighbors.

1. What is LAG? (The "Rearview Mirror")
Concept: LAG lets you look backwards. It retrieves data from the previous row in your result set.

The Analogy: Imagine you are standing in a queue at the bank. You are the "Current Row." LAG allows you to tap the shoulder of the person standing behind you and ask, "How much money are you depositing?"

In Banking: It is used to compare Today vs. Yesterday.

Example: "Today I spent $200. LAG tells me that yesterday I spent $150. Therefore, I spent $50 more today."

---------------------------------------------------------------------------------------------

2. What is LEAD? (The "Crystal Ball")

Concept: LEAD lets you look forwards. 
It retrieves data from the next row in your result set.

The Analogy: Still in that queue. You are the "Current Row." 
LEAD allows you to tap the shoulder of the person in front of you and ask, "Hey, what are you doing?"

In Banking: It is used to foresee What happens next.

Example: "I just deposited $500. LEAD tells me the very next transaction is a Withdrawal of $500. 
This looks suspicious (money in, money out immediately)."
*/

/*
When do we use them? (Real-world Business Cases)

You use these whenever the sequence of data matters.

Calculating Differences (Delta):

Question: "Did our sales grow compared to last month?"
Solution: Use LAG to get last month's sales and subtract it from this month's.

Calculating Intervals/Durations:

Question: "How many days does it take this customer to return to the bank?"
Solution: Use LEAD to find the next visit date, then subtract today's date.

Detecting Patterns:

Question: "Is the customer's balance consistently dropping?"
Solution: Compare current balance with LAG (previous) balance.

The "Partition" Rule (Important Concept)

If you look at the LAG (previous row) for Customer A, you don't want to accidentally see a transaction from Customer B.
SQL handles this using PARTITION BY, which effectively says: "Treat every customer's history as a separate timeline."

*/


/*
Scenario 1: Predicting the Next Transaction Amount
Concept: Just showing the current amount and the next amount in the same row. 
Business Question: "For every transaction, show me the amount of the next transaction the customer will make."
*/
SELECT  customer_id, txn_date,amount AS current_amount,
LEAD(amount) OVER (PARTITION BY customer_id ORDER BY txn_date) AS next_transaction_amount
FROM Banking_Transactions;

/*
Look at Customer 1.
Row 1 shows $5000. The next_transaction_amount column will show $200 (which is actually the amount from Row 2).
Why is the last row NULL? Ask the students this. (Answer: Because there is no "future" after the last record).
*/



/*
Scenario 2: Calculating Days Between Visits

We use LEAD to get the next date, then subtract the current date. 

Business Question: "How many days does it take for a customer to return to the bank for their next transaction?"
*/

SELECT  customer_id, txn_date AS current_visit,
LEAD(txn_date) OVER (PARTITION BY customer_id ORDER BY txn_date) AS next_visit,
    
    -- Calculate the difference
DATEDIFF(
        LEAD(txn_date) OVER (PARTITION BY customer_id ORDER BY txn_date), 
        txn_date
    ) AS days_until_next_visit
FROM Banking_Transactions;

/*
Breakdown of the above code : 

Objective : 
"Find out how many days pass between a customer's visits."

LEAD(txn_date) OVER (PARTITION BY customer_id ORDER BY txn_date)

LEAD(txn_date):
Instruction: "Look at the NEXT row and grab the value in the txn_date column."
Analogy: You are standing on Monday. You look forward to see that your next appointment is on Friday.

OVER (...):
This defines the "Window" or the "Scope" of how we look at the data.


PARTITION BY customer_id:
Instruction: "Group the data by Customer first."
Why? We don't want to compare Customer A's visit on Monday with Customer B's visit on Tuesday. We want to restart the calculation for every new customer.
Visual: Imagine separating a deck of cards into piles for each suit.

ORDER BY txn_date:
Instruction: "Sort the transactions chronologically."
Why? To know what "Next" means, the events must be in order of time. You can't predict the future if your timeline is scrambled.


DATEDIFF( [Future Date] , [Current Date] )
The query wraps the LEAD function inside DATEDIFF.
Logic: Next_Visit_Date - Current_Visit_Date = Days_Waited.

Why is the last row for every customer NULL?" 
Because LEAD tries to look into the future, but for the very last transaction, 
there is no future record recorded yet. Therefore, the result is empty (NULL).

Row # Current Date (txn_date)	            LEAD Logic (The "Peek")	                                  Calculation (DATEDIFF)
1	 2023-10-01	        "I look at Row 2. The date is 2023-10-02."	                            2023-10-02 - 2023-10-01 = 1 Day
2	2023-10-02	       "I look at Row 3. The date is 2023-10-05."	                              2023-10-05 - 2023-10-02 = 3 Days
3	2023-10-05	       "I look at Row 4. The date is 2023-10-08."	                               2023-10-08 - 2023-10-05 = 3 Days
...	...	...	...
Last	2023-10-20	"I look forward... but there are no more rows!"	NUL
*/


/*
Scenario 3: Detecting Deposit -> Withdrawal
Concept: Using LEAD to check the type of the next action. 
Business Question: "Identify transactions where a customer Deposits money and immediately Withdraws it in their very next step."

*/

WITH NextAction AS (
    SELECT 
        customer_id,
        txn_date,
        txn_type AS current_action,
        amount,
        -- Look ahead to see what the NEXT action type is
        LEAD(txn_type) OVER (PARTITION BY customer_id ORDER BY txn_date) AS next_action
    FROM Banking_Transactions
)
SELECT * FROM NextAction
WHERE current_action = 'Deposit' AND next_action = 'Withdrawal';

-- On 2023-10-01 Customer 1  made a Deposit. LEAD tells us the next action was a Withdrawal. This query will catch that row.


-- LAG()

/*
What is LAG?

Definition: LAG() allows you to access data from a previous row in the same result set without using a complex self-join.

When do we use it?
Calculating Growth/Decline: "Did I earn more today than yesterday?"
Calculating Moving Differences: "How many days has it been since the last time this customer visited?"
Detecting Changes: "The status was 'Pending' in the last row, now it is 'Failed'."
*/

/*
Scenario 1: Comparing Amounts
Concept: Calculating the difference (Delta) between the current transaction and the previous one. 
Business Question: "Is the customer spending more or less than they did in their previous transaction? Show me the difference."
*/

SELECT  customer_id, txn_date,amount AS current_amount,
    -- 1. Get the previous amount
LAG(amount) OVER (PARTITION BY customer_id ORDER BY txn_date) AS previous_amount,
    -- 2. Calculate the difference
amount - LAG(amount) OVER (PARTITION BY customer_id ORDER BY txn_date) AS difference
FROM Banking_Transactions;


/*
"Find out how much the transaction amount has changed compared to the previous time the customer used the bank."

LAG(amount) OVER (PARTITION BY customer_id ORDER BY txn_date
LAG(amount):
Instruction: "Look at the row behind me and grab the value in the amount column."
Analogy: Driving with a rearview mirror. You are moving forward, but checking what you just passed.

PARTITION BY customer_id:
Instruction: "Group the history by Customer."
Why? This creates a "fence" around each customer.
When the code calculates for Customer 1, it will never accidentally look at a record from Customer 2, even if Customer 2's transaction happened right before.


ORDER BY txn_date:
Instruction: "Sort the events by time."
Why? To define what "Previous" means, the data must be chronological.

amount - LAG(...)
Current Amount: The money in the specific row we are looking at right now.
Previous Amount (LAG): The money from the row above.
The Math: Current - Previous = Difference.

*/


/*
Scenario 2: Days Since Last Visit
Concept: Measuring the gap between historical events. 
Business Question: "How many days passed between the customer's previous visit and their current visit?"
*/

SELECT  customer_id,txn_date AS current_visit,
    -- 1. Get the previous visit date
LAG(txn_date) OVER (PARTITION BY customer_id ORDER BY txn_date) AS previous_visit,
    
    -- 2. Calculate the gap
DATEDIFF(
        txn_date, 
        LAG(txn_date) OVER (PARTITION BY customer_id ORDER BY txn_date)
    ) AS days_since_last_visit
FROM Banking_Transactions;



/*
Scenario 3: Detecting Rapid Channel Switches
Concept: Comparing categorical data (text) to spot weird behavior.
Business Question: "Show me transactions where a customer switched channels (e.g., from Branch to ATM) compared to their last transaction."
*/

SELECT  customer_id, txn_date, channel AS current_channel,
LAG(channel) OVER (PARTITION BY customer_id ORDER BY txn_date) AS previous_channel,
    
    -- Logic to flag the switch
    CASE 
        WHEN channel != LAG(channel) OVER (PARTITION BY customer_id ORDER BY txn_date) 
        THEN 'Switched' 
        ELSE 'Same' 
    END AS channel_behavior
FROM Banking_Transactions;














