

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



/*
INNER JOINS
When do you use an INNER JOIN?
You use an INNER JOIN when you want to see only the records that have a match in both tables.
Think of it like this: The INNER JOIN will only show you a customer if they have made at least one payment.
 And it will only show you a payment if it's linked to a known customer.
A customer who registered but never bought anything? They won't appear.
A payment from a "Guest Checkout" where we don't have a CustomerID? That won't appear either.


It's the intersection, the perfect match, the place where the data from both tables overlaps.
*/


/*
Challenge 1: The Town Crier's Report 
Scenario: The Town Crier has been asked to announce the names of all customers who made a purchase today 
(October 28th, 2025) to celebrate their patronage. 
He needs a simple list of customer names and the amount they paid.
Question: Can you provide a list of the first and last names of customers along with the amount of each payment they made on October 28th, 2025?
*/

SELECT
    c.FirstName,
    c.LastName,
    p.Amount,
    p.PaymentDate
FROM Customers c
INNER JOIN Payments p ON c.CustomerID = p.CustomerID
WHERE DATE(p.PaymentDate) = '2025-10-28';


/*
Challenge 2: The Royal Treasurer's Inquiry 
Scenario: The Royal Treasurer is auditing the accounts. 
He is particularly interested in all transactions paid for with "Gold Coins" 
and needs to know which customers used this currency.
Question: List the full names of customers and the payment dates for all transactions 
that were paid using 'Gold Coins'.
*/

SELECT
    c.FirstName,
    c.LastName,
    p.PaymentDate,
    p.Currency
FROM
    Customers c
INNER JOIN
    Payments p ON c.CustomerID = p.CustomerID
WHERE
    p.Currency = 'Gold Coins';


/*
Challenge 3: The Guild Master's Analytics 
Scenario: The Guild Master wants to reward the most loyal customers from the city of 
'Silvercrest'. He needs a report of the total amount spent by each customer from that
 city to see who the top contributors are.
Question: Find the total amount spent by each customer who lives in 'Silvercrest'. The list should show the customer's first name, last name, and their total spending, ordered from highest spender to lowest.
*/

SELECT
    c.FirstName,
    c.LastName,
    SUM(p.Amount) AS TotalSpent
FROM
    Customers c
INNER JOIN
    Payments p ON c.CustomerID = p.CustomerID
WHERE
    c.City = 'Silvercrest'
GROUP BY
    c.CustomerID, c.FirstName, c.LastName
ORDER BY
    TotalSpent DESC;



/*
Challenge 4: The Loyalty Program Manager's List 
Scenario: The Loyalty Program Manager wants to identify "High-Value" customers who are also frequent buyers.
Her definition of a frequent buyer is someone who has made more than one purchase.
She needs a list of these specific customers to send them an exclusive invitation to the annual Grand Bazaar Gala.
Question: Can you generate a list of customers from the 'High-Value' segment who have made more 
than one payment? Show their full name, email, and the number of payments they've made.
*/

SELECT
    c.FirstName,
    c.LastName,
    c.Email,
    COUNT(p.PaymentID) AS NumberOfPayments
FROM
    Customers c
INNER JOIN
    Payments p ON c.CustomerID = p.CustomerID
WHERE
    c.CustomerSegment = 'High-Value'
GROUP BY
    c.CustomerID, c.FirstName, c.LastName, c.Email
HAVING
    COUNT(p.PaymentID) > 1;
    
/*
Challenge 5: The Chief Alchemist's Payment Analysis

**Scenario:** The Chief Alchemist is analyzing spending habits to determine which
 customers might be interested in his new, expensive "Philosopher's Stone" potion. 
 He wants to categorize each customer's payments as 'Minor Purchase' (under 200), 
 'Significant Purchase' (200 to 1000), or 'Major Investment' (over 1000) and see a summary for each customer.

**Question:** Create a report showing each customer's full name and a count of how many 'Minor', 
'Significant', and 'Major' purchases they have made.
*/

SELECT
    c.FirstName,
    c.LastName,
    SUM(CASE WHEN p.Amount < 200 THEN 1 ELSE 0 END) AS Minor_Purchases,
    SUM(CASE WHEN p.Amount >= 200 AND p.Amount <= 1000 THEN 1 ELSE 0 END) AS Significant_Purchases,
    SUM(CASE WHEN p.Amount > 1000 THEN 1 ELSE 0 END) AS Major_Investments
FROM
    Customers c
INNER JOIN
    Payments p ON c.CustomerID = p.CustomerID
GROUP BY
    c.CustomerID, c.FirstName, c.LastName
ORDER BY
    c.LastName, c.FirstName;


/*
Scenario: The Royal Cartographer is planning a grand expedition. He needs to identify the single 
highest transaction from each country to find out which customer to visit.
Question: For each country, find the largest payment amount made by a customer from that country. 
Your report should include the country, the customer's full name, their city, and the amount of that largest payment.

The Strategy: A Two-Step Spell
To solve this, we can't just use MAX() and GROUP BY Country in one go, because if we do, 
we lose the FirstName, LastName, and City of the specific person who made that maximum payment.

Instead, we perform a two-step spell:
First Spell (The Scrying Pool): We'll create a small, temporary list that finds just one thing: the maximum payment amount for each country.
Second Spell (The Grand Conjunction): We'll then join our main Customers and Payments tables to this temporary 
list. This will allow us to find the exact row where the payment amount matches the maximum amount we found for that country.
*/

