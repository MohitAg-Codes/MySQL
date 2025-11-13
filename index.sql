create database indexxxx;

use indexxxx;

CREATE TABLE Employee_Detail(
ID int AUTO_INCREMENT PRIMARY KEY,
Name varchar(45),
Email varchar(45),
Phone varchar(15),
City varchar(25),
UNIQUE KEY unique_email (Email)
);

SHOW INDEXES FROM Employee_Detail;

INSERT INTO Employee_Detail(ID, Name, Email, Phone, City)
VALUES (1, 'Peter', 'peter@javatpoint.com', '49562959223', 'Texas'),
(2, 'Suzi', 'suzi@javatpoint.com', '70679834522', 'California'),
(3, 'Joseph', 'joseph@javatpoint.com', '09896765374', 'Alaska');

CREATE UNIQUE INDEX index_name_phone
ON Employee_Detail (Name, Phone);


CREATE TABLE `student_info` (
`studentid` int NOT NULL AUTO_INCREMENT,
`name` varchar(45) DEFAULT NULL,
`age` varchar(3) DEFAULT NULL,
`mobile` varchar(20) DEFAULT NULL,
`email` varchar(25) DEFAULT NULL,
PRIMARY KEY (`studentid`),         -- //clustered index
UNIQUE KEY `email_UNIQUE` (`email`)
);

CREATE  INDEX idx_studentid ON student_info (studentid);


CREATE TABLE saless (
sale_id INT AUTO_INCREMENT NOT NULL,
product_id INT NOT NULL,
sale_date DATE PRIMARY KEY NOT NULL,
amount DECIMAL(10, 2)
)
PARTITION BY RANGE (YEAR(sale_date)) (
PARTITION p0 VALUES LESS THAN (2018),
PARTITION p1 VALUES LESS THAN (2019),
PARTITION p2 VALUES LESS THAN (2020)
);

desc sales;

CREATE TABLE sale_mast (
bill_no INT NOT NULL,
bill_date TIMESTAMP NOT NULL,
cust_code VARCHAR(15) NOT NULL,
amount DECIMAL(8,2) NOT NULL
)
PARTITION BY RANGE (UNIX_TIMESTAMP(bill_date)) (
PARTITION p0 VALUES LESS THAN (UNIX_TIMESTAMP('2013-04-01')),
PARTITION p1 VALUES LESS THAN (UNIX_TIMESTAMP('2013-07-01')),
PARTITION p2 VALUES LESS THAN (UNIX_TIMESTAMP('2013-10-01')),
PARTITION p3 VALUES LESS THAN (UNIX_TIMESTAMP('2014-01-01'))
);

INSERT INTO sale_mast VALUES (1, '2013-01-02', 'C001', 125.56),
(2, '2013-01-25', 'C003', 456.50),
(3, '2013-02-15', 'C012', 365.00),
(4, '2013-03-26', 'C345', 785.00),
(5, '2013-04-19', 'C234', 656.00),
(6, '2013-05-31', 'C743', 854.00),
(7, '2013-06-11', 'C234', 542.00),
(8, '2013-07-24', 'C003', 300.00),
(8, '2013-08-02', 'C456', 475.20);

SELECT * FROM sale_mast;

SELECT PARTITION_NAME, TABLE_ROWS FROM INFORMATION_SCHEMA.PARTITIONS
WHERE TABLE_NAME='sale_mast';

CREATE TABLE Sales (
cust_id INT NOT NULL, 
name VARCHAR(40),
store_id VARCHAR(20) NOT NULL, 
bill_no INT NOT NULL,
bill_date DATE PRIMARY KEY NOT NULL,
 amount DECIMAL(8,2) NOT NULL
)
PARTITION BY RANGE (year(bill_date))(
PARTITION p0 VALUES LESS THAN (2016),
PARTITION p1 VALUES LESS THAN (2017),
PARTITION p2 VALUES LESS THAN (2018),
PARTITION p3 VALUES LESS THAN (2020));


INSERT INTO Sales VALUES
(1, 'Mike', 'S001', 101, '2015-01-02', 125.56),
(2, 'Robert', 'S003', 103, '2015-01-25', 476.50),
(3, 'Peter', 'S012', 122, '2016-02-15', 335.00),
(4, 'Joseph', 'S345', 121, '2016-03-26', 787.00),
(5, 'Harry', 'S234', 132, '2017-04-19', 678.00),
(6, 'Stephen', 'S743', 111, '2017-05-31', 864.00),
(7, 'Jacson', 'S234', 115, '2018-06-11', 762.00),
(8, 'Smith', 'S012', 125, '2019-07-24', 300.00),
(9, 'Adam', 'S456', 119, '2019-08-02', 492.20);

