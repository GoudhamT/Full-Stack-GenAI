# Query Multiple tables
use dml;
select * from customer;
select * from salesman;
select * from orders;
# 1. From the following tables, write a  SQL query to find the salespeople and customers who live in the same city. Return customer name, salesperson name and salesperson city.
select customer.cust_name, salesman.name,salesman.city
from customer , salesman
where customer.city = salesman.city;

# 2. From the following tables, write a  SQL query to locate all the customers and the salesperson who works for them. Return customer name, and salesperson name.  
select customer.cust_name , salesman.name from customer,salesman
where customer.salesman_id = salesman.salesman_id;

#3. From the following tables, write a  SQL query to find those salespeople who generated orders for their customers but are not located in the same city. 
#Return ord_no, cust_name, customer_id (orders table), salesman_id (orders table).  

select ord_no, customer.cust_name,orders.customer_id , orders.salesman_id from customer, salesman, orders
where customer.city <> salesman.city
and orders.customer_id = customer.customer_id
and orders.salesman_id  = salesman.salesman_id;

#4. From the following tables, write a  SQL query to locate the orders made by customers. Return order number, customer name.  
select ord_no , customer.cust_name from orders,customer
where orders.customer_id = customer.customer_id
order by ord_no desc;

# 5. From the following tables, write a  SQL query to find those customers where each customer has a grade and is served by a salesperson who belongs to a city
#Return cust_name as "Customer", grade as "Grade".

select customer.cust_name as "Customer" , customer.grade as "Grade" from customer, salesman, orders
where orders.customer_id = customer.customer_id
and orders.salesman_id = salesman.salesman_id
and customer.grade is not null
and salesman.city is not null;

# or

select cust_name as "Customer" , grade as "Grade" from customer 
where grade is not null
and salesman_id in 
(
select salesman_id from salesman 
where city is not null
);

# or
select customer.cust_name as "Customer" , customer.grade as "Grade" from customer, salesman
where customer.grade is not null
and customer.salesman_id = salesman.salesman_id 
and salesman.city is not null;

# 7. From the following tables, write a  SQL query to find all orders executed by the salesperson and ordered by the customer whose grade is greater than or equal to 200. 
#Compute purch_amt*commission as “Commission”. 
#Return customer name, commission as “Commission%” and Commission.
select customer.cust_name, orders.purch_amt * salesman.commission as "Commission" , salesman.commission as "Commission%" from customer, orders,salesman
where orders.customer_id = customer.customer_id
and orders.salesman_id = salesman.salesman_id
and customer.grade >= 200;

#8. From the following table, write a  SQL query to find those customers who placed orders on October 5, 2012. 
#Return customer_id, cust_name, city, grade, salesman_id, ord_no, purch_amt, ord_date, customer_id and salesman_id.

select customer.customer_id, customer.cust_name, customer.city , customer.grade,
customer.salesman_id , orders.ord_no , orders.ord_date, orders.purch_amt,
orders.customer_id , orders.salesman_id from customer,orders
where orders.ord_date = '2012-10-05'
and customer.customer_id = orders.customer_id; 