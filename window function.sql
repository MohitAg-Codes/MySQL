
CREATE DATABASE IF NOT EXISTS Ecommerce_DB;
USE Ecommerce_DB;

-- Creating the Customers Table (No changes here)
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    RegistrationDate DATE,
    Country VARCHAR(50),
    City VARCHAR(50),
    LastLogin TIMESTAMP,
    CustomerSegment VARCHAR(20),
    TotalSpent DECIMAL(10, 2)
);

-- Creating the Payments Table 
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    CustomerID INT,
    OrderID INT,
    PaymentDate TIMESTAMP,
    Amount DECIMAL(10, 2),
    PaymentMethod VARCHAR(20),
    Status VARCHAR(20),
    DiscountApplied DECIMAL(5, 2),
    Currency VARCHAR(20), 
    TransactionNotes VARCHAR(255)
);

-- Inserting 30 Records into the Customers Table 
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, RegistrationDate, Country, City, LastLogin, CustomerSegment, TotalSpent) VALUES
(1, 'Aria', 'Valerius', 'aria.v@email.com', '2023-01-15', 'Aethelgard', 'Silvercrest', '2025-10-28 08:30:00', 'High-Value', 1500.00),
(2, 'Kael', 'Ironhand', 'kael.i@email.com', '2023-02-20', 'Dunmar', 'Stonehelm', '2025-10-27 15:45:12', 'New', 75.50),
(3, 'Lyra', 'Whisperwind', 'lyra.w@email.com', '2023-03-10', 'Elara', 'Moonhaven', '2025-10-28 09:00:00', 'Frequent', 850.25),
(4, 'Roric', 'Stonebeard', 'roric.s@email.com', '2023-04-05', 'Dunmar', 'Stonehelm', '2025-10-26 11:20:30', 'High-Value', 2200.00),
(5, 'Seraphina', 'Brightwood', 'sera.b@email.com', '2023-05-21', 'Aethelgard', 'Silvercrest', '2025-10-28 10:15:00', 'Frequent', 1230.75),
(6, 'Jax', 'Shadow-Walker', 'jax.s@email.com', '2023-06-12', 'Nocturne', 'Gloomshire', '2025-10-25 20:05:00', 'New', 50.00),
(7, 'Elara', 'Moonpetal', 'elara.m@email.com', '2023-07-19', 'Elara', 'Starfall', '2025-10-28 11:00:00', 'Frequent', 980.50),
(8, 'Gideon', 'Stormcaller', 'gideon.s@email.com', '2023-08-01', 'Aethelgard', 'Silvercrest', '2025-10-27 18:30:00', 'High-Value', 3500.00),
(9, 'Faye', 'Sunstrider', 'faye.s@email.com', '2023-09-08', 'Solara', 'Sunstone', '2025-10-28 12:45:00', 'New', 120.00),
(10, 'Bram', 'Grimjaw', 'bram.g@email.com', '2023-10-14', 'Dunmar', 'Irondeep', '2025-10-26 05:10:00', 'Frequent', 640.20),
(11, 'Isolde', 'Winterbourne', 'isolde.w@email.com', '2023-11-25', 'Frosthold', 'Icewind', '2025-10-28 14:00:00', 'High-Value', 1800.00),
(12, 'Lucian', 'Nightbreeze', 'lucian.n@email.com', '2023-12-30', 'Nocturne', 'Gloomshire', '2025-10-27 22:00:00', 'Frequent', 720.00),
(13, 'Astrid', 'Fireheart', 'astrid.f@email.com', '2024-01-09', 'Valoria', 'Dragons Peak', '2025-10-28 15:20:00', 'New', 250.00),
(14, 'Rowan', 'Oakenfield', 'rowan.o@email.com', '2024-02-18', 'Greenwood', 'Oakhaven', '2025-10-28 07:55:00', 'Frequent', 550.80),
(15, 'Morgana', 'Le Fay', 'morgana.l@email.com', '2024-03-22', 'Avalon', 'Misty Isle', '2025-10-26 13:00:00', 'High-Value', 4200.00),
(16, 'Darius', 'Blackwood', 'darius.b@email.com', '2024-04-13', 'Nocturne', 'Gloomshire', '2025-10-27 19:40:00', 'Frequent', 890.00),
(17, 'Cora', 'Seagazer', 'cora.s@email.com', '2024-05-07', 'Tidal Bay', 'Seaspray', '2025-10-28 16:10:00', 'New', 95.75),
(18, 'Finnian', 'Swiftfoot', 'finn.s@email.com', '2024-06-01', 'Greenwood', 'Whispering Woods', '2025-10-28 13:30:00', 'Frequent', 430.50),
(19, 'Zara', 'Sandsinger', 'zara.s@email.com', '2024-07-11', 'Sunstone', 'Mirage Oasis', '2025-10-27 10:00:00', 'High-Value', 2100.00),
(20, 'Gareth', 'Steelman', 'gareth.s@email.com', '2024-08-23', 'Aethelgard', 'Silvercrest', '2025-10-28 17:00:00', 'Frequent', 1100.00),
(21, 'Rhiannon', 'Moonshadow', 'rhiannon.m@email.com', '2024-09-05', 'Elara', 'Moonhaven', '2025-10-28 09:30:00', 'High-Value', 1950.00),
(22, 'Torvin', 'Stonefist', 'torvin.s@email.com', '2024-10-18', 'Dunmar', 'Stonehelm', '2025-10-26 08:00:00', 'New', 60.00),
(23, 'Silas', 'Riverbend', 'silas.r@email.com', '2024-11-02', 'Greenwood', 'Riverdell', '2025-10-28 18:20:00', 'Frequent', 780.90),
(24, 'Nia', 'Cloudwalker', 'nia.c@email.com', '2024-12-09', 'Aethelgard', 'Skyreach', '2025-10-27 14:50:00', 'High-Value', 3100.00),
(25, 'Orion', 'Starfinder', 'orion.s@email.com', '2025-01-14', 'Cosmos', 'Stardust City', '2025-10-28 19:00:00', 'New', 180.00),
(26, 'Vesper', 'Nightshade', 'vesper.n@email.com', '2025-02-27', 'Nocturne', 'Shadowfen', '2025-10-25 23:00:00', 'Frequent', 620.00),
(27, 'Talia', 'Sunstone', 'talia.s@email.com', '2025-03-19', 'Solara', 'Sunstone', '2025-10-28 20:15:00', 'High-Value', 2800.00),
(28, 'Kaelen', 'Windrider', 'kaelen.w@email.com', '2025-04-21', 'Aethelgard', 'Skyreach', '2025-10-27 16:00:00', 'New', 220.00),
(29, 'Seren', 'Starlight', 'seren.s@email.com', '2025-05-30', 'Elara', 'Starfall', '2025-10-28 21:00:00', 'Frequent', 910.40),
(30, 'Leoric', 'The Just', 'leoric.j@email.com', '2025-06-15', 'Aethelgard', 'Silvercrest', '2025-10-28 10:45:00', 'High-Value', 5000.00);


