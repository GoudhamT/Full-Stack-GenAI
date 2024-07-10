#SQL Joins
use dml;
select * from customer;
# 1. From the following tables write a  SQL query to find the salesperson and customer who reside in the same city. 
#Return Salesman, cust_name and city.

select customer.cust_name, customer.city, salesman.name 
from customer
inner join salesman
where customer.city = salesman.city;

# OR
select customer.cust_name, customer.city, salesman.name 
from customer, salesman
where  customer.city = salesman.city;
 

#2. From the following tables write a  SQL query to find those orders where the order amount exists between 500 and 2000. 
#Return ord_no, purch_amt, cust_name, city.
select ord_no, purch_amt, cust_name,city from orders
inner join customer 
where customer.customer_id = orders.customer_id
and  purch_amt between 350 and 1000 ;

# or

select ord_no, purch_amt, cust_name,city from orders, customer
where customer.customer_id = orders.customer_id
and purch_amt between 350 and 1000 ;

# 3. From the following tables write a  SQL query to find the salesperson(s) and the customer(s) he represents. Return Customer Name, city, Salesman, commission.
select cust_name, customer.city,name,commission from customer , salesman
where customer.salesman_id = salesman.salesman_id;

# or 
select cust_name, customer.city,name as Salesman,commission from customer
inner join salesman
on customer.salesman_id = salesman.salesman_id;

# 4. From the following tables write a  SQL query to find salespeople who received commissions of more than 12 percent from the company. 
#Return Customer Name, customer city, Salesman, commission.  

select cust_name,c.city,name as Salesman,commission from customer as c 
inner join salesman as s
on c.salesman_id = s.salesman_id
where s.commission > .12;

#5. From the following tables write a  SQL query to locate those salespeople who do not live in the same city where their customers live and have received a commission of more than 12% from the company.
# Return Customer Name, customer city, Salesman, salesman city, commission.  

select cust_name , c.city , name as Salesman , s.city,commission  from customer  as c
inner join salesman as s
on c.salesman_id = s.salesman_id
where s.commission > .12
and c.city != s.city;

# 6. From the following tables write a  SQL query to find the details of an order. Return ord_no, ord_date, purch_amt, Customer Name, grade, Salesman, commission. 
select ord_no , ord_date,purch_amt , cust_name,grade,name as Salesman , commission
from orders
inner join customer 
on orders.customer_id = customer.customer_id
inner join salesman
on orders.salesman_id = salesman.salesman_id;

# 7. Write a SQL statement to join the tables salesman, customer and orders so that the same column of each table appears once and only the relational rows are returned. 
select * from orders 
natural join customer
natural join salesman;

# 8. From the following tables write a  SQL query to display the customer name, customer city, grade, salesman, salesman city. 
# The results should be sorted by ascending customer_id.  
select cust_name, c.city , grade, name as Salesman , s.city
from customer as c
inner join salesman as s
on c.salesman_id = s.salesman_id
order by c.customer_id;

# 9. From the following tables write a  SQL query to find those customers with a grade less than 300. 
#Return cust_name, customer city, grade, Salesman, salesmancity. The result should be ordered by ascending customer_id.  

select cust_name, c.city , grade, name as Salesman , s.city from customer  as c
inner join salesman as s
on c.salesman_id = s.salesman_id
where c.grade < 300
order by c.customer_id;

# 10. Write a SQL statement to make a report with customer name, city, order number, order date, and order amount in ascending order according to the order date 
# to determine whether any of the existing customers have placed an order or not.
select ord_no , ord_date,purch_amt, cust_name,city from customer 
left outer join orders
on customer.customer_id  = orders.customer_id
order by orders.ord_date asc;

# 11. SQL statement to generate a report with customer name, city, order number, order date, order amount, salesperson name, and commission 
# to determine if any of the existing customers have not placed orders or if they have placed orders through their salesman or by themselves.

select cust_name, c.city,ord_no, ord_date, purch_amt, name as Salesman , commission from customer as c
left outer join orders as o
on c.customer_id = o.customer_id
left outer join salesman as s
on s.salesman_id = o.salesman_id;

#12. Write a SQL statement to generate a list in ascending order of salespersons who work either for one or more customers or have not yet joined any of the customers.
select s.salesman_id, name,s.city , commission, c.cust_name,c.city from salesman as s
left outer join customer as c
on s.salesman_id = c.salesman_id
order by salesman_id; 

