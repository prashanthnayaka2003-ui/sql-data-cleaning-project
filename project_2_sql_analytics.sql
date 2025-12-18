select* from customers;
select * from orders ;

select sum (order_amount) as total_sales from orders;

select c.customer_id,c.customer_name,sum(order_amount) as total_spent 
from customers c
join orders o  
on c.customer_id=o.customer_id 
group by c. customer_id,c.customer_name

select top 3 c.customer_id,c.customer_name,sum(order_amount) as total_spent 
from customers c
join orders o  
on c.customer_id=o.customer_id 
group by c. customer_id ,c.customer_name order by  total_spent desc

select c.customer_id,c.customer_name,count( order_id)as total_orders from customers c
join orders o on c.customer_id= o.customer_id  group by  c.customer_id,c.customer_name
order by total_orders 

select order_status ,count (*) as total_orders  from orders  group by order_status;

select month(order_date) as month ,sum (order_amount) as monltly_sales 
from  orders group by month( order_date) order by month asc

select c.city,sum(order_amount)as total_sales 
from customers c  join orders o on c.customer_id= o.customer_id  where order_amount IS NOT NULL
group by  city order by total_sales desc

select customer_id, count (order_id) as total_orders
from orders group by  customer_id having count (order_id) >1;

select order_id, order_amount ,
case 
when order_amount >= 3000 then 'high_value'
when order_amount >= 1500 then 'meadium_value'
else 'low_value' 
end as  order_catogory 
from orders order by order_amount desc
