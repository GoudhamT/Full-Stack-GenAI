# Data Manipulation Query

# select or retriveve from tables



create database DML;
use DML;
create table salesman(salesman_id int unique primary key, name varchar(30),city char(15),commission decimal(5,3), check(city in ('Madurai','KElowna','Bengaluru','New York')) );
insert into salesman values(5001,'James Hoog','Madurai',0.15);

insert into salesman values(5002,'Nail Knite','KElowna',0.13), (5005,'Pit Alex','New York',0.11),(5006,'Mc Lyon','Bengaluru',0.14);

# 1. Write a SQL statement that displays all the information about all salespeople.
select * from salesman;

#2. Write a SQL statement to display a string "This is SQL Exercise, Practice and Solution".

select "This is SQL Exercise, Practice and Solution" as given_text;

#3. Write a SQL query to display three numbers in three columns. 
select 1 as no_1, 2 as no_2, 3 as no_3;

# or

select 5,10,15;

# 4. Write a SQL query to display the sum of two numbers 10 and 15 from the RDBMS server. 
select 10 + 15 as sum;

# 5. Write an SQL query to display the result of an arithmetic expression. 
select 10 + 15 - 5 * 2;

# 6. Write a SQL statement to display specific columns such as names and commissions for all salespeople.  
select name as salesman_name ,  commission as comissions from salesman;

create table orders(ord_no int not null,purch_amt decimal(6,3),ord_date char(10), customer_id int, salesman_id int, 
				   primary key(ord_no),
				   foreign key(salesman_id) references salesman(salesman_id));
insert into orders values(70007, 948.5,'2012-09-10',3005,5002);

insert into orders values(70009, 270.65,'2012-09-10 ',3001,5005), (70002,65.26,'2012-10-05 ',3002,5001), (70004,110.5,'2012-08-17',3009,5006);
#7. Write a query to display the columns in a specific order, such as order date, salesman ID, order number, and purchase amount for all orders.
select ord_date 'order_date', salesman_id,ord_no as order_number,purch_amt 'purchase amount'  from orders;


# 8. From the following table, write a SQL query to identify the unique salespeople ID. Return salesman_id. 
select distinct(salesman_id) as salesman_id from orders;

# 9. From the following table, write a SQL query to locate salespeople who live in the city of 'New york'. Return salesperson's name, city. 

select * from salesman;
select name as salespaerson_name, city from salesman where city = 'New York';

#10. From the following table, write a SQL query to find customers whose grade is 200. Return customer_id, cust_name, city, grade, salesman_id.  
create table customer(customer_id int unique primary key,cust_name varchar(40), city char(15), grade decimal(3,0), salesman_id int, foreign key(salesman_id) references salesman(salesman_id));

insert into customer values(3002,'Nick Rimando','New York',100,5001),(3007,'Brad Davis','New York',200,5001),(3005,'Graham Zusi','California',200,5002);
#10. From the following table, write a SQL query to find customers whose grade is 200. Return customer_id, cust_name, city, grade, salesman_id. 
select customer_id,cust_name as customer_name , city, grade,salesman_id from customer where grade = 200;

#11. From the following table, write a SQL query to find orders that are delivered by a salesperson with name 'Nail Knite', Return ord_no, ord_date, purch_amt.  
select * from orders;
select * from salesman;
select ord_no as order_number, ord_date as order_date, purch_amt as purchased_amount, salesman_id from orders 
where salesman_id = (
select salesman_id from salesman 
where name = 'Nail Knite');
# above we have used sub query

#12. From the following table, write a SQL query to find the Nobel Prize winner(s) for the year 1970. Return year, subject and winner. 

create table nobel_win(year decimal(4,0), subject varchar(15), winner varchar(40), country char(20), category varchar(30), 
             check(category in ('Scientist','Linguist','Economist','President','Prime Minister')) );
             
insert into nobel_win values(1970,'Chemistry','Luis Federico Leloir','France','Scientist'), (1970,'Physiology','Ulf von Euler','Sweden','Scientist');
insert into nobel_win values(1970 ,'Peace','Anwar al-Sadat','Egypt','President');  

select * from nobel_win;
select year as return_year,subject,winner from nobel_win where  year = 1970;

#13. From the following table, write a SQL query to find the Nobel Prize winner in ‘Literature’ for 1971. Return winner. 
select winner from nobel_win where year = 1971 and 
subject = 'Literature';

#14. From the following table, write a SQL query to locate the Nobel Prize winner ‘Dennis Gabor'. Return year, subject. 

select year,subject from nobel_win where winner = 'Dennis Gabor';

#15. From the following table, write a SQL query to find the Nobel Prize winners in the field of ‘Physics’ since 1950. Return winner. 
select winner as nobel_winner from nobel_win where subject = 'Physics'
											and year >= 1950;

# 16. From the following table, write a SQL query to find the Nobel Prize winners in ‘Chemistry’ between the years 1965 and 1975. 
# Begin and end values are included. Return year, subject, winner, and country.  
select year,subject,winner, country from nobel_win where year between 1965 and 1975 and subject = 'Chemistry';

# or 

select year,subject,country,winner from nobel_win
where subject =  'Chemistry'
and year >= 1965
and year <= 1975;

