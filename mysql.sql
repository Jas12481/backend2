SHOW DATABASES;

SHOW TABLES;

SELECT * FROM product;

SELECT product_name,product_market_price FROM product;

SELECT
    product_name as "Product Name",
    product_market_price as "Price"
FROM product;

describe product;

SHOW TABLES;

SELECT * FROM customer;

SELECT customer_id,customer_name,customer_wallet FROM customer;

DESC customer;

select * from product where product_market_price < 500;

select *
from product
where
    product_market_price < 500
    and product_id > 5;

select *
from product
where
    product_market_price < 500
    or product_id < 5;

SELECT * FROM product ORDER BY product_market_price DESC;

SELECT * FROM product ORDER BY product_market_price DESC, product_name ASC;

SELECT *
FROM product
ORDER BY
product_market_price DESC,
product_name ASC;

SELECT *
FROM product
ORDER BY
    product_market_price DESC,
    product_name DESC;

SELECT
product_name as "Name",
product_market_price as "Price"
FROM product
where product_id < 6
order by product_name;

select * from product where product_id in (1,2,3);

select * from product limit 5;

SELECT * FROM customer where customer_wallet > 5000 and customer_tolerance > 0.7
ORDER BY customer_wallet DESC;

select * from customer where customer_id in (1,3,5,7,9);

select * from customer order by customer_wallet DESC limit 5 ;

select MAX(product_market_price) from product;

select AVG(product_market_price) from product;

select
    MIN(product_market_price) as "MAX PRICE",
    MAX(product_market_price) as "MIN PRICE"
from product;

select NOW();

select STRCMP("Jasbir","Kaur");

SELECT strcmp(customer_name,customer_email) from customer;

select MAX(customer_wallet) from customer;

select * from customer where customer_wallet = (select max(customer_wallet) from customer);

-- to compute second highest
-- - find the highest value
-- - filter out the highest value
-- - find the highest value from the filtered data.

select * from customer where customer_wallet != (select max(customer_wallet) from customer)
ORDER BY customer_wallet DESC;

select
    customer_type,
    AVG(customer_wallet),
    MAX(customer_wallet)
from customer
group by customer_type
ORDER BY customer_wallet;

select
    customer_type,
    AVG(customer_wallet) as avg_wallet,
    MAX(customer_wallet) as max_wallet
from customer
group by customer_type
ORDER BY avg_wallet;

SELECT
customer_type,
MAX(customer_wallet)
from customer
GROUP BY customer_tolerance
ORDER BY customer_wallet DESC;

select
    customer_type,
    AVG(customer_wallet) as avg_wallet
from customer
group by customer_type;

select * from transaction;

select
    product_id as "Product ID",
    sum(transaction_quantity) as "Quantity Sold"
from transaction
GROUP BY product_id;

select c.customer_id, c.customer_name, t.transaction_datetime, t.product_id
from customer as c inner join transaction as t
on c.customer_id = t.customer_id;

select c.customer_id, c.customer_name, t.transaction_datetime, t.product_id
from customer as c left join transaction as t
on c.customer_id = t.customer_id;

select * from transaction;

select
    seller_id as "Seller ID",
    sum(transaction_quantity) as "Quantity Sold"
from transaction
GROUP BY product_id;

select * from seller;

SELECT
a.seller_name, b.*
from seller as a inner join transaction as b
on a.seller_id=b.seller_id;

SELECT * from customer;

select a.customer_name, MAX(b.transaction_datetime)
from customer as a inner join transaction as b
on a.customer_id=b.customer_id
group by a.customer_id;

select a.seller_name as "Seller Name", AVG(b.transaction_amount) as "Average Transaction Amt", COUNT(b.transaction_amount) as "No. of Transactions", SUM(b.transaction_amount) as "Total Transactions Amt"
from seller as a left join transaction as b
on a.seller_id=b.seller_id
group by a.seller_id;

select * from product
where product_name LIKE "IPhone%";

create DATABASE b19_jasbir;

insert into
    users (name, email, mobile, wallet)
values (
        'Jon',
        'jon@gmail.com',
        '88888888',
        '20.0'
    ), (
        'Keith',
        'keith@gmail.com',
        '77777777',
        '30.0'
    );

    create TABLE 
inventory (
    id INT AUTO_INCREMENT,
    item VARCHAR(50) not null,
    type VARCHAR(50) not null,
    quantity int not null,
    price int not null,
    PRIMARY KEY (id)
);

describe users;

select * from users;

insert into
    users (name, email, mobile, wallet)
values (
        'Jasbir',
        'jasbir@gmail.com',
        '99999999',
        '10.0'
    );

insert into
    users (name, email, mobile, wallet)
values (
        'Jon',
        'jon@gmail.com',
        '88888888',
        '20.0'
    ), (
        'Keith',
        'keith@gmail.com',
        '77777777',
        '30.0'
    );

-- C - Create
-- R - Retrieve or Read
-- U - Update
-- D - Delete

update users set mobile = '99998888' where id = 1;

update users set mobile = '99998888',email='99998888' where id = 1;

-- parseInt('546') -> 546 '546' != 546 

delete from users where id = 1;

delete from users where wallet < 10;

delete from users;

create TABLE 
inventory (
    id INT AUTO_INCREMENT,
    item VARCHAR(50) not null,
    type VARCHAR(50) not null,
    quantity int not null,
    price float default 0,
    PRIMARY KEY (id)
);

insert into
    inventory (item, type, quantity, price)
values (
        'potato chips',
        'snacks',
        '100',
        '1.50'
    ), (
        'onions',
        'vegetables',
        '2000',
        '0.15'
    ), (
        'tomato',
        'fruits',
        '500',
        '0.50'
    );

    SELECT * from inventory;

   DROP TABLE inventory; 

   alter table users add COLUMN age int DEFAULT 18;

alter table users drop column age;

alter table users modify column email varchar (100) NOT NULL;

select * from users;

describe users;

describe inventory;

SHOW DATABASES;

SHOW Tables;

-- MySQL Quiz 2 Answers:

-- 1)
select * from books
GROUP BY unit_price desc;

-- 2)
select a.title, b.*
from books as a inner join purchases as b
on a.isbn=b.book_id
WHERE a.title="Lord of the Rings" and b.timestamp > "2020-01-01"
ORDER BY b.timestamp;

-- 3)
SELECT cust_id, YEAR(timestamp), SUM(quantity)
FROM purchases
GROUP BY cust_id, YEAR(timestamp);

-- 4)
select a.*, sum(b.quantity)
from books as a inner join purchases as b
on a.isbn=b.book_id
group by a.isbn
ORDER BY sum(b.quantity) desc
LIMIT 3;

-- 5)
select a.author_id, c.author_name, sum(b.quantity)
from books as a INNER JOIN purchases as b INNER JOIN authors as c
on a.isbn=b.book_id AND a.author_id = c.id
GROUP BY a.author_id
ORDER BY sum(b.quantity) desc
LIMIT 1;

-- 6)
select a.author_id, c.author_name, sum(b.quantity * a.unit_price) as "Revenue"
from books as a INNER JOIN purchases as b INNER JOIN authors as c
on a.isbn=b.book_id AND a.author_id = c.id
GROUP BY a.author_id
order by Revenue desc
LIMIT 1;