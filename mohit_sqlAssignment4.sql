use ecommerce_db;

-- Customer Segmentation: Write a query to categorize customers into segments based on their TotalSpent. The segments are 'High-Value' (TotalSpent > 2000), 
-- 'Mid-Value' (TotalSpent between 1000 and 2000), and 'Low-Value' (TotalSpent <= 1000).

select CustomerID ,firstName , TotalSpent ,
           case 
             when totalSpent > 2000 then 'High-Value'
             when totalSpent between 1000 and 2000 then 'Mid-Value'
             else 'Low-Value'
		  end as SpendingSegment
from customers;

-- Payment Method Analysis: Find the total amount of money processed by each PaymentMethod.
--  Order the results by the total amount in descending order.

select PaymentMethod, sum(amount) as totalAmount
from payments
WHERE Status = 'Completed'
group by paymentMethod
order by totalAmount desc;

-- Recent Customer Activity: List all customers who have logged in within the last two days (relative to '2025-10-28').
--  Display their full name and last login time.

select concat(FirstName,' ',LastName) as FullName , LastLogin 
from customers
where LastLogin >= date_sub('2025-10-28', interval 2 day)
order by LastLogin desc;

-- Successful Payments Overview: Retrieve a list of all payments with a 'Completed' status. 
-- Include the customer's first name, last name, the payment amount, and the payment date

select c.FirstName, c.LastName, p.PaymentDate, p.Amount
from payments p
inner join customers c on c.CustomerID = p.CustomerID
where p.Status = 'Completed';

-- High-Spending Customers from Aethelgard: Identify all 'High-Value' customers from the country 'Aethelgard'. 
-- Display their full name and total spent. 

SELECT 
    CONCAT(FirstName, ' ', LastName) AS FullName,
    TotalSpent
FROM Customers
WHERE Country = 'Aethelgard'
  AND CustomerSegment = 'High-Value';

-- Average Payment Amount: Calculate the average payment amount for each payment method.

select PaymentMethod , round(avg(Amount),2) as avgAmount
from payments
group by PaymentMethod;


-- Customers Without Payments: Find all customers who have not made any payments. Display their CustomerID and full name.

select c.CustomerID,p.PaymentID, concat(c.firstName,' ',c.LastName) as FullName 
from customers c
left join payments p on c.CustomerID = p.CustomerID
where p.PaymentID is null;

-- Payments with Discounts: List all payments where a discount was applied (DiscountApplied > 0). Show the PaymentID, Amount, and DiscountApplied.

select PaymentID, Amount, DiscountApplied
from payments
where DiscountApplied > 0;

-- Country-wise Customer Count: Count the number of customers in each country and order the result by the count in descending order.

select country, count(CustomerID) as totalCustomers
from customers
group by country
order by totalCustomers desc;

-- Total Revenue by Currency: Calculate the total payment amount for each currency type.

select currency, sum(amount) as TotalRevenue
from payments
group by currency;

-- Customer Payment Summary: For each customer, find the total amount they have spent, the number of payments they have made,
--  and their last payment date.

select c.CustomerID, c.FirstName, c.LastName , 
       sum(p.Amount) as totalAmount, count(PaymentID) as NumberOfPayments, max(PaymentDate) as lastPaymentDate
from customers c
inner join payments p on c.CustomerID = p.CustomerID
group by c.CustomerID, c.FirstName, c.LastName;

-- High-Value Customers' Payments: List all payments made by customers who are in the 'High-Value' segment.

SELECT 
    p.PaymentID,
    p.CustomerID,
    CONCAT(c.FirstName, ' ', c.LastName) AS FullName,
    p.Amount,
    p.PaymentDate
FROM Payments p
INNER JOIN Customers c 
    ON p.CustomerID = c.CustomerID
WHERE c.CustomerSegment = 'High-Value';


-- Countries with High-Value Customers: Find all countries that have more than 2 'High-Value' customers.

SELECT 
    Country,
    COUNT(*) AS HighValueCustomerCount
FROM Customers
WHERE CustomerSegment = 'High-Value'
GROUP BY Country
HAVING COUNT(*) > 2;


-- Payment Method Popularity: Determine the most popular payment method (by the number of transactions) for each CustomerSegment.

SELECT 
    c.CustomerSegment,
    p.PaymentMethod,
    COUNT(*) AS TransactionCount
FROM Customers c
JOIN Payments p 
    ON c.CustomerID = p.CustomerID
GROUP BY c.CustomerSegment, p.PaymentMethod
ORDER BY c.CustomerSegment, TransactionCount DESC;


-- Customers with Failed Payments: Identify customers who have had at least one payment with a 'Failed' status. 
-- Display their CustomerID, full name, and the number of failed payments.

SELECT c.customerId,
    concat(c.firstName,' ',c.lastName) as FullName,
    count(*) as FailedPaymentsCount
from Customers c
join Payments p 
   ON c.CustomerID = p.CustomerID
where p.status = 'Failed'
group by c.CustomerID
having FailedPaymentsCount >= 1;

-- Average Spending per Segment: Calculate the average TotalSpent for each CustomerSegment.

SELECT 
    CustomerSegment,
    AVG(TotalSpent) AS AvgSpending
FROM Customers
GROUP BY CustomerSegment;

-- Customers with Multiple Payments on the Same Day: Find customers who made more than one payment on the same day

