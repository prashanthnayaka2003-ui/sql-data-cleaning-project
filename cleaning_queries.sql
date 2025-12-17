use portfolio_SQL
go
select * from customers;
select* from orders;

SELECT *
FROM customers
WHERE email IS NULL;

SELECT *
FROM orders
WHERE order_amount IS NULL;

SELECT customer_id, COUNT(*) AS duplicats
FROM customers
GROUP BY customer_id
HAVING COUNT(*) > 1;

SELECT order_id, COUNT(*) AS cnt
FROM orders
GROUP BY order_id
HAVING COUNT(*) > 1;

DELETE c1
FROM customers c1 JOIN customers c2
ON c1.customer_id = c2.customer_id
AND c1.created_date > c2.created_date;

DELETE o1
FROM orders o1
JOIN orders o2
ON o1.order_id = o2.order_id
AND o1.order_date > o2.order_date;

UPDATE customers
SET city = UPPER(TRIM(city)),
    state = UPPER(TRIM(state));
    

UPDATE customers
SET email = 'not_available'
WHERE email IS NULL;

UPDATE orders
SET order_amount = 0
WHERE order_amount IS NULL;

SELECT * FROM customers;
SELECT * FROM orders;


