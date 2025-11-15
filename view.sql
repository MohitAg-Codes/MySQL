/* -------------- VIEWS -------------------------*/


/*
Think of a View as a stored query that you can interact with as if it were a real table. 
It's a virtual table.
Instead of storing data itself, a View stores a SELECT statement. 
When you query the View, MySQL runs the underlying SELECT statement in the background and shows you the result.


Imagine you have a large, complicated spreadsheet (the actual tables). 
A View is like creating a new sheet that doesn't copy the data, but instead uses formulas 
to pull in and display specific columns and rows from the main sheet. 
If you update the data in the main sheet, the "formula" sheet (the View) automatically shows the latest data.


Key Characteristics and Benefits of Views: 

Simplicity: A View can hide the complexity of a query. 
If you frequently join multiple tables or use complex WHERE clauses, you can encapsulate all that logic into a View. 
Then, you can just run a simple SELECT * FROM MyView; instead of rewriting the complex query every time.

Security: Views provide a powerful security mechanism. 
You can grant a user permission to access a View but not the underlying tables.

Column-Level Security: 
The View can be defined to show only certain "safe" columns, hiding sensitive data like emails or financial details.

Row-Level Security: The View can have a WHERE clause that filters the rows a user is allowed to see 
(e.g., a sales manager can only see data for their region).

Consistency: By storing complex calculations or business logic in a View (e.g., how to define an "active customer"), 
you ensure that everyone in the organization uses the exact same logic. 
This prevents different people from writing slightly different queries and getting inconsistent results.

Readability: Giving a complex query a simple, descriptive name (the View's name) 
makes your database schema easier to understand and use.


Basic Syntax
Creating a View:

CREATE VIEW ViewName AS
SELECT column1, column2, ...
FROM TableName
WHERE condition;

Querying a View (just like a table):

SELECT * FROM ViewName;

Deleting a View:

DROP VIEW ViewName;


*/



/*
Question 1: Creating a Simplified List of High-Value Customers
Task: The marketing team frequently needs a list of all 'High-Value' customers, 
including their full name, email, country, and total spending. 
They find writing WHERE CustomerSegment = 'High-Value' repetitive. Create a view to simplify this.
Concept Demonstrated: Simplicity and providing a clean interface for a specific user group.
*/

use ecommerce_db;

CREATE VIEW HighValueCustomerDetails AS
SELECT CustomerID, CONCAT(FirstName, ' ', LastName) AS FullName, Email,Country,TotalSpent
FROM Customers
WHERE CustomerSegment = 'High-Value';

/* How to Use the View:
Now, the marketing team can get the exact data they need with a very simple query: */

SELECT * FROM HighValueCustomerDetails
ORDER BY TotalSpent DESC;

/*
Explanation: This view acts as a pre-filtered list. 
The user of the view doesn't need to know or remember the logic for what defines a "high-value" customer; they just query the view.
*/


/*
Question 2: Creating a Comprehensive Payment Report
Task: The finance team needs to see a detailed report of all completed payments, i
including the customer's full name and country. Writing the JOIN between Payments and 
Customers every time is cumbersome. Create a view to pre-join this information.
Concept Demonstrated: Hiding the complexity of JOIN operations.

*/

CREATE VIEW CompletedPaymentDetails AS
SELECT p.PaymentID,p.OrderID,p.PaymentDate,p.Amount,p.PaymentMethod,p.Currency,c.CustomerID,
CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,c.Country
FROM Payments AS p
JOIN Customers AS c ON p.CustomerID = c.CustomerID
WHERE p.Status = 'Completed';

-- Get all completed payments from customers in 'Aethelgard'
SELECT * FROM CompletedPaymentDetails
WHERE Country = 'Aethelgard';



/*
Question 3: Creating a Summary of Revenue by Country
Task: Management wants a quick, always-up-to-date summary of total revenue generated from each country. 
Create a view that provides this aggregated data.
Concept Demonstrated: Encapsulating business logic and aggregation.

*/

CREATE VIEW CountryRevenueSummary AS
SELECT c.Country, SUM(p.Amount) AS TotalRevenue,COUNT(p.PaymentID) AS NumberOfTransactions
FROM Payments AS p
JOIN Customers AS c ON p.CustomerID = c.CustomerID
WHERE p.Status = 'Completed'
GROUP BY c.Country;

