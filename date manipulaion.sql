/* ----------------- DATE MANIPULATION --------------------------*/

/*
Function: NOW()
When to use: To get the current date and time of the server. Perfect for timestamping an event.*/

SELECT NOW();

/*
Function: CURDATE()
When to use: To get only the current date, without the time portion.
*/

SELECT CURDATE();

/*
Function: CURTIME()
When to use: To get only the current time, without the date portion.
*/

SELECT CURTIME();


/*
Date and Time Arithmetic Functions

Function: DATE_ADD()
When to use: To add a specific time interval (days, months, years) to a date. 
Useful for calculating future dates like deadlines or expirations.
*/

SELECT DATE_ADD('2025-11-20', INTERVAL 15 DAY);


/*
Function: DATE_SUB()
When to use: To subtract a specific time interval from a date. 
Useful for finding records from a past period (e.g., "within the last 30 days").
*/

SELECT DATE_SUB('2025-11-20', INTERVAL 1 MONTH);


/*
Function: DATEDIFF()
When to use: To find the number of full days between two dates.
*/

SELECT DATEDIFF('2025-12-25', '2025-11-03');


/*
Function: TIMESTAMPDIFF()
When to use: A more flexible way to find the difference between two datetimes in a specified unit (e.g., HOUR, MINUTE, YEAR).
*/

SELECT TIMESTAMPDIFF(HOUR, '2025-11-03 09:00:00', '2025-11-03 17:30:00');


/* Functions to Extract Parts of a Date */

/*
Function: YEAR(), MONTH(), DAY()
When to use: To pull out the numerical value for the year, month, or day from a date. 
Essential for grouping and filtering data.
*/

SELECT YEAR('2025-11-03'), MONTH('2025-11-03'), DAY('2025-11-03');


/*
Function: DAYNAME() & MONTHNAME()
When to use: To get the full text name of the weekday or month, which is much more readable for reports.
*/

SELECT DAYNAME('2025-11-03'), MONTHNAME('2025-11-03');

/*
Function: HOUR(), MINUTE(), SECOND()
When to use: To extract the numerical hour, minute, or second from a time or datetime value. Useful for analyzing activity by time of day.
*/

SELECT HOUR('14:35:50'), MINUTE('14:35:50'), SECOND('14:35:50');


/*
Function: EXTRACT()
When to use: A very versatile function to get any single part of a date, such as YEAR, QUARTER, or even combined units like YEAR_MONTH.
*/

SELECT EXTRACT(YEAR_MONTH FROM '2025-11-03');


/*  Date Formatting and Conversion Functions */

/*
Function: DATE_FORMAT()
When to use: To convert a date into a string, formatted exactly how you want it to be displayed. Incredibly useful for reporting.
*/
SELECT DATE_FORMAT('2025-11-03', '%W, %D %M, %Y');

-- Year variations
-- Specifier : %Y (Description : Year, 4 digits)
SELECT DATE_FORMAT('2025-11-03', '%Y');

-- %y
-- Year, 2 digits
SELECT DATE_FORMAT('2025-11-03', '%y');

-- Month Variations
-- %M : Full month name
SELECT DATE_FORMAT('2025-11-03', '%M');

-- %b : Abbreviated month name	
SELECT DATE_FORMAT('2025-11-03', '%b');

-- %m : Month, numeric (00-12)
SELECT DATE_FORMAT('2025-11-03', '%m');

-- %c : Month, numeric (0-12)
SELECT DATE_FORMAT('2025-11-03', '%c');


-- Day Variations
-- %d : Day of the month (00-31)
SELECT DATE_FORMAT('2025-11-03', '%d');

-- %e : Day of the month (0-31)
SELECT DATE_FORMAT('2025-11-03', '%e');

-- %D : Day with suffix (e.g., 1st, 2nd)
SELECT DATE_FORMAT('2025-11-03', '%D');

-- %j : Day of the year (001-366)
SELECT DATE_FORMAT('2025-11-03', '%j');	

-- Weekday Variations
-- %W : Full weekday name
SELECT DATE_FORMAT('2025-11-03', '%W');

