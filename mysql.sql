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