-- Inserting 30 Records into the Payments Table (No changes here)
INSERT INTO Payments (PaymentID, CustomerID, OrderID, PaymentDate, Amount, PaymentMethod, Status, DiscountApplied, Currency, TransactionNotes) VALUES
(101, 1, 201, '2025-10-28 08:35:10', 500.00, 'Credit Card', 'Completed', 50.00, 'Gold Coins', 'Purchase of enchanted robes'),
(102, 3, 202, '2025-10-28 09:05:22', 150.25, 'PayPal', 'Completed', 10.00, 'Silver Florins', 'Order of healing potions'),
(103, 5, 203, '2025-10-28 10:20:00', 300.75, 'Credit Card', 'Completed', 0.00, 'Gold Coins', 'Magical artifacts'),
(104, 8, 204, '2025-10-27 18:40:15', 1200.00, 'Bank Transfer', 'Completed', 100.00, 'Dragon Scales', 'Custom made grimoire'),
(105, 1, 205, '2025-10-28 08:40:00', 1000.00, 'Credit Card', 'Completed', 100.00, 'Gold Coins', 'Purchase of a flying carpet'),
(106, 11, 206, '2025-10-28 14:05:30', 800.00, 'PayPal', 'Completed', 50.00, 'Frost Gems', 'Enchanted ice sculpture'),
(107, 15, 207, '2025-10-26 13:10:00', 2500.00, 'Bank Transfer', 'Completed', 250.00, 'Gold Coins', 'Purchase of a rare crystal'),
(108, 4, 208, '2025-10-26 11:25:45', 2200.00, 'Credit Card', 'Completed', 200.00, 'Dwarven Runes', 'Masterwork axe'),
(109, 7, 209, '2025-10-28 11:05:18', 480.50, 'PayPal', 'Completed', 20.00, 'Silver Florins', 'Assorted spell components'),
(110, 20, 210, '2025-10-28 17:05:00', 600.00, 'Credit Card', 'Completed', 0.00, 'Gold Coins', 'Set of silver armor'),
(111, 2, NULL, '2025-10-27 15:50:00', 75.50, 'PayPal', 'Failed', 0.00, 'Silver Florins', 'Insufficient funds for phoenix feather'),
(112, 14, 212, '2025-10-28 08:00:50', 250.80, 'Credit Card', 'Completed', 15.00, 'Gold Coins', 'Wooden staff'),
(113, 24, 213, '2025-10-27 14:55:00', 1500.00, 'Bank Transfer', 'Completed', 150.00, 'Sky Crystals', 'Cloud-walking boots'),
(114, 9, 214, '2025-10-28 12:50:30', 120.00, 'PayPal', 'Completed', 5.00, 'Sunstone Shards', 'Sun-catching amulet'),
(115, 18, 215, '2025-10-28 13:35:00', 300.00, 'Credit Card', 'Completed', 25.00, 'Gold Coins', 'Leather boots of speed'),
(116, 27, 216, '2025-10-28 20:20:00', 1800.00, 'Bank Transfer', 'Pending', 0.00, 'Solara Diamonds', 'Payment for a sunforged sword'),
(117, 3, 217, '2025-10-28 09:10:00', 700.00, 'PayPal', 'Completed', 50.00, 'Silver Florins', 'Enchanted lute'),
(118, 6, 218, '2025-10-25 20:10:00', 50.00, 'Credit Card', 'Completed', 0.00, 'Shadow Coins', 'Lockpicking kit'),
(119, 12, 219, '2025-10-27 22:05:00', 400.00, 'PayPal', 'Completed', 30.00, 'Shadow Coins', 'Cloak of shadows'),
(120, 29, 220, '2025-10-28 21:05:00', 500.40, 'Credit Card', 'Completed', 40.00, 'Stardust', 'Telescope'),
(121, 15, 221, '2025-10-26 13:15:00', 1700.00, 'Bank Transfer', 'Completed', 150.00, 'Gold Coins', 'Ancient prophecy scroll'),
(122, NULL, 222, '2025-10-28 22:00:00', 100.00, 'Guest Checkout', 'Completed', 0.00, 'Gold Coins', 'Anonymous purchase of a map'),
(123, 21, 223, '2025-10-28 09:35:00', 950.00, 'PayPal', 'Completed', 75.00, 'Silver Florins', 'Moonstone circlet'),
(124, 30, 224, '2025-10-28 10:50:00', 3000.00, 'Bank Transfer', 'Completed', 300.00, 'Gold Coins', 'A legendary sword, ''Justice'''),
(125, 10, 225, '2025-10-26 05:15:00', 320.10, 'Credit Card', 'Completed', 20.00, 'Dwarven Runes', 'Mining equipment'),
(126, 16, 226, '2025-10-27 19:45:00', 500.00, 'PayPal', 'Completed', 40.00, 'Shadow Coins', 'A talking raven'),
(127, 25, 227, '2025-10-28 19:05:00', 180.00, 'Credit Card', 'Completed', 10.00, 'Stardust', 'A book of constellations'),
(128, NULL, 228, '2025-10-28 22:30:00', 75.00, 'Guest Checkout', 'Completed', 0.00, 'Gold Coins', 'Anonymous potion purchase'),
(129, 19, 229, '2025-10-27 10:05:00', 1100.00, 'Bank Transfer', 'Completed', 100.00, 'Sunstone Shards', 'A sand golem core'),
(130, 23, 230, '2025-10-28 18:25:00', 400.00, 'PayPal', 'Completed', 30.00, 'Gold Coins', 'A self-paddling canoe');


