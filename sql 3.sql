use sql_dataset;

select * from customers;
desc customers;
select CustomerKey, FirstName, LastName, AnnualIncome, TotalChildren from customers where TotalChildren  <> 5;

select CustomerKey, FirstName, LastName, AnnualIncome, TotalChildren, homeowner from customers where NOT homeowner = "Y";

select CustomerKey, FirstName, LastName, AnnualIncome, TotalChildren from customers where firstName like 's%';

select CustomerKey, FirstName, LastName, AnnualIncome, TotalChildren from customers where lastName like 'S%S';

select CustomerKey, FirstName, LastName, AnnualIncome, TotalChildren from customers where FirstName like '%A%';

select CustomerKey, FirstName, LastName, AnnualIncome, TotalChildren from customers where lastName like "%A_G";

select CustomerKey, FirstName, LastName, AnnualIncome, TotalChildren from customers where firstName like "[ae]%";

Select CustomerKey, FirstName, LastName, AnnualIncome, TotalChildren 
From customers 
Where TotalChildren between 0 and 2;

select * from products;

select productKey, productSKU , productName from products limit 10 offset 5;