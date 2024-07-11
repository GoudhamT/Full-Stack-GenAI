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


#13. From the following tables write a  SQL query to list all salespersons along with customer name, city, grade, order number, date, and amount. 
#Condition for selecting list of salesmen : 1. Salesmen who works for one or more customer or,
# 2. Salesmen who not yet join under any customer, Condition for selecting list of customer :
# 3. placed one or more orders, or 4. no order placed to their salesman.

select ord_no, ord_date, purch_amt, cust_name,grade,c.city, s.salesman_id,s.name as Salesperson, s.city, commission
from orders 
right outer join customer as c
on orders.customer_id = c.customer_id
right outer join salesman as s
on c.salesman_id = s.salesman_id;

# 14. Write a  SQL statement to make a list for the salesmen who either work for one or more customers or yet to join any of the customer.
# The customer may have placed, either one or more orders on or above order amount 2000 and must have a grade, 
# or he may not have placed any order to the associated supplier.

select c.customer_id, cust_name, c.city , grade, s.name as Salesperson , s.city, ord_no,ord_date,purch_amt
from customer as c
right outer join salesman as s
on s.salesman_id = c.salesman_id
left outer join orders as o
on  o.customer_id = c.customer_id 
where o.purch_amt > 250
and c.grade is not null;

# 5.For those customers from the existing list who put one or more orders, or which orders have been placed by the customer who is not on the list, 
#create a report containing the customer name, city, order number, order date, and purchase amount

select cust_name, c.city, ord_no , ord_date , purch_amt from customer  as c
right outer join orders 
on c.customer_id = orders.customer_id; 

# 16. Write a  SQL statement to generate a report with the customer name, city, order no. order date, purchase amount for only those customers on the list who must have a grade and placed one or more orders 
#or which order(s) have been placed by the customer who neither is on the list nor has a grade.
select c.customer_id,cust_name, c.city , ord_no , ord_date, purch_amt, o.customer_id from customer  as c
right outer join orders as o
on c.customer_id = o.customer_id 
where c.grade is not null;