SELECT * FROM Customers;
SELECT * FROM Payments;


/* -------------------- WINDOW ANALYTIC FUNCTIONS ----------------------------------------*/


/*
What are Window Functions?
Window functions in MySQL perform calculations across a set of table rows that are related to the current row.
Unlike aggregate functions that return a single value for a group of rows,
window functions return a value for each row.
This is incredibly useful for tasks like creating rankings, calculating running totals, 
and finding moving averages, all while preserving the individual row details.


Why Use Window Functions?
Imagine you want to see a running total of sales or rank your customers by their spending without losing the detail of 
each individual transaction. Before window functions (available in MySQL 8.0 and later), 
this would have required complex self-joins or subqueries. 
Window functions provide a more efficient and readable way to perform these kinds of analyses.


Key Components of a Window Function:
The magic of window functions lies in the OVER() clause. 
This clause defines the "window" or set of rows the function will operate on. The OVER() clause has a few key parts:

PARTITION BY: This divides the rows into partitions or groups based on one or more columns. 
The window function is then applied independently to each partition.

ORDER BY: This specifies the order of rows within each partition, which is crucial for functions that rely on a specific sequence, 
like ranking or running totals.

Key Components of a Window Function:
The magic of window functions lies in the OVER() clause. This clause defines the "window" or set of rows the function will operate on.
The Function Itself: RANK(), SUM(), AVG(), etc.

The OVER() Clause: This is what makes it a window function.

PARTITION BY <column>: This is like a GROUP BY for window functions. It divides the rows into logical groups (partitions). 
The function then restarts its calculation for each new partition. For example, 
PARTITION BY Country would create separate windows for 'Aethelgard', 'Dunmar', etc.
ORDER BY <column>: This sorts the rows within each partition. This is essential for functions that depend on order, 
like RANK() or calculating a running total.
Think of it like this: PARTITION BY slices the cake, and ORDER BY decides who gets the first slice in each group.


ROWS or RANGE: This defines a smaller subset of rows within the current partition, known as the frame.

Common Window Functions in MySQL:

MySQL offers several types of window functions:

Ranking Functions: RANK(), DENSE_RANK(), ROW_NUMBER(), NTILE()
Aggregate Functions: SUM(), AVG(), MIN(), MAX(), COUNT() used with the OVER() clause.
Value Functions: LAG(), LEAD(), FIRST_VALUE(), LAST_VALUE()

When to Use RANK()
The RANK() function is used to assign a rank to each row within a partition of a result set.
If two or more rows have the same value for the ranking criteria, they will receive the same rank. 
However, RANK() will then skip the next rank(s). For example, if two rows are tied for 2nd place, 
they will both get a rank of 2, and the next rank assigned will be 4.

Part 2: Ranking Functions
Ranking functions are used to assign a rank to each row within a partition based on a specific ordering. 
Let's look at the most common ones.

A. RANK() vs. DENSE_RANK()
This is the most common point of confusion, so let's clarify it with a simple example. Imagine these scores:
Player	Score
Aria	100
Kael	90
Lyra	90
Roric	80

RANK()

Assigns a rank to each row.

If there's a tie, tied rows get the same rank.

Crucially, it skips the next rank(s) after a tie.

Applying RANK() to our scores:
| Player | Score | RANK |
| :--- | :--- | :--- |
| Aria | 100 | 1 |
| Kael | 90 | 2 |
| Lyra | 90 | 2 |
| Roric | 80 | 4 | (The rank '3' is skipped because two players tied for 2nd place)
When to use RANK(): When you want to reflect a real-world competition. 
If two people tie for a silver medal, there is no bronze medal winner; the next person is 4th. 
RANK() models this perfectly.


DENSE_RANK()

Also assigns the same rank to tied rows.

It does NOT skip ranks after a tie. The next rank is always the next sequential integer.

Applying DENSE_RANK() to our scores:
| Player | Score | DENSE_RANK |
| :--- | :--- | :--- |
| Aria | 100 | 1 |
| Kael | 90 | 2 |
| Lyra | 90 | 2 |
| Roric | 80 | 3 | (The ranks are dense, or gapless)
When to use DENSE_RANK(): When you want to find the "Top N" items based on a value. For example, 
"Show me all products in the top 3 price tiers." If multiple products tie for the 3rd price tier, you still want to see all of them.


*/


