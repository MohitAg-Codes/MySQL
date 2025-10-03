CREATE DATABASE sales;
USE sales;

CREATE TABLE sales_records (
    order_id INT PRIMARY KEY,               -- A unique ID for each order line, our Primary Key
    customer_name VARCHAR(50),              -- Name of the customer
    customer_email VARCHAR(50),             -- Customer's email, useful for contact
    product_name VARCHAR(50),               -- The name of the product purchased
    product_category VARCHAR(30),           -- The category the product belongs to (e.g., Electronics, Books)
    unit_price DECIMAL(10, 2),              -- The price of a single unit of the product
    quantity INT,                           -- The number of units purchased in this order
    order_date DATE,                        -- The date the order was placed
    order_status VARCHAR(20),               -- The current status of the order (e.g., Shipped, Pending)
    shipping_region VARCHAR(20),            -- The geographical region for shipping
    payment_method VARCHAR(20)              -- How the customer paid (e.g., Credit Card, PayPal)
);

-- Step 4: Insert 30 records into the sales_records table
-- The data includes repeat customers, multiple product categories, and varied statuses to make queries interesting.
INSERT INTO sales_records (order_id, customer_name, customer_email, product_name, product_category, unit_price, quantity, order_date, order_status, shipping_region, payment_method) VALUES
(101, 'Alice Johnson', 'alice.j@email.com', 'Laptop', 'Electronics', 1200.00, 1, '2024-01-05', 'Delivered', 'North', 'Credit Card'),
(102, 'Bob Williams', 'bob.w@email.com', 'Smartphone', 'Electronics', 800.00, 1, '2024-01-06', 'Shipped', 'South', 'PayPal'),
(103, 'Charlie Brown', 'charlie.b@email.com', 'SQL for Beginners', 'Books', 25.50, 2, '2024-01-06', 'Shipped', 'West', 'Debit Card'),
(104, 'Diana Prince', 'diana.p@email.com', 'Coffee Maker', 'Home Goods', 75.00, 1, '2024-01-07', 'Pending', 'East', 'Credit Card'),
(105, 'Alice Johnson', 'alice.j@email.com', 'Headphones', 'Electronics', 150.00, 1, '2024-01-08', 'Delivered', 'North', 'Credit Card'),
(106, 'Ethan Hunt', 'ethan.h@email.com', 'T-Shirt', 'Apparel', 20.00, 3, '2024-01-09', 'Shipped', 'South', 'PayPal'),
(107, 'Fiona Glenanne', 'fiona.g@email.com', 'The Great Gatsby', 'Books', 15.00, 1, '2024-01-10', 'Delivered', 'West', 'Debit Card'),
(108, 'Bob Williams', 'bob.w@email.com', 'Laptop Charger', 'Electronics', 45.00, 1, '2024-01-11', 'Shipped', 'South', 'PayPal'),
(109, 'George Costanza', 'george.c@email.com', 'Blender', 'Home Goods', 90.00, 1, '2024-01-12', 'Delivered', 'East', 'Credit Card'),
(110, 'Diana Prince', 'diana.p@email.com', 'Jeans', 'Apparel', 60.00, 2, '2024-01-13', 'Pending', 'East', 'Credit Card'),
(111, 'Harry Potter', 'harry.p@email.com', 'Advanced Potions', 'Books', 40.00, 1, '2024-01-14', 'Shipped', 'North', 'PayPal'),
(112, 'Irene Adler', 'irene.a@email.com', 'Keyboard', 'Electronics', 95.00, 1, '2024-01-15', 'Delivered', 'West', 'Debit Card'),
(113, 'Alice Johnson', 'alice.j@email.com', 'Data Science Intro', 'Books', 55.00, 1, '2024-01-16', 'Shipped', 'North', 'Credit Card'),
(114, 'Jack Sparrow', 'jack.s@email.com', 'Kitchen Knives Set', 'Home Goods', 120.00, 1, '2024-01-17', 'Cancelled', 'South', 'PayPal'),
(115, 'Karen Page', 'karen.p@email.com', 'Winter Coat', 'Apparel', 180.00, 1, '2024-01-18', 'Shipped', 'East', 'Credit Card'),
(116, 'Bob Williams', 'bob.w@email.com', 'Mouse', 'Electronics', 25.00, 1, '2024-01-19', 'Delivered', 'South', 'PayPal'),
(117, 'Luke Skywalker', 'luke.s@email.com', 'To Kill a Mockingbird', 'Books', 18.00, 1, '2024-01-20', 'Pending', 'West', 'Debit Card'),
(118, 'Diana Prince', 'diana.p@email.com', 'Toaster', 'Home Goods', 35.00, 1, '2024-01-21', 'Shipped', 'East', 'Credit Card'),
(119, 'Michael Scott', 'michael.s@email.com', 'Office Chair', 'Home Goods', 250.00, 1, '2024-01-22', 'Delivered', 'North', 'Debit Card'),
(120, 'Nancy Drew', 'nancy.d@email.com', 'Sweater', 'Apparel', 45.00, 2, '2024-01-23', 'Shipped', 'South', 'PayPal'),
(121, 'Alice Johnson', 'alice.j@email.com', 'Webcam', 'Electronics', 85.00, 1, '2024-01-24', 'Pending', 'North', 'Credit Card'),
(122, 'Oliver Queen', 'oliver.q@email.com', '1984', 'Books', 12.50, 1, '2024-01-25', 'Delivered', 'West', 'Credit Card'),
(123, 'Pam Beesly', 'pam.b@email.com', 'Desk Lamp', 'Home Goods', 40.00, 1, '2024-01-25', 'Shipped', 'East', 'PayPal'),
(124, 'Quentin Coldwater', 'quentin.c@email.com', 'The Magicians', 'Books', 22.00, 1, '2024-01-26', 'Delivered', 'North', 'Debit Card'),
(125, 'Bob Williams', 'bob.w@email.com', 'External Hard Drive', 'Electronics', 110.00, 1, '2024-01-27', 'Shipped', 'South', 'PayPal'),
(126, 'Rachel Green', 'rachel.g@email.com', 'Designer Scarf', 'Apparel', 95.00, 1, '2024-01-28', 'Pending', 'East', 'Credit Card'),
(127, 'Steve Rogers', 'steve.r@email.com', 'Dumbbells Set', 'Fitness', 85.00, 1, '2024-01-29', 'Delivered', 'West', 'Debit Card'),
(128, 'Tony Stark', 'tony.s@email.com', 'Smartwatch', 'Electronics', 350.00, 1, '2024-01-30', 'Shipped', 'North', 'Credit Card'),
(129, 'Ursula Buffay', 'ursula.b@email.com', 'Yoga Mat', 'Fitness', 30.00, 1, '2024-01-30', 'Delivered', 'South', 'PayPal'),
(130, 'Charlie Brown', 'charlie.b@email.com', 'History of SQL', 'Books', 30.00, 1, '2024-01-31', 'Pending', 'West', 'Debit Card');

