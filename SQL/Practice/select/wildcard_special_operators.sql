# wild card and special characters in SQL

use dml;

# 1. From the following table, write a SQL query to find the details of those salespeople who come from the 'kelowna' City or 'Madurai' City. Return salesman_id, name, city, commission.
select * from salesman where city in ("Madurai" ,"Kelowna");

# or

select * from salesman where city = 'Madurai' or city = "Kelowna";

#2. From the following table, write a SQL query to find the details of the salespeople who come from either 'Kelowna' or 'Madurai'. Return salesman_id, name, city, commission.
select * from salesman where city = 'Madurai' or city = "Kelowna";

#3. From the following table, write a SQL query to find the details of those salespeople who live in cities other than Paris and Rome. Return salesman_id, name, city, commission.  
select * from salesman where not city in ("Madurai" ,"Kelowna");

#or
select * from salesman where city != "Madurai" and city != "KElowna";

# 4. From the following table, write a SQL query to retrieve the details of all customers whose ID belongs to any of the values 3007, 3008 or 3009.
#  Return customer_id, cust_name, city, grade, and salesman_id.  
select * from customer where customer_id in (3007,3008,3009);

# or 
select * from customer where customer_id = 3007 
or customer_id = 3008 
or customer_id = 3009;

# 5. From the following table, write a SQL query to find salespeople who receive commissions between 0.12 and 0.14 (begin and end values are included).
# Return salesman_id, name, city, and commission.
select * from salesman where commission between 0.12 and 0.14;
# or 
select * from salesman where commission >= 0.12 and commission <=0.14;

#6. From the following table, write a SQL query to select orders between 200 and 4000 (begin and end values are included). Exclude orders amount 948.50 and 1983.43. 
#Return ord_no, purch_amt, ord_date, customer_id, and salesman_id.    
select * from orders where purch_amt between 200 and 4000 and not purch_amt in(948.50,1983.43);

#7. From the following table, write a SQL query to retrieve the details of the salespeople whose names begin with any letter between 'A' and 'L' (not inclusive). 
# Return salesman_id, name, city, commission. 
select * from salesman;
select * from salesman where name between 'A' and 'L';

# 8. From the following table, write a SQL query to find the details of all salespeople except those whose names begin with any letter between 'A' and 'M'. 
#Return salesman_id, name, city, commission.
select * from salesman where name not between 'A' and 'L';

# 9. From the following table, write a SQL query to retrieve the details of the customers whose names begins with the letter 'B'. Return customer_id, cust_name, city, grade, salesman_id.. 
select * from customer where cust_name like 'B%';

#10. From the following table, write a SQL query to find the details of the customers whose names end with the letter 'n'. Return customer_id, cust_name, city, grade, salesman_id.
select * from customer where cust_name like '%n';
#11. From the following table, write a SQL query to find the details of those salespeople whose names begin with ‘B’ and the fourth character is 'd'. 
#Rests may be any character. Return salesman_id, name, city, commission.
select * from customer where cust_name like 'B__d%';

# 12. From the following table, write a SQL query to find those rows where col1 contains the escape character underscore ( _ ). Return col1.
create table col1(col1 varchar(50));

insert into col1 values('A001/DJ-402%45\2015/200'),('A001/DJ_402\45\2015%100'),('A001/DJ_402%45\2015/300');
select * from col1;
select * from col1 where col1 like '%/_%' escape '/';

#13. From the following table, write a SQL query to identify those rows where col1 does not contain the escape character underscore ( _ ). Return col1.
select * from col1 where col1 not like '%/_%' escape '/';

#14. From the following table, write a SQL query to find rows in which col1 contains the forward slash character ( / ). Return col1.
select * from col1 where col1 like '%*/%' escape '*';

#15. From the following table, write a SQL query to identify those rows where col1 does not contain the forward slash character ( / ). Return col1.
select * from col1 where col1 not like '%*/%' escape '*';

#16. From the following table, write a SQL query to find those rows where col1 contains the string ( _/ ). Return col1.
select * from col1 where col1 like '%*_/%' escape '*';

#17. From the following table, write a SQL query to find those rows where col1 does not contain the string ( _/ ). Return col1.
select * from col1 where col1 not like '%*_/%' escape '*';

#18. From the following table, write a SQL query to find those rows where col1 contains the character percent ( % ). Return col1.
select * from col1 where col1 like '%/%%' escape '/';

# 19. From the following table, write a SQL query to find those rows where col1 does not contain the character percent ( % ). Return col1.
select * from col1 where not col1 like '%/%%' escape '/';

#20. From the following table, write a SQL query to find all those customers who does not have any grade. Return customer_id, cust_name, city, grade, salesman_id.
select * from customer;

insert into customer values(3001,'Brad Guzan','London',null,5005);

select * from customer where grade is null;

#21. From the following table, write a SQL query to locate all customers with a grade value. Return customer_id, cust_name,city, grade, salesman_id.
select * from customer where grade is not null; 

#or
select * from customer where not grade is null;

#22. From the following table, write a SQL query to locate the employees whose last name begins with the letter 'D'. Return emp_idno, emp_fname, emp_lname and emp_dept.
use ddl_practice;

select employee_id as emp_idno,first_name as emp_fname,last_name emp_lname,department_id as 'Emp Dept' from employees_2 where last_name like 'd%';