/* ------------------------ RANK() ---------------------------------*/


-- Question: Rank all customers based on their TotalSpent from highest to lowest. 
-- Show their CustomerID, FirstName, and their spending rank.

SELECT CustomerID,FirstName, TotalSpent, RANK() OVER (ORDER BY TotalSpent DESC) AS SpendingRank
FROM Customers;


-- Question: Rank customers within each country based on their TotalSpent. 
-- The ranking should restart for each country.


SELECT CustomerID, FirstName,Country, TotalSpent,
RANK() OVER (PARTITION BY Country ORDER BY TotalSpent DESC) AS RankInCountry
FROM Customers;


-- Question: Rank all Completed payments by their Amount in descending order.

SELECT PaymentID,CustomerID,Amount,
RANK() OVER (ORDER BY Amount DESC) AS PaymentRank
FROM Payments WHERE Status = 'Completed';

/*
Before moving ahead let us also understand CTEs - Common Table Expressions

A Common Table Expression (CTE), often referred to as a WITH clause, is a temporary, 
named result set that you can reference within a single SQL statement (SELECT, INSERT, UPDATE, or DELETE). 
Think of it as a temporary table or view that exists only for the duration of the query.	

It doesn't actually store data permanently; instead, it defines a logical query result that can be used later in the main query.

Why Use CTEs? (Benefits)
1.Improved Readability and Organization: CTEs help break down complex queries into smaller, 
more manageable, and readable logical blocks. Each CTE can represent a specific step in your data transformation.

2.Reusability within a Single Query: You can define a CTE once and reference it multiple times 
within the same subsequent query, avoiding repetitive code.

3.Simplifying Complex Joins and Subqueries: CTEs often make queries involving multiple joins, 
subqueries, or derived tables much easier to write and understand.

4.Handling Recursive Queries: CTEs are essential for writing recursive queries, 
which are queries that refer to themselves (e.g., traversing organizational hierarchies or bill of materials).
 While we won't go into recursive CTEs in detail here, it's a significant capability.
 
5.Referencing the Result Multiple Times: In some databases, using a CTE can optimize performance 
by materializing the result set once if it's referenced multiple times, though this behavior can vary.


WITH CteName AS (
    -- Your SELECT statement that defines the CTE's result set
    SELECT column1, column2
    FROM YourTable
    WHERE condition
)
-- The main query that uses the CTE
SELECT *
FROM CteName
WHERE another_condition;

You can also define multiple CTEs, chained together:


WITH CteName1 AS (
    SELECT ...
    FROM TableA
),
CteName2 AS (
    SELECT ...
    FROM TableB
    JOIN CteName1 ON ... -- CteName2 can refer to CteName1
),
CteName3 AS (
    SELECT ...
    FROM CteName1
    JOIN CteName2 ON ... -- CteName3 can refer to CteName1 and CteName2
)
SELECT *
FROM CteName3; -- The main query uses the last CTE

*/

