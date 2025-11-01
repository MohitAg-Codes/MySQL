/* ------------RIGHT JOIN ---------------- */

/*
When do you use a RIGHT JOIN?

You use a RIGHT JOIN when you want to include all records from the "right" table (the one mentioned after RIGHT JOIN) 
and only the matching records from the "left" table. If there is no match in the left table for a record in the 
right table, the columns from the left table will be filled with NULL.

Think of it as the mirror image of a LEFT JOIN. While a LEFT JOIN prioritizes the Customers table, 
a RIGHT JOIN prioritizes the Payments table. It's perfect for answering questions focused on the Payments table, 
especially when you want to investigate payments that might not be linked to a known customer.


This is useful for:
Identifying "orphan" records, such as payments made via guest checkout that don't have a corresponding customer 
in the Customers table.
Ensuring every single payment is accounted for in a report, regardless of whether the customer record exists.
Analyzing all transactions and seeing which ones can be tied back to registered users.

*/

/*
Question 1: Generate a complete list of all payment IDs and the first name of the customer who made the payment. 
Include all payments, even those without a linked customer.
*/

SELECT p.PaymentID, c.FirstName
FROM Customers c
RIGHT JOIN Payments p ON c.CustomerID = p.CustomerID;


/*
Question 2: Show all payments made by 'Guest Checkout'. For each, display the payment ID, 
amount, and payment method. The customer-related columns should be NULL.
*/

SELECT p.PaymentID,p.Amount,p.PaymentMethod,c.FirstName,c.LastName
FROM Customers c
RIGHT JOIN Payments p ON c.CustomerID = p.CustomerID
WHERE c.CustomerID IS NULL;

/*
Question 3: List every payment ID, the corresponding customer's full name, 
and the payment status. Ensure that all payment records are included in the result.

*/
SELECT p.PaymentID,c.FirstName,c.LastName,p.Status
FROM Customers c
RIGHT JOIN Payments p ON c.CustomerID = p.CustomerID;


/*
Question 4: Provide a list of all payment amounts and the country of the customer who made the payment.
For payments not linked to a customer, the country should be NULL.
*/

SELECT p.Amount,c.Country
FROM Customers c
RIGHT JOIN Payments p ON c.CustomerID = p.CustomerID
ORDER BY c.Country DESC;


/*
Question 5: Display a count of payments grouped by the payment method. 
This list must include all payments, including those made by guests.
*/

SELECT p.PaymentMethod, COUNT(p.PaymentID) AS NumberOfPayments
FROM Customers c
RIGHT JOIN Payments p ON c.CustomerID = p.CustomerID
GROUP BY p.PaymentMethod;


/*
Question 6: List all payment IDs and their amounts for transactions with a 'Pending' or 'Failed' status, 
along with the customer's email. Include all such payments regardless of whether a customer is associated.
*/

SELECT
    p.PaymentID,
    p.Amount,
    p.Status,
    c.Email
FROM
    Customers c
RIGHT JOIN
    Payments p ON c.CustomerID = p.CustomerID
WHERE
    p.Status IN ('Pending', 'Failed');





/* ------------------- FULL OUTER JOIN --------------------*/

/*
A FULL OUTER JOIN is used when you want to see all records from both tables. 
It combines the results of both a LEFT JOIN and a RIGHT JOIN. The result set will contain:
All matching records from both tables.
All records from the left table that do not have a match in the right table (with NULL for the right table's columns).
All records from the right table that do not have a match in the left table (with NULL for the left table's columns).

You use it to get a complete picture of all the data in two related tables, ensuring no records are left out. 
It's the perfect tool for finding mismatches and seeing all registered customers (even those who haven't paid) and all payments (even those from guests) in a single, comprehensive view.


MySQL does not have a built-in FULL OUTER JOIN keyword. 
However, you can achieve the exact same result by performing a LEFT JOIN and a RIGHT JOIN and combining them with the UNION operator. 
UNION automatically removes duplicate rows, giving you a clean result.
*/