-- %a	Abbreviated weekday name
SELECT DATE_FORMAT('2025-11-03', '%a');

-- %w	Day of the week (0=Sunday)
SELECT DATE_FORMAT('2025-11-03', '%w');

-- Hour Variations

-- %H	Hour (00-23), 24-hour
SELECT DATE_FORMAT('2025-11-03 17:08:05', '%H');

-- %k	Hour (0-23), 24-hour
SELECT DATE_FORMAT('2025-11-03 17:08:05', '%k');

-- %h	Hour (01-12), 12-hour
SELECT DATE_FORMAT('2025-11-03 17:08:05', '%h');

-- %I	Hour (01-12), 12-hour
SELECT DATE_FORMAT('2025-11-03 17:08:05', '%I');

-- %p	AM or PM
SELECT DATE_FORMAT('2025-11-03 17:08:05', '%p');

-- Minute and Second Variations

-- %i	Minutes (00-59)
SELECT DATE_FORMAT('2025-11-03 17:08:05', '%i');

-- %s	Seconds (00-59)	
SELECT DATE_FORMAT('2025-11-03 17:08:05', '%s');

-- %S	Seconds (00-59)	
SELECT DATE_FORMAT('2025-11-03 17:08:05', '%S');


-- Common Combinations (Shortcuts)

-- %r	12-hour time (hh:mm:ss AM/PM)
SELECT DATE_FORMAT('2025-11-03 17:08:05', '%r');


-- %T	24-hour time (HH:MM:SS)
SELECT DATE_FORMAT('2025-11-03 17:08:05', '%T');


-- %c	Standard date & time
SELECT DATE_FORMAT('2025-11-03 17:08:05', '%a %b %c %H:%i:%s %Y');


-- Week of Year Variations

-- %U Week (00-53), Sunday is first day	
SELECT DATE_FORMAT('2025-11-03', '%U');

-- %u	Week (00-53), Monday is first day
SELECT DATE_FORMAT('2025-11-03', '%u');

-- %V	Week (01-53), Sunday is first day
SELECT DATE_FORMAT('2025-11-03', '%V');

-- %v	Week (01-53), Monday is first day
SELECT DATE_FORMAT('2025-11-03', '%v');


-- Literal Characters
-- You can also include your own characters like commas, slashes, or spaces. To include a literal % character, you must use %%.

-- Date with slashes
SELECT DATE_FORMAT('2025-11-03', '%m/%d/%Y');

-- ISO 8601 Format
SELECT DATE_FORMAT('2025-11-03 17:08:05', '%Y-%m-%d %H:%i:%s');

-- Text with a literal %
SELECT DATE_FORMAT('2025-11-03', 'Completed on %M %D. 100%% Done.');

/*
Function: UNIX_TIMESTAMP()
When to use: To convert a standard date or datetime value into its Unix timestamp integer equivalent.
*/

/*
Function: STR_TO_DATE()
When to use: The opposite of DATE_FORMAT. Use this to convert a string that contains a date in a custom format into a real MySQL date.
*/

SELECT STR_TO_DATE('November 03, 2025', '%M %d, %Y');


/*
Function: FROM_UNIXTIME()
When to use: To convert a Unix timestamp (a large integer representing seconds since 1970-01-01) into a standard, readable datetime format.
*/

SELECT FROM_UNIXTIME(1762200000);

/*
Function: UNIX_TIMESTAMP()
When to use: To convert a standard date or datetime value into its Unix timestamp integer equivalent.
*/

SELECT UNIX_TIMESTAMP('2025-11-03 14:40:00');



/* -------- Practice --------------*/

CREATE DATABASE IF NOT EXISTS simple_store;
USE simple_store;

-- Create an employees table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    full_name VARCHAR(100),
    hire_date DATE
);

-- Create an orders table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_datetime DATETIME,
    shipped_date DATE,
    order_total DECIMAL(10, 2)
);


-- Populate the tables with sample data
INSERT INTO employees (employee_id, full_name, hire_date) VALUES
(101, 'Alice Johnson', '2023-03-15'),
(102, 'Bob Williams', '2022-08-01'),
(103, 'Charlie Brown', '2024-01-20');