-- Example 1: Filtering for a Specific Segment
-- Get a simple list of all customers who belong to the 'High-Value' segment.

WITH HighValueCustomers AS (
    -- Step 1: Define the temporary result set 
    -- This selects all columns for customers in the 'High-Value' segment.
    SELECT
        CustomerID,
        FirstName,
        Country,
        TotalSpent
    FROM Customers
    WHERE CustomerSegment = 'High-Value'
)
-- Step 2: Use the data from the CTE in the final query
-- Now we can query HighValueCustomers as if it were a real table.
SELECT
    FirstName,
    Country,
    TotalSpent
FROM HighValueCustomers
ORDER BY TotalSpent DESC;

--
Of course. Here are 5 simple examples of Common Table Expressions (CTEs) that do not use any joins. Each example uses only one of the tables (Customers or Payments) to clearly illustrate the core concept of CTEs: breaking a query into logical, readable steps.
What is a CTE? (Simple Analogy)
Imagine you are baking a cake. You could try to measure and mix all the ingredients in one giant bowl at the same time, which would be messy and confusing.
Instead, you first mix the dry ingredients in one bowl (flour, sugar, etc.). Then you mix the wet ingredients in another bowl (eggs, milk, etc.). Finally, you combine the contents of the two bowls.
A CTE is like one of those prep bowls. It prepares a small, temporary set of data that you can then use in your final step (the main SELECT query).
5 Simple, No-Join CTE Examples
Example 1: Filtering for a Specific Segment
Goal: Get a simple list of all customers who belong to the 'High-Value' segment.
Here, the CTE acts like a pre-filtered temporary table. We name our "prep bowl" HighValueCustomers, and then our final query just pulls the data from it.
code
SQL
WITH HighValueCustomers AS (
    -- Step 1: Define the temporary result set (our "prep bowl")
    -- This selects all columns for customers in the 'High-Value' segment.
    SELECT
        CustomerID,
        FirstName,
        Country,
        TotalSpent
    FROM Customers
    WHERE CustomerSegment = 'High-Value'
)
-- Step 2: Use the data from the CTE in the final query
-- Now we can query HighValueCustomers as if it were a real table.
SELECT
    FirstName,
    Country,
    TotalSpent
FROM HighValueCustomers
ORDER BY TotalSpent DESC;

-- Explanation: The CTE HighValueCustomers isolates the specific group of customers we care about. 
-- The main query then works with this smaller, focused result set, making the overall logic cleaner.




-- Example 2: Aggregating Data First
-- Calculate the total revenue generated by each payment method for 'Completed' transactions.
-- This shows how you can perform an aggregation (SUM and GROUP BY) inside a CTE to create a summary table, which you then query.