#17. Write a SQL query to display all details of the Prime Ministerial winners after 1972 of Menachem Begin and Yitzhak Rabin. 
select * from nobel_win 
where year > 1972
and category = 'Prime Minister'
and winner in ('Menachem Begin','Yitzhak Rabin');

#18. From the following table, write a SQL query to retrieve the details of the winners whose first names match with the string ‘Louis’. 
# Return year, subject, winner, country, and category.  
select * from nobel_win where winner like 'Louis%';

#19. From the following table, write a SQL query that combines the winners in Physics, 1970 and in Economics, 1971. 
#Return year, subject, winner, country, and category. 
select * from nobel_win where (subject = 'Physics' and year = 1970) or (subject = 'Economics' and year = 1971);

# or

select * from nobel_win where subject = 'Physics' and year = 1970
union
select * from nobel_win where subject = 'Economics' and year = 1971;

#20. From the following table, write a SQL query to find the Nobel Prize winners in 1970 excluding the subjects of Physiology and Economics. 
#Return year, subject, winner, country, and category. 
select * from nobel_win where year = 1970 
and subject not in('Physiology','Economics') ;

#21. From the following table, write a SQL query to combine the winners in 'Physiology' before 1971 and winners in 'Peace' on or after 1974. 
#Return year, subject, winner, country, and category. 
select * from nobel_win 
where (subject = 'Physiology' and year < 1971) or 
	 (subject = 'Peace' and year > 1974);

#or

select * from nobel_win where subject = 'Physiology' and year < 1971
union
select * from nobel_win where subject = 'Peace' and year >= 1974;

#22. From the following table, write a SQL query to find the details of the Nobel Prize winner 'Johannes Georg Bednorz'. Return year, subject, winner, country, and category.  
select year,subject,winner,country,category from nobel_win where winner =  'Johannes Georg Bednorz';

#23. From the following table, write a SQL query to find Nobel Prize winners for the subject that does not begin with the letter 'P'. 
#Return year, subject, winner, country, and category. Order the result by year, descending and winner in ascending.  
select * from nobel_win where subject not like 'P%'
order by year desc ,winner asc;

#24. From the following table, write a SQL query to find the details of 1970 Nobel Prize winners. Order the results by subject, ascending except for 'Chemistry' 
# and ‘Economics’ which will come at the end of the result set. Return year, subject, winner, country, and category.  
select * from nobel_win where year = 1970
order by 
case when subject = 'Chemistry' then 1 
     when subject = 'Economics' then 1 
     else 0 
end asc,
subject;

#or
select * from nobel_win where year = 1970
order by
case 
when subject in ('Chemistry','Economics') then 1 
else 0
end asc,
subject;

#25. From the following table, write a SQL query to select a range of products whose price is in the range Rs.200 to Rs.600. Begin and end values are included. 
# Return pro_id, pro_name, pro_price, and pro_com.

create table item_mast(PRO_ID int primary key not null,pro_name varchar(20),pro_price decimal(8,2),PRO_COm dec(3,0));

insert into item_mast values(104,'Speaker',550,16),(102,'Key Board',450.00,16),(110,'Mouse',250,12),(109,'Refill cartridge',150,13);
insert into item_mast values(104,'Speaker',550,16);
select * from item_mast;

select * from item_mast where pro_price between 200 and 600;

#or 
select * from item_mast where pro_price > 200 and pro_price <= 600;

#26. From the following table, write a SQL query to calculate the average price for a manufacturer code of 16. Return avg.  
select avg(pro_price) from item_mast where pro_com = 16;

#27. From the following table, write a SQL query to display the pro_name as 'Item Name' and pro_priceas 'Price in Rs.'  
select pro_id , pro_name as 'Item Name' , pro_price as 'Price in Rs' from item_mast ;

#28. From the following table, write a SQL query to find the items whose prices are higher than or equal to $250. 
#Order the result by product price in descending, then product name in ascending. Return pro_name and pro_price.  
select pro_name , pro_price from item_mast where pro_price >= 250
order by pro_price desc, pro_name asc;

#29. From the following table, write a SQL query to calculate average price of the items for each company. Return average price and company code. 
select * from item_mast;
select avg(pro_price) as average_price , pro_com as company_code from item_mast
group by pro_com; 
# 30. From the following table, write a SQL query to find the cheapest item(s). Return pro_name and, pro_price.  
SELECT PRO_NAME , pro_price from item_mast
where pro_price = 
( select min(pro_price) from item_mast);

#31. From the following table, write a SQL query to find the unique last name of all employees. Return emp_lname. 

use ddl_practice;
select * from employees_2;
insert into employees_2 values(9,'Alex','Snares Mardy','aSnares@dept.com','515.123.4571','1987-06-17',2,19000,1,0,1000);

select distinct(last_name) as emp_lname from employees_2;

#32. From the following table, write a SQL query to find the details of employees whose last name is 'Snares'. Return emp_idno, emp_fname, emp_lname, and emp_dept. 
select employee_id as emp_idno,first_name as emp_fname,last_name as emp_lname, department_id emp_dept from employees_2 
where last_name like 'Snares%';

#33. From the following table, write a SQL query to retrieve the details of the employees who work in the department 2000,3000 & 4000. Return emp_idno, emp_fname, emp_lname and emp_dept..
select employee_id as emp_idno,first_name as emp_fname,last_name as emp_lname, department_id emp_dept from employees_2 
where department_id in (2000,3000,4000); 