INSERT INTO orders (order_id, customer_id, order_datetime, shipped_date, order_total) VALUES
(1, 1, '2024-10-25 08:30:00', '2024-10-27', 150.75),
(2, 2, '2024-11-03 14:15:45', '2024-11-05', 200.00),
(3, 1, '2025-02-10 10:00:00', '2025-02-12', 75.50),
(4, 3, '2025-02-20 18:45:10', '2025-02-22', 310.20),
(5, 2, '2025-03-05 20:05:00', NULL, 50.00), -- Not yet shipped
(6, 4, '2025-05-15 09:00:00', '2025-05-16', 450.00),
(7, 1, '2025-08-30 11:25:30', '2025-09-01', 120.00),
(8, 3, '2025-11-12 16:10:00', '2025-11-14', 99.99);



/*
Question 1: How long has each employee been working with the company, in days?
Function Used: DATEDIFF() to calculate the difference between two dates. CURDATE() to get today's date.
*/

SELECT full_name, hire_date, DATEDIFF(CURDATE(), hire_date) AS days_with_company
FROM employees;


/*
Question 2: We need to follow up on orders 30 days after they are placed. What is the follow-up date for each order?
Function Used: DATE_ADD() to add an interval to a date.
*/

SELECT order_id, order_datetime, DATE_ADD(order_datetime, INTERVAL 30 DAY) AS follow_up_date
FROM orders;


/*
Question 3: How many days did it take to ship each order after it was placed?
Function Used: DATEDIFF() on the shipped_date and the date part of order_datetime. DATE() to extract the date.
*/

SELECT order_id, order_datetime, shipped_date, DATEDIFF(shipped_date, DATE(order_datetime)) AS days_to_ship
FROM orders
WHERE shipped_date IS NOT NULL;


/*
Question 4: What were our total sales for each quarter of 2025?
Functions Used: QUARTER() to group by quarter, SUM() for aggregation, and YEAR() to filter.
*/

SELECT CONCAT('Q', QUARTER(order_datetime)) AS sales_quarter, SUM(order_total) AS total_sales
FROM orders
WHERE YEAR(order_datetime) = 2025
GROUP BY sales_quarter
ORDER BY sales_quarter;


/*
Question 5: Which day of the week is most popular for placing orders?
Functions Used: DAYNAME() to get the name of the week, COUNT() and GROUP BY for analysis.

*/

SELECT DAYNAME(order_datetime) AS day_of_week, COUNT(order_id) AS number_of_orders
FROM orders
GROUP BY day_of_week
ORDER BY number_of_orders DESC;


/*
Question 6: Generate a monthly sales report for 2025, formatted as 'YYYY-MM'.
Functions Used: DATE_FORMAT() to create the 'YYYY-MM' label.
*/

SELECT DATE_FORMAT(order_datetime, '%Y-%m') AS sales_month, SUM(order_total) AS monthly_total
FROM orders
WHERE YEAR(order_datetime) = 2025
GROUP BY sales_month
ORDER BY sales_month;


/*
Question 7: List all orders placed in the afternoon (from 12:00 PM onwards).
Function Used: HOUR() to extract the hour from the timestamp.
*/

SELECT order_id,order_total, order_datetime
FROM orders
WHERE HOUR(order_datetime) >= 12;



/*
Question 8: Find the total number of hours between when an order was placed and when it was shipped.
Function Used: TIMESTAMPDIFF() to get the difference in a specific unit (hours).
*/

SELECT order_id, order_datetime, shipped_date, TIMESTAMPDIFF(HOUR, order_datetime, shipped_date) AS hours_to_ship
FROM orders
WHERE shipped_date IS NOT NULL;


/*
Question 09 : Format the order dates for a customer-facing report (e.g., "Monday, 3rd November, 2024").
Function Used: DATE_FORMAT() for rich, readable formatting.
*/

SELECT order_id, order_total, DATE_FORMAT(order_datetime, '%W, %D %M, %Y') AS formatted_date
FROM orders;