WITH PaymentMethodTotals AS (
    -- Step 1: Create a summary of total amounts for each payment method.
    SELECT
        PaymentMethod,
        SUM(Amount) AS TotalRevenue
    FROM Payments
    WHERE Status = 'Completed'
    GROUP BY PaymentMethod
)
-- Step 2: Select from the aggregated summary.
SELECT
    PaymentMethod,
    TotalRevenue
FROM PaymentMethodTotals
ORDER BY TotalRevenue DESC;


-- Explanation: Instead of putting a GROUP BY clause in a complex subquery, 
-- we neatly package the aggregation logic into the PaymentMethodTotals CTE. 
-- The final query is then a simple SELECT from that pre-summarized data.




-- Example 3: Finding the "Top 5" Using a Window Function
--  List the top 5 customers based on TotalSpent.

-- You cannot use a window function like RANK() directly in a WHERE clause
-- A CTE is the perfect solution: you calculate the rank inside the CTE and then filter on that rank in the main query.


WITH RankedSpending AS (
    -- Step 1: Assign a rank to every customer based on their spending.
    SELECT
        FirstName,
        TotalSpent,
        RANK() OVER (ORDER BY TotalSpent DESC) AS SpendingRank
    FROM Customers
)
-- Step 2: Now that the rank is calculated, we can filter on it.
SELECT
    FirstName,
    TotalSpent,
    SpendingRank
FROM RankedSpending
WHERE SpendingRank <= 5;


-- Explanation: The RankedSpending CTE creates a temporary result set that includes the new SpendingRank column. 
-- The final query can then easily filter using this new column.



-- Example 4: Preparing a Derived Column for Analysis
-- Count how many customers registered in each year.

-- The CTE can be used to perform a calculation or transformation on a column (like extracting the year from a date), 
-- creating a new, simpler column to work with.

WITH CustomerRegistrationYear AS (
    -- Step 1: Create a temporary result with just the registration year for each customer.
    SELECT
        YEAR(RegistrationDate) AS RegistrationYear
    FROM Customers
)
-- Step 2: Use the new 'RegistrationYear' column to group and count.
SELECT
    RegistrationYear,
    COUNT(*) AS NumberOfRegistrations
FROM CustomerRegistrationYear
GROUP BY RegistrationYear
ORDER BY RegistrationYear;


-- Explanation: The CTE CustomerRegistrationYear simplifies the RegistrationDate into a single RegistrationYear. 
-- This makes the final GROUP BY query much cleaner and more intuitive.




-- Example 5: Isolating a Dataset for Multiple Aggregations
-- Analyze all large payments (over $1000) by finding the count, total value, and average value of these transactions.
-- The CTE defines the exact dataset you want to analyze. 
-- The main query can then run multiple aggregate functions on this clean, pre-filtered data.


WITH LargeTransactions AS (
    -- Step 1: Isolate all payments with an amount greater than 1000.
    SELECT
        Amount
    FROM Payments
    WHERE Amount > 1000
)
-- Step 2: Perform multiple calculations on this specific subset of data.
SELECT
    COUNT(*) AS NumberOfLargeTransactions,
    SUM(Amount) AS TotalValueOfLargeTransactions,
    AVG(Amount) AS AverageLargeTransactionValue
FROM LargeTransactions;


-- Explanation: The LargeTransactions CTE acts as a filter, providing a clean list of 
-- just the amounts we're interested in. The main query can then efficiently perform 
-- all the required aggregations on this smaller, focused dataset without needing multiple WHERE clauses.



/* ------------- RANK() with CTEs and Subqueries ------------------------ */

-- (Subquery/CTE) 
-- Rank customers based on their total payment amount (not the TotalSpent column).
-- Display the customer's full name, their total payment amount, and their rank.


-- Using a Common Table Expression (CTE)
WITH CustomerPayments AS (
    SELECT
        c.CustomerID,
        CONCAT(c.FirstName, ' ', c.LastName) AS FullName,
        SUM(p.Amount) AS TotalPaid
    FROM Customers c
    INNER JOIN Payments p ON c.CustomerID = p.CustomerID
    WHERE p.Status = 'Completed'
    GROUP BY c.CustomerID, FullName
)
SELECT
    FullName,
    TotalPaid,
    RANK() OVER (ORDER BY TotalPaid DESC) AS PaymentRank
FROM CustomerPayments;



-- (Subquery & Filtering) 
-- Find the top 3 highest spending customers from the country 'Aethelgard'. 
-- If there are ties for 3rd place, include all of them.

