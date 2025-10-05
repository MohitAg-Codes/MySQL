-- 1.	What is the total revenue (sum of unit_price * quantity) for each product category? Rank the categories from most profitable to least profitable.

SELECT product_category , SUM(unit_price * quantity) AS total_revenue
FROM sales_records
GROUP BY product_category
ORDER BY total_revenue DESC;

-- 2.	How many orders were shipped to each region? List the regions from most to least orders.

SELECT shipping_region , COUNT(*) AS total_orders
FROM sales_records
GROUP BY shipping_region
ORDER BY total_orders DESC;

-- 3.	For all orders placed before January 15th, 2024, how many items were sold per day? Order the results by date.

SELECT order_date , SUM(quantity) AS total_item_sold
FROM sales_records
WHERE order_date < '2024-01-15'
GROUP BY order_date
ORDER BY order_date ASC;

-- 4.	What is the total amount spent by each customer? 
-- Display the customer's name and their total spending, ordered from the highest spender to the lowest

SELECT customer_name , SUM(unit_price * quantity) AS total_amount
FROM sales_records
GROUP BY customer_name
ORDER BY total_amount DESC;

-- 5.	For the 'South' shipping region, what was the total quantity of items sold for each product category?

SELECT product_category , SUM(quantity) AS total_item_sold
FROM sales_records
WHERE shipping_region = 'South'
GROUP BY product_category;

-- 6.	What is the most expensive and least expensive unit price for a product in our entire store?

SELECT MAX(unit_price) AS most_expensive_unit_price,
	   MIN(unit_price) AS least_expensive_unit_price
FROM sales_records;

-- 7.	How many orders were paid for using 'Credit Card'?

SELECT COUNT(*) AS total_credit_card_orders
FROM sales_records
WHERE payment_method = 'Credit Card';

-- 8.	List all customers who have purchased 'Books'. 
-- Show each customer's name and the total number of books they bought, ordered alphabetically by customer name.

SELECT customer_name, SUM(quantity) AS total_books
FROM sales_records
WHERE product_category = 'Books'
GROUP BY customer_name
ORDER BY customer_name ASC;

-- 9.	What is the average order value (unit_price * quantity) for each payment method?

SELECT payment_method, ROUND(AVG(unit_price * quantity), 2) AS avg_order_value
FROM sales_records
GROUP BY payment_method;

-- 10.	Find the total number of items sold for each order_status. Sort the list by the status name.

SELECT order_status, SUM(quantity) AS total_items_sold
FROM sales_records
GROUP BY order_status
ORDER BY order_status ASC;