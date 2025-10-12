use dena_bank;

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    PhoneNumber VARCHAR(20)
);

INSERT INTO Employees (EmployeeID, FirstName, LastName, Email, PhoneNumber) VALUES
(101, 'John', 'Doe', 'john.doe@example.com', '555-0101'),
(102, 'Jane', 'Smith', 'JANE.SMITH@example.com', '555-0102'),
(103, 'Peter', 'Jones', 'peter.jones@example.com', '555-0103'),
(104, 'Mary', 'Williams', 'mary.w@workplace.net', '555-0104');

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Description VARCHAR(255),
    Price DECIMAL(10,2),
    SKU VARCHAR(50)
);


INSERT INTO Products (ProductID, ProductName, Description, Price, SKU) VALUES
(1, 'Super Widget', 'A reliable widget for all your needs.', 19.99, 'WID-SUPER-001'),
(2, 'Mega Gadget', 'The best gadget in the world.', 120.50, 'GAD-MEGA-002'),
(3, 'Tiny Gizmo', 'A small gizmo with big features.', 9.50, '#GIZ-TINY-003#'),
(4, 'Power Drill', 'A powerful drill for home use.', 89.95, 'DRL-POW-004');

select * from Employees;
select * from Products;

-- 1.	Combine Names:
-- Write a query to display the full name of each employee by combining their FirstName and LastName, separated by a space.
--  Name the resulting column FullName.

SELECT CONCAT(FirstName, ' ', LastName ) AS FullName FROM Employees;

-- 2.	Combine with Separator:
-- Using CONCAT_WS, create a "contact string" for each employee in the format LastName, FirstName - Email. Name the column ContactInfo.

SELECT CONCAT_WS(' - ',CONCAT_WS(', ',LastName , FirstName),Email) AS ContactInfo FROM Employees;

-- 3.	Standardize Emails:
-- Some emails in the Employees table are in uppercase. Write a query to select all emails and display them in lowercase.
--  Name the column StandardizedEmail.

SELECT LOWER(email) as StandardizedEmail FROM Employees;

-- 4.	Calculate Name Length:
-- Write a query to find the character length of each employee's full name (first name, a space, and last name). 
-- Name the column FullNameLength.

SELECT CONCAT(FirstName, ' ', LastName ) AS FullName, 
LENGTH(CONCAT(FirstName, ' ', LastName )) AS FullNameLength FROM Employees;

-- 5.	Extract Usernames:
-- From the Employees table, extract the part of the email address that comes before the @ symbol. 
-- Name this column Username. (Hint: You will need to combine SUBSTRING and INSTR).

SELECT  Email , SUBSTRING(Email , 1, INSTR(Email, '@')-1) AS UserName
 FROM Employees;


-- 6.	Find a Substring Position:
-- Write a query to find the starting position of the word 'widget' in the Description column of the Products table. 
-- Name the column WidgetPosition.

SELECT  Description, INSTR(Description, 'Widget') AS WidgetPosition
 FROM Products;
 
--  7.	Replace Text:
-- The marketing team wants to replace the word 'world' with 'universe' in the Description for the 'Mega Gadget'. 
-- Write a query to display the updated description.

SELECT  REPLACE(Description, 'world' , 'universe') As UpdatedDescription
 FROM Products
 WHERE ProductName = 'Mega Gadget';
 
--  8.	Get First Initials:
-- Create a column named Initials that shows the first letter of the FirstName and the first letter of the LastName for each employee,
--  concatenated together (e.g., 'JD' for John Doe).

SELECT  firstName , lastName , CONCAT(LEFT(firstName,1),LEFT(LastName , 1)) AS Initials
 FROM Employees;
 
--  9.	Data Cleaning with TRIM:
-- The ProductName for Product ID 1 has a leading space. Write a query to display all product names with any leading or trailing spaces
--  removed. Name the column CleanedProductName.

SELECT  TRIM(ProductName) AS CleanedProductName
 FROM Products;
 
 -- 10.	Reverse the SKU:
-- For internal auditing purposes, write a query to display each product's SKU in reverse order. Name the column ReversedSKU.

SELECT  REVERSE(SKU) AS ReversedSKU
 FROM Products;
 
--  11.	Extract Product Prefix:
-- The first 3 characters of a SKU represent the product category. Write a query to extract this 3-character prefix from 
-- the SKU of each product. Name the column SKU_Prefix.

SELECT  SUBSTRING(TRIM(BOTH '#' from SKU) , 1, 3) AS SKU_Prefix
 FROM Products;
 
--  12.	Extract Last 4 Digits of Phone Number:
-- Write a query to display only the last 4 digits of each employee's PhoneNumber. 
-- Assume the format is consistent. Name the column Last4Phone.

SELECT RIGHT(PhoneNumber , 4) AS Last4Phone
 FROM Employees;
 
--  13.	Format Product Prices:
-- Display the Price of each product formatted as a string with two decimal places and a dollar sign at the beginning (e.g., '$19.99'). 
-- Name the column FormattedPrice. (Hint: You may need FORMAT or ROUND and CONCAT).

SELECT CONCAT('$',ROUND(Price,2)) AS FormattedPrice
 FROM Products;
 
--  14.	Find ASCII Value:
-- Write a query to find the ASCII value of the first character of each employee's FirstName. Name the column FirstNameASCII.

SELECT ASCII(LEFT(FirstName, 1)) AS FirstNameASCII
 FROM Employees;

-- 15.	Repeat a Character:
-- Create a "rating" representation for products. For each product, display its ProductName followed by a string of 5 
-- repeated asterisks (*****). Name the column ProductRating.

SELECT CONCAT(ProductName, ' ', REPEAT('*',5)) AS ProductRating
 FROM Products;
 
--  16.	Advanced Data Cleaning with TRIM:
-- The SKU for Product ID 3 is surrounded by # symbols. Write a query to remove these specific symbols from the beginning and 
-- end of the SKU.

SELECT TRIM('#' FROM SKU) AS CleanedSKU
 FROM Products
 WHERE ProductID = 3;
 
--  17.	Case-Insensitive Search Position:
-- Find the position of the first occurrence of the letter 'p', regardless of its case (either 'p' or 'P'), in the ProductName column.
--  (Hint: Use LOWER or UPPER within the INSTR or POSITION function).

SELECT ProductName , INSTR(LOWER(ProductName) ,'p') AS PositionOfP
 FROM Products;
 
--  18.	Generate a Login ID:
-- Create a unique LoginID for each employee. The LoginID should be the first 3 letters of their FirstName concatenated with the 
-- full LastName, all in lowercase. For John Doe, it would be 'johndoe'.

SELECT FirstName, LastName , LOWER(CONCAT(LEFT(FirstName,3) , LastName)) as LoginID
 FROM Employees;
 
--  19.	Byte Length vs. Character Length:
-- Write a query that shows the ProductName, its length in characters (CHAR_LENGTH), and its length in bytes (LENGTH) to compare the two.

SELECT 
    ProductName,
    CHAR_LENGTH(ProductName) AS CharLength,
    LENGTH(ProductName) AS ByteLength
FROM Products;

-- 20.	Create a Summary Description:
-- Write a query to generate a summary sentence for each product in the format: "The product '[ProductName]' 
-- has a price of [Price] and its SKU is [SKU]." For example: "The product 'Mega Gadget' has a price of 120.50 and 
-- its SKU is GAD-MEGA-002." Name the column ProductSummary.

SELECT CONCAT('The product ', productName , ' has a price of ', Price , ' and its SKU is ' , SKU ) AS ProductSummary
FROM Products;

 





