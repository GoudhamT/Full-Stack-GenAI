# Aggregate Functions
use dml;
select * from orders;
insert into orders values(70012,350,'2012-10-05',3002,5003);
select * from salesman;
select * from customer;
select * from item_mast;
# 1. From the following table, write a  SQL query to calculate total purchase amount of all orders. Return total purchase amount.

select sum(purch_amt) as total_purchase_amount from orders;

# 2. From the following table, write a  SQL query to calculate the average purchase amount of all orders. Return average purchase amount. 
select round(avg(purch_amt),2) as "Average Purchase Amount" from orders;

#3. From the following table, write a  SQL query that counts the number of unique salespeople. Return number of salespeople.  
select count(distinct salesman_id) as no_of_salespeople from orders;

#4. From the following table, write a  SQL query to count the number of customers. Return number of customers.  
select count(*) from customer;

# or
select count(customer_id) from customer;

#5. From the following table, write a  SQL query to determine the number of customers who received at least one grade for their activity
select count(customer_id) from customer where not grade is null;
# or
select count(all grade) from customer;

#6. From the following table, write a  SQL query to find the maximum purchase amount. 
select max(purch_amt) as maximum_amount_purchased from orders;

#7. From the following table, write a  SQL query to find the minimum purchase amount. 
select min(purch_amt) as minimum_purchased_amount from orders;

# 8. From the following table, write a  SQL query to find the highest grade of the customers in each city. Return city, maximum grade.  
select max(grade), city from customer
group by city;

#9. From the following table, write a  SQL query to find the highest purchase amount ordered by each customer. Return customer ID, maximum purchase amount. 
select customer_id, max(purch_amt) from orders
group by customer_id
order by customer_id;

# 10. From the following table, write a  SQL query to find the highest purchase amount ordered by each customer on a particular date. Return, order date and highest purchase amount.
select customer_id ,ord_date as ordered_date, max(purch_amt) as "highest purchase amount" from orders
group by customer_id,ord_date;

#11. From the following table, write a  SQL query to determine the highest purchase amount made by each salesperson on '2012-10-05' & '2012-09-10'. Return salesperson ID, purchase amount 
select salesman_id , max(purch_amt) from orders 
where ord_date in ('2012-10-05','2012-09-10')
group by salesman_id;

#12. From the following table, write a  SQL query to find the highest order (purchase) amount by each customer on a particular order date. 
#Filter the result by highest order (purchase) amount above 50.00. 
#Return customer id, order date and maximum purchase amount.
select customer_id , ord_date, max(purch_amt) as maximum_purchase_amount 
from orders
group by customer_id,ord_date
having max(purch_amt) > 120;

#13. From the following table, write a  SQL query to find the maximum order (purchase) amount in the 
#range 2000 - 6000 (Begin and end values are included.) by combination of each customer and order date. 
#Return customer id, order date and maximum purchase amount.
select customer_id,ord_date,max(purch_amt) from orders
group by customer_id,ord_date
having max(purch_amt) between 300 and 700;

#14. From the following table, write a  SQL query to find the maximum order (purchase) amount based on the combination of each customer and order date. 
#Filter the rows for maximum order (purchase) amount is either 2000, 3000, 5760, 6000. Return customer id, order date and maximum purchase amount.
select customer_id, ord_date, max(purch_amt) from orders
group by customer_id,ord_date
having round(max(purch_amt),1) in (270.7,948.5,350,110.5);

#15. From the following table, write a  SQL query to determine the maximum order amount for each customer. 
#The customer ID should be in the range 3002 and 3007(Begin and end values are included.). Return customer id and maximum purchase amount.

select customer_id, max(purch_amt) from orders
group by customer_id 
having customer_id  between 3002 and 3009
order by customer_id;


#16. From the following table, write a  SQL query to find the maximum order (purchase) amount for each customer. The customer ID should be in the range 3002 and 3007(Begin and end values are included.). 
#Filter the rows for maximum order (purchase) amount is higher than 1000. Return customer id and maximum purchase amount.
select customer_id, max(purch_amt) from orders
group by customer_id
having customer_id between 3001 and 3009
and max(purch_amt) > 270; 

# or
select customer_id, max(purch_amt) from orders
where customer_id between 3001 and 3009
group by customer_id
having max(purch_amt) > 270;

# 17. From the following table, write a  SQL query to determine the maximum order (purchase) amount generated by each salesperson. Filter the rows for the salesperson ID is in the range 5003 and 5008 (Begin and end values are included.). 
#Return salesperson id and maximum purchase amount.

select salesman_id, max(purch_amt) from orders
where salesman_id between 5003 and 5008 
group by salesman_id ;

# or 

select salesman_id, max(purch_amt) from orders
group by salesman_id
having salesman_id between 5003 and 5008;

# 18. From the following table, write a  SQL query to count all the orders generated on '2012-08-17'. Return number of orders.
select count(*) from orders 
where ord_date = '2012-08-17';

# 19. From the following table, write a  SQL query to count the number of salespeople in a city. Return number of salespeople.
select city, count(salesman_id) from salesman 
group by city;

# or
select count(*) from salesman where city is not null;

# 20. From the following table, write a  SQL query to count the number of orders based on the combination of each order date and salesperson. Return order date, salesperson id.
select salesman_id, ord_date ,count(*) as "no of orders today" from orders
group by salesman_id, ord_date
order by salesman_id;

# 21. From the following table, write a  SQL query to calculate the average product price. Return average product price.
select avg(pro_price) from item_mast;

# 22. From the following table, write a  SQL query to count the number of products whose price are higher than or equal to 350. Return number of products.
select count(*) as "no_of_products_>350" from item_mast where pro_price >= 350;

# 23. From the following table, write a  SQL query to compute the average price for unique companies. Return average price and company id.

select avg(pro_price), pro_com as company_id from item_mast
group by company_id
order by company_id asc;

#24. From the following table, write a SQL query to count the number of employees in each department. Return department code and number of employees.
use ddl_practice;

select department_id, count(employee_id) as 'no_of_employee_in_dept' from employees_2
group by department_id
order by department_id;


# adiotnal queries from my experience
# 25. write query to find maximum purchased amount for each customer, based on salesman ID from salesman then get list of customers for salesman ID then list of orders for each customer
# return customer ID, maximum purchase amount.  hint: it should have 2 sub queries for salesman , customer table
select max(purch_amt), customer_id from orders
where customer_id in 
(
select distinct customer_id from customer 
where salesman_id in (
select distinct salesman_id from salesman)
)
group by customer_id
order by customer_id asc;