-- Get the revenue summary, ordering by the highest revenue
SELECT * FROM CountryRevenueSummary
ORDER BY TotalRevenue DESC;


/*
Question 4: Creating a Secure View for a Regional Manager
Task: The regional manager for 'Dunmar' should only be able to see customer data from their own country. 
Create a view that restricts their access to only 'Dunmar' customers.
Concept Demonstrated: Row-Level Security.
SQL to Create the View:

*/


CREATE VIEW DunmarCustomers AS
SELECT CustomerID,FirstName,LastName,Email,RegistrationDate,City,TotalSpent
FROM Customers
WHERE Country = 'Dunmar';
SELECT * FROM DunmarCustomers;



/*
Question 5: Creating a View to Monitor Recent Registrations
Task: The onboarding team wants a view that shows all customers who registered in the year 2025, to track the latest sign-ups.
Concept Demonstrated: Creating a view for a specific, time-based business task.
*/

CREATE VIEW RecentRegistrations2025 AS
SELECT CustomerID,FirstName,LastName,Email,RegistrationDate,Country
FROM Customers
WHERE YEAR(RegistrationDate) = 2025;
-- Check how many new users have signed up in 2025 from Nocturne
SELECT COUNT(*) FROM RecentRegistrations2025
WHERE Country = 'Nocturne';



/*
Question 6: Creating a Financial Transaction Log without PII
Task: An external auditor needs to analyze payment transaction patterns but should not have access 
to Personally Identifiable Information (PII) like customer names or emails. Create a secure view for them.
Concept Demonstrated: Column-Level Security.

*/

CREATE VIEW SecureFinancialTransactionLog AS
SELECT PaymentID,CustomerID, -- CustomerID is okay as a non-PII identifier
OrderID,PaymentDate,Amount,PaymentMethod,Status,Currency
FROM Payments;
-- The auditor checks for all pending transactions over 1000
SELECT * FROM SecureFinancialTransactionLog
WHERE Status = 'Pending' AND Amount > 1000;



/* ------------------ NTILE() ----------------------*/



/*
What is NTILE()?
NTILE(N) is a window function that divides an ordered set of rows into a specified number of N approximately 
equal-sized groups, called "tiles". It then assigns a bucket number (from 1 to N) to each row, indicating which group it belongs to.

The most common use cases are creating:
Quartiles (NTILE(4)): Dividing data into four equal parts (Top 25%, 25-50%, 50-75%, Bottom 25%).
Deciles (NTILE(10)): Dividing data into ten equal parts.
Percentiles (NTILE(100)): Dividing data into one hundred equal parts.

Why Use NTILE()?
Use NTILE() when your goal is segmentation rather than ranking. 
You're not asking "What is this customer's exact rank?" but rather, 
"Which spending bracket does this customer fall into?"

Marketing: Identify your top 10% of spenders to target them with a premium offer.
Performance Analysis: Group employees into performance quartiles.
Risk Management: Classify transactions into risk deciles based on amount.


Key Syntax and Considerations : 

NTILE(number_of_groups) OVER (PARTITION BY ... ORDER BY ...)

number_of_groups (N): An integer specifying how many groups to create.
ORDER BY: This is mandatory. NTILE() must know the order of rows to distribute them into buckets.
Uneven Groups: If the number of rows is not perfectly divisible by N, 
NTILE() will create groups that differ in size by at most one. 
The larger groups will always come first (i.e., bucket 1 will be equal to or larger than bucket 2). 
For example, 30 rows in NTILE(4) will result in two groups of 8 and two groups of 7.

*/



/*
Example 1: Creating Spending Quartiles for All Customers
Task: Divide all customers into four spending groups (quartiles) based on their TotalSpent.
Concept Demonstrated: Basic NTILE() for segmentation.

*/

SELECT FirstName,LastName,TotalSpent,
    -- Divide the ordered set of customers into 4 buckets
NTILE(4) OVER (ORDER BY TotalSpent DESC) AS SpendingQuartile
FROM Customers;