SELECT c.Country,c.FirstName,c.LastName,c.City,p.Amount
FROM Customers c
INNER JOIN Payments p ON c.CustomerID = p.CustomerID
INNER JOIN
    -- This is our "Scrying Pool" subquery
    (SELECT
        c2.Country,
        MAX(p2.Amount) AS MaxAmount
     FROM
        Customers c2
     INNER JOIN
        Payments p2 ON c2.CustomerID = p2.CustomerID
     GROUP BY
        c2.Country
    ) AS MaxPaymentsByCountry ON c.Country = MaxPaymentsByCountry.Country AND p.Amount = MaxPaymentsByCountry.MaxAmount;




/* -------------------- LEFT JOIN -------------------- */


/*
Imagine you are the keeper of the Customers scroll. 
Your duty is to know about every single customer who has ever registered at The Grand Bazaar of Wonders, 
regardless of whether they have spent a single coin.
An INNER JOIN would only show you the customers who have made a payment.
But what about the ones who haven't? How do you find those window shoppers ? This is where the LEFT JOIN comes in.
Think of it as the "All-Seeing Eye" of the left table. When you perform a LEFT JOIN from Customers to Payments, 
you are saying:
"Show me every single record from the Customers table, and if you find a matching payment in the Payments table, 
show me that too. If you don't find a match, that's fine—just leave the payment columns blank (as NULL)."

When do you use a LEFT JOIN?
You use a LEFT JOIN when you want to keep all the records from the "left" table (the one mentioned after FROM)
and see which of them have corresponding records in the "right" table.
It's perfect for answering questions like:
 
Which customers have never made a purchase?
Which products have never been sold?
Which users have never logged in?
The key is that the left table is your source of truth, and you want to see all of it,
with optional, matched information from the right.

*/

/*
Scenario: The Bazaar's Scribe wants to send a magical, self-writing scroll to every 
registered customer who has never made a purchase, reminding them of the wonders they're missing.
 He needs a definitive list of these "window shoppers."
Question: Can you produce a list of the first and last names of all customers who have 
no corresponding entries in the Payments table?

*/

SELECT
c.FirstName,
c.LastName,
c.Email
FROM
Customers c
LEFT JOIN
Payments p ON c.CustomerID = p.CustomerID
WHERE
p.PaymentID IS NULL;



/*
Scenario: To predict future market trends, the Royal Seer needs to know the last time each customer
 interacted with the Bazaar financially. She needs to see every customer, noting those who have been 
 inactive to scry why they have strayed.
Question: List all customers by their full name and the date of their most recent payment. 
If a customer has never made a payment, the payment date should be shown as NULL.

*/


SELECT c.FirstName, c.LastName,
MAX(p.PaymentDate) AS LastPaymentDate
FROM Customers c
LEFT JOIN Payments p ON c.CustomerID = p.CustomerID
GROUP BY
c.CustomerID, c.FirstName, c.LastName
ORDER BY
LastPaymentDate DESC;



/*
Scenario: The Welcome Committee wants to target newly registered customers from 2025 
who haven't made their first purchase. They plan to send these specific customers a "First-Time Buyer's" discount coupon.
Question: Create a list of all customers who registered in the year 2025 
but have not yet made any payments. Show their full name and registration date.

*/


SELECT
c.FirstName,
c.LastName,
c.RegistrationDate
FROM
Customers c
LEFT JOIN
Payments p ON c.CustomerID = p.CustomerID
WHERE
YEAR(c.RegistrationDate) = 2025 AND p.PaymentID IS NULL;



/*
Scenario: The Trade Ambassador from 'Dunmar' is worried that his kin are registering at the 
Bazaar but are not finding anything to purchase. He has requested a list of all customers 
from his homeland who have yet to spend any Dwarven Runes.
Question: Identify all customers from the country of 'Dunmar' who have never made a payment. 
Display their full name and city.

*/


SELECT
c.FirstName,
c.LastName,
c.City
FROM
Customers c
LEFT JOIN
Payments p ON c.CustomerID = p.CustomerID
WHERE
c.Country = 'Dunmar' AND p.PaymentID IS NULL;


/*
Scenario: The Payment Master is assessing the adoption of PayPal. 
He wants a complete list of all customers, showing clearly who has made a payment with PayPal and who has not. This will help him decide whether to offer a special PayPal-only discount.
Question: Display every customer's full name. In a second column called 'UsedPayPal', 
show 'Yes' if they have at least one completed payment using PayPal, and 'No' if they have not.

*/

SELECT
c.FirstName,
c.LastName,
CASE
WHEN COUNT(p.PaymentID) > 0 THEN 'Yes'
ELSE 'No'
END AS UsedPayPal
FROM
Customers c
LEFT JOIN
Payments p ON c.CustomerID = p.CustomerID AND p.PaymentMethod = 'PayPal' AND p.Status = 'Completed'
GROUP BY
c.CustomerID, c.FirstName, c.LastName
ORDER BY
c.LastName, c.FirstName;