SELECT * FROM (
    SELECT
        CustomerID,
        FirstName,
        Country,
        TotalSpent,
        RANK() OVER (PARTITION BY Country ORDER BY TotalSpent DESC) AS RankInCountry
    FROM Customers
    WHERE Country = 'Aethelgard'
) AS RankedCustomers
WHERE RankInCountry <= 3;



-- Rank each PaymentMethod based on the total revenue it has generated from 'Completed' transactions.

WITH MethodRevenue AS (
    SELECT
        PaymentMethod,
        SUM(Amount) AS TotalRevenue
    FROM Payments
    WHERE Status = 'Completed'
    GROUP BY PaymentMethod
)
SELECT
    PaymentMethod,
    TotalRevenue,
    RANK() OVER (ORDER BY TotalRevenue DESC) AS RevenueRank
FROM MethodRevenue;




/* ------------------------- DENSE RANK() --------------------------------*/


-- Question: Assign a dense rank to all customers based on their TotalSpent from highest to lowest. Notice how the ranks don't skip.

SELECT CustomerID, FirstName, TotalSpent, DENSE_RANK() OVER (ORDER BY TotalSpent DESC) AS DenseSpendingRank
FROM Customers;



-- Question: Assign a dense rank to customers based on their RegistrationDate, from oldest to newest.
SELECT CustomerID,FirstName,RegistrationDate,
DENSE_RANK() OVER (ORDER BY RegistrationDate ASC) AS RegistrationRank
FROM Customers;



-- Question: Within each CustomerSegment, densely rank customers by their TotalSpent.
SELECT CustomerID,FirstName,CustomerSegment,TotalSpent,DENSE_RANK() OVER (PARTITION BY CustomerSegment ORDER BY TotalSpent DESC) AS RankInSegment
FROM Customers;



-- Advanced Questions:
-- (Subquery & Filtering) Identify all customers who are in the top 3 spending tiers across the entire customer base.

SELECT * FROM (
    SELECT
        CustomerID,
        FirstName,
        TotalSpent,
        DENSE_RANK() OVER (ORDER BY TotalSpent DESC) as SpendingTier
    FROM Customers
) AS RankedCustomers
WHERE SpendingTier <= 3;


-- (Left Join & Aggregate) 
-- Densely rank customers by the number of 'Completed' payments they have made. 
-- Customers with zero completed payments should be included and ranked last.

WITH PaymentCounts AS (
    SELECT
        c.CustomerID,
        c.FirstName,
        COUNT(p.PaymentID) AS CompletedPayments
    FROM Customers c
    LEFT JOIN Payments p ON c.CustomerID = p.CustomerID AND p.Status = 'Completed'
    GROUP BY c.CustomerID, c.FirstName
)
SELECT
    CustomerID,
    FirstName,
    CompletedPayments,
    DENSE_RANK() OVER (ORDER BY CompletedPayments DESC) AS PaymentCountRank
FROM PaymentCounts;



-- (Complex Filtering) 
-- From all payments made via 'Credit Card' or 'PayPal', find the top 5 payment amounts. 
-- Show all payments that fall into these top 5 amount tiers.


SELECT * FROM (
    SELECT
        PaymentID,
        PaymentMethod,
        Amount,
        DENSE_RANK() OVER (ORDER BY Amount DESC) AS AmountTier
    FROM Payments
    WHERE PaymentMethod IN ('Credit Card', 'PayPal')
) AS RankedPayments
WHERE AmountTier <= 5;



/* ---------------- ROW NUMBER() ---------------------- */

/*
This one is simpler. ROW_NUMBER() assigns a unique, sequential integer to each row. 
No ties, no gaps. If two rows are identical according to the ORDER BY clause, 
it will still assign them different numbers, though the assignment might be non-deterministic.

When to use ROW_NUMBER(): When you need a unique identifier for each row in a result set, 
for example, to de-duplicate records or for pagination (e.g., "show me rows 10 through 20").

*/


-- Question: Assign a unique number to every customer, ordered alphabetically by their FirstName.
SELECT ROW_NUMBER() OVER (ORDER BY FirstName ASC) AS RowNum,FirstName,LastName,Country FROM Customers;


-- Question: Number all payments chronologically from oldest to newest.
SELECT ROW_NUMBER() OVER (ORDER BY PaymentDate ASC) AS TransactionNumber, PaymentID,PaymentDate,Amount
FROM Payments;