/*
Explanation : 

ORDER BY TotalSpent DESC sorts customers from highest to lowest spender.
NTILE(4) then assigns them to buckets.
SpendingQuartile = 1 represents the top 25% of spenders.
SpendingQuartile = 4 represents the bottom 25% of spenders.
*/


/*

Example 2: Creating Spending Terciles within Each Country
Task: For each country, segment the customers into three tiers (high, medium, low spenders) relative 
to other customers in that same country.
Concept Demonstrated: Using NTILE() with PARTITION BY.
*/

SELECT FirstName,Country,TotalSpent,
    -- The NTILE calculation restarts for each country
NTILE(3) OVER (PARTITION BY Country ORDER BY TotalSpent DESC) AS SpendingTierInCountry
FROM Customers
ORDER BY Country, SpendingTierInCountry;


/*
Explanation : 
Explanation: PARTITION BY Country tells the NTILE() function to perform its calculation independently for 'Aethelgard', 'Dunmar', etc. 
The top spender in 'Dunmar' will get a SpendingTierInCountry of 1, even if they aren't a top spender overall.
*/


/*
Example 3: Identifying the "Top 10%" of Most Expensive Payments
Task: Group all 'Completed' payments into deciles (10 groups) to identify which transactions fall into the top 10% by amount.
Concept Demonstrated: Using NTILE() to find a top percentage.
*/

SELECT PaymentID,Amount,PaymentMethod,
NTILE(10) OVER (ORDER BY Amount DESC) AS AmountDecile
FROM Payments
WHERE Status = 'Completed';


/*
How to use this result: To get only the top 10% of payments, you would wrap this in a CTE or subquery.
*/

WITH PaymentDeciles AS (
SELECT PaymentID,Amount,PaymentMethod,
NTILE(10) OVER (ORDER BY Amount DESC) AS AmountDecile
FROM Payments
WHERE Status = 'Completed'
)
SELECT * FROM PaymentDeciles
WHERE AmountDecile = 1; -- Filter for the top 10% bucket


/*
Example 4: Analyzing Average Spending per Quartile
Task: Calculate the average TotalSpent for each of the four customer spending quartiles.
Concept Demonstrated: Using NTILE() in a CTE to perform further aggregation.

*/

WITH CustomerQuartiles AS (
    SELECT
        TotalSpent,
        NTILE(4) OVER (ORDER BY TotalSpent DESC) AS SpendingQuartile
    FROM Customers
)
SELECT SpendingQuartile,COUNT(*) AS NumberOfCustomers,
AVG(TotalSpent) AS AverageSpending,
MIN(TotalSpent) AS MinimumSpending,
MAX(TotalSpent) AS MaximumSpending
FROM CustomerQuartiles
GROUP BY SpendingQuartile
ORDER BY SpendingQuartile;



/*
Explanation: This is a very powerful and common pattern.
The CTE first assigns each customer to a SpendingQuartile.
The main query then aggregates the data based on those assigned quartiles, giving you a clear profile of each segment.
*/


/*
Example 5: Grouping Customers by Registration Date (Early vs. Late Adopters)
Task: Segment customers into two groups: the first 50% who registered ("Early Adopters") and the second 50% ("Late Adopters").
Concept Demonstrated: Using NTILE(2) for a simple two-way split.

*/


SELECT FirstName,RegistrationDate,
CASE NTILE(2) OVER (ORDER BY RegistrationDate ASC)
WHEN 1 THEN 'Early Adopter'
WHEN 2 THEN 'Late Adopter'
END AS AdopterSegment
FROM Customers;


/*
Explanation:
We use ORDER BY RegistrationDate ASC to order customers from oldest to newest registration.
NTILE(2) divides them into two groups.
The CASE statement translates the bucket number (1 or 2) into a more descriptive label.
*/


/*
Important Distinction: NTILE() vs. RANK()
RANK() gives two customers with the same TotalSpent the same rank.
NTILE() might place two customers with the same TotalSpent into different buckets if they fall on the dividing line between two tiles.
 NTILE's priority is to make the groups equal-sized, not to keep tied values together.
This makes NTILE() perfect for segmentation but generally unsuitable for competitive ranking where ties must be handled together.

*/