/*
Question 1: Create a master list showing the full names of all customers and all payment IDs. 
The list should include customers who have never paid and payments that have no associated customer.

*/

-- This query simulates a FULL OUTER JOIN
SELECT c.FirstName, c.LastName, p.PaymentID
FROM Customers c
LEFT JOIN Payments p ON c.CustomerID = p.CustomerID
UNION
SELECT c.FirstName, c.LastName, p.PaymentID
FROM Customers c
RIGHT JOIN Payments p ON c.CustomerID = p.CustomerID;



/*
Question 2: Generate a report that lists every customer's email and every payment amount. 
Include customers without payments and payments without customers.
*/

SELECT c.Email, p.Amount
FROM Customers c
LEFT JOIN Payments p ON c.CustomerID = p.CustomerID
UNION
SELECT c.Email, p.Amount
FROM Customers c
RIGHT JOIN Payments p ON c.CustomerID = p.CustomerID;




/*
Question 3: Display all customer IDs from the Customers table and all customer IDs from 
the Payments table in a single column to identify any mismatches.

*/


SELECT CustomerID FROM Customers
UNION
SELECT CustomerID FROM Payments;

/*
Question 4: Create a comprehensive list showing customer full names and payment methods. 
The list must contain all customers, regardless of whether they have made a payment, 
and all payment methods from the payments table, even if unassociated with a customer.
*/

SELECT c.FirstName, c.LastName, p.PaymentMethod
FROM Customers c
LEFT JOIN Payments p ON c.CustomerID = p.CustomerID
UNION
SELECT c.FirstName, c.LastName, p.PaymentMethod
FROM Customers c
RIGHT JOIN Payments p ON c.CustomerID = p.CustomerID;



/*
Question 5: Produce a list of all customer registration dates and all payment dates in two separate columns. 
Ensure that all records from both tables are represented.
*/

SELECT c.RegistrationDate, p.PaymentDate
FROM Customers c
LEFT JOIN Payments p ON c.CustomerID = p.CustomerID
UNION
SELECT c.RegistrationDate, p.PaymentDate
FROM Customers c
RIGHT JOIN Payments p ON c.CustomerID = p.CustomerID;



/*
Question 6: I want to see a list of all customers who have never made a payment, 
combined with a list of all payments that are not linked to any registered customer.
*/

(SELECT c.FirstName, c.LastName, p.PaymentID, p.Amount
 FROM Customers c
 LEFT JOIN Payments p ON c.CustomerID = p.CustomerID
 WHERE p.PaymentID IS NULL)
UNION
(SELECT c.FirstName, c.LastName, p.PaymentID, p.Amount
 FROM Customers c
 RIGHT JOIN Payments p ON c.CustomerID = p.CustomerID
 WHERE c.CustomerID IS NULL);
 
 
 /*
 Question 7: Create a report that shows every customer's city and every payment's currency. 
 Include all customers, even if they have made no payments, and all payments, even if they are from guests.
 */
 
SELECT c.City, p.Currency
FROM Customers c
LEFT JOIN Payments p ON c.CustomerID = p.CustomerID
UNION
SELECT c.City, p.Currency
FROM Customers c
RIGHT JOIN Payments p ON c.CustomerID = p.CustomerID;
 
 
 
 /* --------- Questions for practice -----------------------*/
 
 
 /*
 Question 1: (INNER JOIN with Multiple Conditions)
"Write a query to retrieve the full name and email of customers who are part of the 'High-Value' segment 
and have made a payment using a 'Credit Card'. Also, include the payment amount and the date of the transaction."
This question tests the ability to join two tables and filter the results based on conditions from both tables 
simultaneously.
 */
 
 
SELECT c.FirstName,c.LastName,c.Email,p.Amount,p.PaymentDate
FROM Customers c
INNER JOIN Payments p ON c.CustomerID = p.CustomerID
WHERE c.CustomerSegment = 'High-Value' AND p.PaymentMethod = 'Credit Card';