SELECT c.customerId,
    concat(c.firstName,' ',c.lastName) as FullName,
   date(p.PaymentDate) AS PaymentDay,
   count(*) as PaymentsCount
from Customers c
join Payments p 
   ON c.CustomerID = p.CustomerID
group by c.CustomerID, date(p.PaymentDate)
having count(*) > 1;

-- Unregistered Customers' Payments: Find the total amount from payments made by customers who are not listed in the 
-- Customers table (where CustomerID is NULL in the Payments table).


SELECT 
    SUM(p.Amount) AS TotalAmountFromUnlistedCustomers
FROM Payments p
LEFT JOIN Customers c 
    ON p.CustomerID = c.CustomerID
WHERE c.CustomerID IS NULL;


-- Monthly Revenue: Calculate the total revenue (sum of Amount from completed payments) for each month in the year 2025.

select month(paymentDate) as month , sum(amount) as totalRevenue
from payments
where status = 'Completed'
and year(PaymentDate) = '2025'
group by month;

-- Customers with Increasing Spending: Identify customers whose TotalSpent is greater than the average TotalSpent of all customers.

select customerId,CONCAT(FirstName, ' ', LastName) AS FullName, TotalSpent
from customers
where TotalSpent > (select avg(TotalSpent) from customers);

-- Second Highest Spender: Find the customer who has the second-highest TotalSpent.

select customerID, TotalSpent
from customers
where TotalSpent = (
            select distinct totalSpent
            from customers
            order by totalSpent desc
            limit 1 offset 1
);

-- Customer Loyalty Tiers: Using a CASE statement, classify customers into loyalty tiers: 'Platinum' for TotalSpent > 3000, 
-- 'Gold' for TotalSpent between 1500 and 3000, 'Silver' for TotalSpent between 500 and 1500, and 'Bronze' otherwise. 
-- Also, show their total spent and country.

select customerID,TotalSpent,country,
   case
     when TotalSpent > 3000 then 'Platinum'
     when TotalSpent between 1500 and 3000 then 'Gold'
     when TotalSpent between 500 and 1500 then 'Silver'
     else 'Bronze'
	end as loyalty_tiers
from customers;

-- Top 3 Spenders per Country: For each country, find the top 3 customers who have spent the most.

select c1.country, c1.customerID, c1.FirstName,c1.TotalSpent
from customers c1
where (
     select count(*)
     from customers c2
     where c2.country = c1.country
     and c2.TotalSpent > c1.TotalSpent
) < 3
ORDER BY c1.Country, c1.TotalSpent DESC;

-- Payment Status Report: Write a query to pivot the Payments table to show the total amount for 
-- each payment Status ('Completed', 'Pending', 'Failed') as separate columns.

select 
  sum(case when status = 'Completed' then Amount else 0 end ) as Completed_Total,
  sum(case when status = 'Pending' then Amount else 0 end ) as Pending_Total,
  sum(case when status = 'Failed' then Amount else 0 end ) as Failed_Total
from payments;

-- Customers with No Recent Payments: List customers who have not made any payments in the last 6 months 
-- from the latest payment date in the Payments table.

select c.customerId, c.firstName, c.lastName
from customers c
left join payments p
on c.customerId = p.customerId
where p.paymentId is null
or p.paymentDate < (
                  (select max(paymentDate) from payments) - interval 6 month
				);
                

-- Ratio of Discounted Payments: For each PaymentMethod, calculate the percentage of payments that had a discount applied.

select paymentMethod,
   (sum(case when DiscountApplied > 0 then 1 else 0 end) * 100.00) / count(*) AS DiscountedPaymentPercentage 
from payments
group by paymentMethod;


-- Customers Spending Above Average in Their Country: Find customers whose TotalSpent is greater 
-- than the average TotalSpent of all customers in their own country.

select c1.customerID, c1.FirstName, c1.Country, c1.TotalSpent
from customers c1
where c1.TotalSpent > (
                    select avg(c2.totalSpent)
                    from customers c2
                    where c1.country = c2.country				
);

-- Payment Growth Year-over-Year: Although the data is limited, write a query that could calculate the percentage growth
--  in total payment amounts from 2024 to 2025.

select 
   ((sum(case when year(PaymentDate) = '2025' then amount else 0 end) - 
   sum(case when year(PaymentDate) = '2024' then amount else 0 end)) /
   sum(case when year(PaymentDate) = '2024' then amount else 0 end) * 100) as GrowthPercentage
from payments;


-- Customer Lifetime Value Prediction (Conceptual): Create a query that segments customers based on their registration year and 
-- calculates the average TotalSpent for each cohort. This can be a proxy for lifetime value.

select year(RegistrationDate) as RegistrationYear,
       round(avg(TotalSpent),2) as AvgLifetimeValue
from customers
group by RegistrationYear;

-- Identifying Potential Churn: List customers who were 'Frequent' or 'High-Value' but have not made a payment in the last 30 days
--  from the last payment date in the table.

select c.customerId, c.FirstName, c.LastName
from customers c
left join payments p
on c.customerId = p.customerId
where c.CustomerSegment in ('Frequent' ,'High-Value')
and (p.paymentId is null 
     or p.PaymentDate < (
                     (select max(paymentDate) from payments) - interval 30 day 
                     ));


select * from customers;
select * from payments;



             