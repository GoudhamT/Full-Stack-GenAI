# String Functions
use orders;
#concat
select address_line1, address_line2, concat(address_line1,':',address_line2) as fulladdress from address;  

#upper / lower
select upper(city) as City from address;

select lower(city) as lower_city from address;

# length
select address_line1 , length(address_line1) as length from address;

# substring
select customer_fname , substring(customer_fname,1,3) from online_customer;

select customer_fname, concat( substring(customer_fname,1,3), substring(customer_fname,1,3) ) as password from online_customer;

select customer_fname, substr(customer_fname,-3,3) as extract , length(substring(customer_fname,-3,3)) as length_chars from online_customer;

# replace

# trim

# left/right

select mod(length(customer_fname),2) from online_customer;

