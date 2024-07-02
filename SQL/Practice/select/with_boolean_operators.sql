# Relational operators:

use dml;

insert into customer values(3008,'Julian Green','London',300,5002);
select * from customer;

#1. From the following table, write a  SQL query to locate the details of customers with grade values above 100. Return customer_id, cust_name, city, grade, and salesman_id. 
select * from customer where grade > 100;

# 2. From the following table, write a  SQL query to find all the customers in ‘New York’ city who have a grade value above 100. Return customer_id, cust_name, city, grade, and salesman_id.

select * from customer where city = 'New York' and grade > 100;

# 3. From the following table, write a  SQL query to find customers who are from the city of New York or have a grade of over 100. 
#  Return customer_id, cust_name, city, grade, and salesman_id.  
select * from customer where city = 'New York'  or grade > 100;

# 4. From the following table, write a  SQL query to find customers who are either from the city 'New York' or who do not have a grade greater than 100.
# Return customer_id, cust_name, city, grade, and salesman_id.  

select * from customer where city = 'New York' or NOT grade > 100;

# 5. From the following table, write a  SQL query to identify customers who do not belong to the city of 'New York' or have a grade value that exceeds 100. 
#Return customer_id, cust_name, city, grade, and salesman_id. 
select * from customer where city != 'New York' or grade > 100;

# 6. From the following table, write a  SQL query to find details of all orders excluding those with ord_date equal to '2012-09-10' and salesman_id higher than 5005 or purch_amt greater than 1000.
# Return ord_no, purch_amt, ord_date, customer_id and salesman_id.
select * from   orders;
select * from orders where not((ord_date = '2012-09-10' and salesman_id > 5005) or purch_amt > 1000);

# or 
select * from orders where (ord_date != '2012-09-10'  and salesman_id < 5005) or purch_amt < 1000;

# 7. From the following table, write a  SQL query to find the details of those salespeople whose commissions range from 0.10 to0.12. Return salesman_id, name, city, and commission. 
select * from salesman;
insert into salesman values(5003,'Lauson Hen','Kelowna',0.12);
select * from salesman where commission between 0.10 and 0.12;

# or 
select * from salesman where commission > 0.10 and commission < 0.12;

# 8. From the following table, write a  SQL query to find details of all orders with a purchase amount less than 200 or exclude orders with an order date greater than or equal to '2012-02-10' and a customer ID less than 3009. 
#Return ord_no, purch_amt, ord_date, customer_id and salesman_id
insert into orders values(70005,2400.6,'2012-07-27',3007 ,5001);
select * from orders where purch_amt < 200 or not (ord_date >= '2012-02-10' and customer_id < 3009);

# 9. From the following table, write a  SQL query to find all orders that meet the following conditions. 
# Exclude combinations of order date equal to '2012-08-17' or customer ID greater than 3005 and purchase amount less than 1000.
select * from orders where not( ( ord_date = '2012-08-17' or customer_id > 3005) and purch_amt < 1000);

# 10. Write a  SQL query that displays order number, purchase amount, and the achieved and unachieved percentage (%) for those orders that exceed 50% of the target value of 500.
select ord_no as order_number, purch_amt as purchase_amount, 
case 
when ((100* purch_amt) / 500) < 100 then ((100* purch_amt) / 500)
else 100
end as 'Achieved %',
case 
when 100-((100*purch_amt)/500) < 0 then 0
else 100-((100*purch_amt)/500)
end as 'Unachieved %'
from orders 
where purch_amt > ( (50/100)*500);  

# 11. From the following table, write a  SQL query to find the details of all employees whose last name is ‘Dosni’ or ‘Mardy’. Return emp_idno, emp_fname, emp_lname, and emp_dept. 
use ddl_practice; 
select * from employees_2;

select employee_id, first_name ,last_name,department_id 
from employees_2 
where last_name in ('King','Austin');

# or
select employee_id, first_name ,last_name,department_id 
from employees_2 
where last_name = 'King' or last_name = 'Austin';
# 12. From the following table, write a  SQL query to find the employees who work at depart 1000 or 4000. Return emp_idno, emp_fname, emp_lname, and emp_dept.  
select employee_id, first_name ,last_name,department_id 
from employees_2 where department_id in (1000,4000);