/*
Question 2: (LEFT JOIN for Exclusion)
"Find all customers who registered before 2024 and have not made any payments. 
Provide their full name and registration date."
This is a classic LEFT JOIN problem designed to find records in one table that have no corresponding records 
in another, with an added filter on the primary table.

*/


SELECT c.FirstName, c.LastName, c.RegistrationDate
FROM Customers c
LEFT JOIN Payments p ON c.CustomerID = p.CustomerID
WHERE YEAR(c.RegistrationDate) < 2024 AND p.PaymentID IS NULL;


/*
Question 3: (RIGHT JOIN with Aggregation)

Show me a list of all payment methods and the total amount collected for each. 
Crucially, include any payments that were not associated with a registered customer (e.g., Guest Checkouts)."**

This question tests the understanding of RIGHT JOIN to ensure all records from the 
`Payments` table are included, combined with an aggregate function (`SUM`).
*/


SELECT
    p.PaymentMethod,
    SUM(p.Amount) AS TotalCollected
FROM
    Customers c
RIGHT JOIN
    Payments p ON c.CustomerID = p.CustomerID
GROUP BY
    p.PaymentMethod;


/*
Question 4: (FULL OUTER JOIN - Simulated)
"Generate a master report showing every customer's full name and the total amount they have spent. 
The report must include customers who have never spent anything, as well as any payments that are not tied to a customer."
This question requires a FULL OUTER JOIN to ensure no data is lost from either table. 
It tests the ability to handle both unmatched customers and unmatched payments in a single query.

*/


SELECT c.FirstName, c.LastName, SUM(p.Amount) AS TotalSpent
FROM Customers c
LEFT JOIN Payments p ON c.CustomerID = p.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName
UNION
SELECT c.FirstName, c.LastName, SUM(p.Amount) AS TotalSpent
FROM Customers c
RIGHT JOIN Payments p ON c.CustomerID = p.CustomerID
WHERE c.CustomerID IS NULL
GROUP BY c.CustomerID, c.FirstName, c.LastName;
    

/*
Question 5: (INNER JOIN with GROUP BY and HAVING)
"List the countries where the total payment amount from 'Frequent' customers exceeds 1,500. 
Show the country and the total amount."
This is a multi-step problem testing the ability to join, filter by segment (WHERE), 
aggregate by country (GROUP BY), and then filter the aggregated results (HAVING).

*/

SELECT c.Country, SUM(p.Amount) AS TotalFromFrequentCustomers
FROM Customers c
INNER JOIN Payments p ON c.CustomerID = p.CustomerID
WHERE c.CustomerSegment = 'Frequent'
GROUP BY c.Country
HAVING SUM(p.Amount) > 1500;



/*
Question 6: (LEFT JOIN with CASE statement)
"Create a report of all customers. List their full name and a column named 'EngagementStatus'. 
If the customer has made a payment, the status should be 'Active'. If they have not made any payments, the status should be 'Inactive'."
This tests the ability to use a LEFT JOIN to find non-matching records and then use a CASE statement 
to conditionally display a result based on the join's outcome.

*/

SELECT c.FirstName, c.LastName,
CASE WHEN p.CustomerID IS NOT NULL THEN 'Active'ELSE 'Inactive' END AS EngagementStatus
FROM Customers c
LEFT JOIN Payments p ON c.CustomerID = p.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName
ORDER BY EngagementStatus;



/*
Question 7: (RIGHT JOIN for Auditing)
"We need to audit payments that were either 'Failed' or 'Pending'. 
Provide a list of these Payment IDs, their status, and the full name of the customer associated with them. 
Ensure that even payments with no customer link are included if they meet the status criteria."
This tests the use of RIGHT JOIN for a practical purpose like auditing, 
where you must account for every relevant transaction, regardless of its relationship to another table.

*/

SELECT p.PaymentID, p.Status, c.FirstName, c.LastName
FROM Customers c
RIGHT JOIN Payments p ON c.CustomerID = p.CustomerID
WHERE p.Status IN ('Failed', 'Pending');


