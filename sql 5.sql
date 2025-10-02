use sql_dataset;

select * from customers;

Select prefix, FirstName, LastName
from Customers
Where Prefix is null;

Select prefix, FirstName, LastName
from Customers
Where Prefix = '';

SET SQL_SAFE_UPDATES = 0;

UPDATE customers
SET Prefix = NULL
WHERE Prefix = '';

update customers set prefix = null where Prefix = '';

select * from customers;

delete from customers where CustomerKey = 11001;
START TRANSACTION;
Rollback;