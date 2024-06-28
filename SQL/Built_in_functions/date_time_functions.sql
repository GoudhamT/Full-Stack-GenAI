# Date and Time Function
use orders;

# current date
select current_date;

# current time
select current_time;

# current timestamp
select current_timestamp;

# current user
select current_user;

# date
select date('2024-06-15 10:17:29') as Date ;

# time
select time('2024-06-15 10:17:29') as Time;

# year
select year('2024-06-15 10:17:29');

select year(order_date) from order_header;

select * from online_customer;

select year(customer_creation_date) as Customer_Created , month(customer_creation_date) as month from online_customer;

select year(customer_creation_date) as Customer_Created, count(customer_creation_date) from online_customer
group by Customer_Created
order by Customer_Created desc;

select year(customer_creation_date) as year_acq ,monthname(customer_creation_date) as month , count(customer_creation_date) customer_acq from online_customer
group by year_acq 
order by customer_acq desc;

# day
select day(customer_creation_date) as day from online_customer;

select dayname(customer_creation_date) as day from online_customer;

select dayname(customer_creation_date) as weekday , count(customer_creation_date) from online_customer
group by weekday
order by count(customer_creation_date) desc;

# dateadd
select customer_creation_date as original_date ,
date_add(customer_creation_date, interval 2 Day ) as added_date from online_customer;

# date sub
select customer_creation_date as original_date ,
date_sub(customer_creation_date, interval 3 day) as sub_date from online_customer;

# date diff
select customer_creation_date as original_date ,
date_sub(customer_creation_date, interval 3 day) as sub_date,
datediff(customer_creation_date,date_sub(customer_creation_date, interval 3 day)) from online_customer;

select customer_creation_date as original_date ,
current_date as todays_date,
datediff(customer_creation_date,current_date) from  online_customer;

# always null, datediff works only on date not year
select customer_creation_date as original_date ,
date_sub(customer_creation_date, interval 3 day) as sub_date,
datediff(year(current_date),year(customer_creation_date)) as diff from online_customer;


select customer_creation_date as original_date ,
year(customer_creation_date) as created_year,
year(current_date) as today_year,
abs(year(customer_creation_date) - year(current_date)) as validaity from online_customer;