SELECT * FROM sales_records;

-- 1.	The marketing team is reviewing the performance of our tech products.
-- For all orders in the 'Electronics' category, what is the total combined revenue?
-- Calculate this by summing the unit_price multiplied by quantity for each relevant order.

SELECT product_category, SUM(unit_price * quantity) AS revenue
FROM sales_records
WHERE product_category = 'Electronics';

-- 2.	Our retention team wants to identify potentially loyal customers.
-- Can you create a report that lists each unique customer and the total number of orders they have placed?
-- Please sort the list to show the customers with the most orders at the top.

SELECT customer_name, COUNT(order_id) AS total_orders
FROM sales_records
GROUP BY customer_name
ORDER BY total_orders DESC;

-- 3.	The logistics department is analyzing performance in our western and northern territories.
-- For orders shipped to the 'North' or 'West' regions, what is the average total value per order?
-- Present the results grouped by region and sorted alphabetically.

SELECT shipping_region , ROUND(AVG(unit_price * quantity), 2) AS avg_value
FROM sales_records
WHERE shipping_region IN ('North' , 'West')
GROUP BY shipping_region
ORDER BY shipping_region ASC;

-- 4.	For our weekly performance review, we need to analyze sales from January 15th to January 21st, 2024.
-- Can you determine the total quantity of items sold within each product category during this period?
-- Rank the categories to show which one sold the most items at the top.

SELECT product_category , SUM(quantity) AS total_quantity
FROM sales_records
WHERE order_date BETWEEN '2024-01-15' AND '2024-01-21'
GROUP BY product_category
ORDER BY total_quantity DESC;