SELECT TABLE_NAME, PARTITION_NAME, TABLE_ROWS, AVG_ROW_LENGTH,
DATA_LENGTH
FROM INFORMATION_SCHEMA.PARTITIONS
WHERE TABLE_NAME = 'Sales';


CREATE TABLE sales1 (
sale_id INT,
product_id INT,
sale_date DATE,
category VARCHAR(20),
amount DECIMAL(10, 2)
)
PARTITION BY LIST COLUMNS (category) (
PARTITION p_electronics VALUES IN ('Electronics'),
PARTITION p_clothing VALUES IN ('Clothing'),
PARTITION p_furniture VALUES IN ('Furniture'),
PARTITION p_books VALUES IN ('Books')
);

INSERT INTO sales1 (sale_id, product_id, sale_date, category, amount)
VALUES
(1, 101, '2024-01-01', 'Electronics', 199.99),
(2, 102, '2024-01-02', 'Clothing', 49.99),
(3, 103, '2024-01-03', 'Furniture', 299.99),
(4, 104, '2024-01-04', 'Books', 19.99),
(5, 105, '2024-01-05', 'Electronics', 499.99),
(6, 106, '2024-01-06', 'Clothing', 89.99),
(7, 107, '2024-01-07', 'Furniture', 1299.99),
(8, 108, '2024-01-08', 'Books', 9.99),
(9, 109, '2024-01-09', 'Electronics', 299.99),
(10, 110, '2024-01-10', 'Clothing', 59.99),
(11, 111, '2024-01-11', 'Furniture', 799.99),
(12, 112, '2024-01-12', 'Books', 14.99),
(13, 113, '2024-01-13', 'Electronics', 399.99),
(14, 114, '2024-01-14', 'Clothing', 109.99),
(15, 115, '2024-01-15', 'Furniture', 499.99),
(16, 116, '2024-01-16', 'Books', 24.99),
(17, 117, '2024-01-17', 'Electronics', 599.99),
(18, 118, '2024-01-18', 'Clothing', 79.99),
(19, 119, '2024-01-19', 'Furniture', 699.9),
(20, 120, '2024-01-20', 'Books', 29.99);


SELECT PARTITION_NAME, SUBPARTITION_NAME, PARTITION_ORDINAL_POSITION,
SUBPARTITION_ORDINAL_POSITION, PARTITION_METHOD, SUBPARTITION_METHOD,
PARTITION_EXPRESSION, SUBPARTITION_EXPRESSION, PARTITION_DESCRIPTION
FROM
INFORMATION_SCHEMA.PARTITIONS
WHERE
TABLE_NAME = 'sales1';

drop table stores;

CREATE TABLE Stores (
cust_name VARCHAR(40),
bill_no VARCHAR(20) NOT NULL,
store_id INT PRIMARY KEY NOT NULL,
bill_date DATE NOT NULL,
amount DECIMAL(8,2) NOT NULL
)
PARTITION BY HASH(store_id)
PARTITIONS 3;

INSERT INTO Stores (cust_name, bill_no, store_id, bill_date, amount)
VALUES
('Alice', 'B001', 1, '2024-01-01', 150.75),
('Bob', 'B002', 2, '2024-01-02', 200.00),
('Charlie', 'B003', 3, '2024-01-03', 99.99),
('David', 'B004', 4, '2024-01-04', 175.50),
('Eva', 'B005', 5, '2024-01-05', 250.00),
('Frank', 'B006', 6, '2024-01-06', 300.75),
('Grace', 'B007', 7, '2024-01-07', 80.25),
('Hannah', 'B008', 8, '2024-01-08', 120.50),
('Ivan', 'B009', 9, '2024-01-09', 450.00),
('Jack', 'B010', 10, '2024-01-10', 60.00),
('Karen', 'B011', 11, '2024-01-11', 110.75),
('Leo', 'B012', 12, '2024-01-12', 220.00),
('Mia', 'B013', 13, '2024-01-13', 330.50),
('Nathan', 'B014', 14, '2024-01-14', 55.00),
('Olivia', 'B015', 15, '2024-01-15', 95.25),
('Paul', 'B016', 16, '2024-01-16', 500.00);

SELECT TABLE_NAME, PARTITION_NAME, TABLE_ROWS, AVG_ROW_LENGTH,
DATA_LENGTH
FROM INFORMATION_SCHEMA.PARTITIONS
WHERE TABLE_NAME = 'Stores';