-- Question: For each CustomerSegment, assign a sequential number to customers based on who registered first (oldest RegistrationDate).
SELECT ROW_NUMBER() OVER (PARTITION BY CustomerSegment ORDER BY RegistrationDate ASC) AS NumberInSegment,
CustomerID,FirstName,CustomerSegment,RegistrationDate
FROM Customers;



-- Advanced Questions:
-- (Subquery/CTE for De-duplication) Let's pretend our Customers table might have duplicates based on email. 
-- Write a query to select only one record for each email address, specifically the one with the most recent LastLogin timestamp.

WITH RankedByLogin AS (
    SELECT
        *,
        ROW_NUMBER() OVER(PARTITION BY Email ORDER BY LastLogin DESC) AS rn
    FROM Customers
)
SELECT *
FROM RankedByLogin
WHERE rn = 1;



-- For each country, identify the single customer who registered most recently.

WITH NumberedByCountry AS (
    SELECT
        CustomerID,
        FirstName,
        Country,
        RegistrationDate,
        ROW_NUMBER() OVER(PARTITION BY Country ORDER BY RegistrationDate DESC) AS rn
    FROM Customers
)
SELECT
    CustomerID,
    FirstName,
    Country,
    RegistrationDate
FROM NumberedByCountry
WHERE rn = 1;


-- (Subquery for Pagination) Display the 11th through 20th customers when they are ordered by TotalSpent from highest to lowest.

SELECT * FROM (
    SELECT
        CustomerID,
        FirstName,
        TotalSpent,
        ROW_NUMBER() OVER (ORDER BY TotalSpent DESC) AS RowNum
    FROM Customers
) AS AllCustomers
WHERE RowNum BETWEEN 11 AND 20;





/* ------------------------ Aggregate Window Functions -----------------------*/


/*
You can use familiar aggregate functions like SUM(), AVG(), and COUNT() as window functions. 
The key difference is that they don't collapse the rows. 
They calculate the aggregate value over the window and display it on every row within that window. - SUM() OVER()
*/


-- Question: Show each payment along with a running total of all payment amounts, ordered chronologically.
SELECT
    PaymentID,
    PaymentDate,
    Amount,
    SUM(Amount) OVER (ORDER BY PaymentDate ASC) AS RunningTotalRevenue
FROM Payments
WHERE Status = 'Completed';



-- Question: For each customer, show all their payments and a running total of their payments over time. 
-- The running total should restart for each customer.

SELECT
    CustomerID,
    PaymentID,
    PaymentDate,
    Amount,
    SUM(Amount) OVER (PARTITION BY CustomerID ORDER BY PaymentDate ASC) AS CustomerRunningTotal
FROM Payments
WHERE CustomerID IS NOT NULL
ORDER BY CustomerID, PaymentDate;



-- Question: Show each customer and their TotalSpent, along with the total amount spent by all customers in their CustomerSegment.
SELECT
    CustomerID,
    FirstName,
    CustomerSegment,
    TotalSpent,
    SUM(TotalSpent) OVER (PARTITION BY CustomerSegment) AS SegmentTotalSpent
FROM Customers;


-- Advanced Questions:
-- Subquery & Percentage Calculation) 
-- For each customer, calculate what percentage their TotalSpent contributes to the total spending of all customers.


-- The SUM() OVER () with no PARTITION or ORDER BY calculates the grand total
SELECT
    CustomerID,
    FirstName,
    TotalSpent,
    (TotalSpent / SUM(TotalSpent) OVER ()) * 100 AS PercentageOfTotal
FROM Customers;



-- (Join) 
-- Show every 'Completed' payment, and for each row, display the total amount paid by 
-- that specific customer across all their 'Completed' transactions.

SELECT
    p.PaymentID,
    p.CustomerID,
    c.FirstName,
    p.PaymentDate,
    p.Amount,
    SUM(p.Amount) OVER (PARTITION BY p.CustomerID) AS CustomerTotalCompleted
FROM Payments p
INNER JOIN Customers c ON p.CustomerID = c.CustomerID
WHERE p.Status = 'Completed';



-- Calculate the running total of payment amounts for each Country.

WITH PaymentsWithCountry AS (
  SELECT
    p.PaymentDate,
    p.Amount,
    c.Country
  FROM Payments p
  INNER JOIN Customers c ON p.CustomerID = c.CustomerID
  WHERE p.Status = 'Completed'
)
SELECT
  PaymentDate,
  Country,
  Amount,
  SUM(Amount) OVER (PARTITION BY Country ORDER BY PaymentDate) as CountryRunningTotal
FROM PaymentsWithCountry;