-- 5.	Management wants to understand the transaction patterns for our 'Apparel' category.
-- What is the average number of items (quantity) per order for this category?
-- Also, find the single most expensive and least expensive item sold within 'Apparel'

SELECT product_category , AVG(quantity) AS avg_items,
                        MAX(unit_price) AS most_expensive_item,
                        MIN(unit_price) AS least_expensive_item
FROM sales_records
WHERE product_category = 'Apparel';

-- 6.	The payments team is assessing the usage of different payment methods.
-- For orders with a 'Shipped' or 'Delivered' status, can you count how many transactions were made with each payment_method?
-- Order the results alphabetically by the payment method's name.

SELECT payment_method, COUNT(*) AS total_transactions
FROM sales_records
WHERE order_status IN ('Delivered' , 'Shipped')
GROUP BY payment_method
ORDER BY payment_method ASC;

-- 7.	We're planning a promotion for our 'Books' category and need to understand our customer base.
-- Who are the top 3 spenders on 'Books' based on their total purchase value (unit_price * quantity)?
-- Display the customer's name and their total spending on books, in descending order.

SELECT customer_name , SUM(unit_price * quantity) AS total_purchase
FROM sales_records
WHERE product_category = 'Books'
GROUP BY customer_name
ORDER BY total_purchase DESC
LIMIT 3;

-- 8.	The inventory team needs to know the sales velocity of high-ticket items.
-- For all products with a unit_price over $100, what is the total revenue generated per product category?
-- Sort the categories to show the highest revenue earner from these expensive items first.

SELECT product_category , SUM(unit_price * quantity) AS Revenue
FROM sales_records
WHERE unit_price > 100
GROUP BY product_category
ORDER BY Revenue DESC;

-- 9.	A campaign was launched targeting 'Credit Card' users in the 'East' region.
-- What was the total sales revenue from this specific customer segment?
-- The result should be a single number representing the total value of their orders.

SELECT SUM(unit_price * quantity) AS Revenue
FROM sales_records
WHERE payment_method = 'Credit Card' AND shipping_region = 'East';

-- 10.	We want to see a daily summary of our business operations for the last week of data (Jan 24th onwards).
-- For each day, calculate the total number of orders placed and the total number of items sold.
-- Order the report chronologically by date.

SELECT order_date , COUNT(*) AS total_orders , SUM(quantity) AS total_item_sold
FROM sales_records
WHERE order_date >= '2024-01-24'
GROUP BY order_date
ORDER BY order_date ASC;

-- 11.	To identify potential data entry errors, we need to check our order statuses.
-- Can you count the number of orders for each distinct order_status in the system?
-- Present the list ordered by the count of orders, from the most common status to the least common.

SELECT order_status , COUNt(*) AS total_orders
FROM sales_records
GROUP BY order_status
ORDER BY total_orders DESC;

-- 12.	The product team is analyzing the popularity of lower-priced items.
-- For all orders where the unit_price is less than $50, how many items were sold in each shipping_region?
-- Order the results by the total quantity sold in descending order.

SELECT shipping_region , SUM(quantity) AS total_items_sold
FROM sales_records
WHERE unit_price < 50
GROUP BY shipping_region
ORDER BY total_items_sold DESC;

-- 13.	A customer, 'Alice Johnson', has called for a summary of her 'Shipped' orders.
-- What is the total amount she has spent specifically on orders that have a 'Shipped' status?
-- Provide a single value representing her total spending for those orders.

SELECT customer_name, SUM(quantity * unit_price) AS total_amount
FROM sales_records
WHERE customer_name = 'Alice Johnson' AND order_status = 'Shipped';

-- 14.	We want to find our most valuable individual order lines in the 'Home Goods' category.
-- Can you list the top 3 order lines from this category, based on the total value of the line (unit_price * quantity)?
-- Display the product name and its calculated total value.

SELECT product_name, (quantity * unit_price) AS total_value
FROM sales_records
WHERE product_category = 'Home Goods' 
ORDER BY total_value DESC
LIMIT 3;

-- 15.	Let's analyze the first ten days of sales (up to and including January 10th).
-- For this period, what was the average unit_price of products sold in each category?
-- Order the results by the average price in descending order.

SELECT product_category , ROUND(AVG(unit_price), 2) AS avg_price
FROM sales_records
WHERE Order_date <= '2024-01-10'
GROUP BY product_category
ORDER BY avg_price DESC;