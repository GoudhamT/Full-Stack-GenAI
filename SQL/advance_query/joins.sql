# Joins
create database join_db;
use join_db;
create Table Demographic (Id Varchar(20), age int, gender char(1), salary int, city varchar(20));
create Table Professional (Id Varchar(20), Name Varchar(20), Dept varchar(10), Manager varchar(20));

Insert into Demographic 
values (201,25,"M",20000,"Beng"),(202,32,"F",25000,"Mum"),(203,40,"F",20000,"Mum"),(204,23,"M",22000,"Che");

Insert into Professional 
values (202,"Shree","Mar","Ram"), (204,"Ram","Fin","Atul"),(211,"Priya","HR","Raj"),(212,"Ritu","Ops","Amar");

select * from demographic;

select * from professional;

# inner join
select id,age,gender,dept,manager 
from demographic;

# corrected code
select demographic.id,age,gender,dept,manager 
from demographic 
inner join professional
on demographic.id = professional.id;

# alias for table name
select d.id,d.age,gender,p.dept,p.manager
from demographic as d
inner join professional as p
on d.id = p.id; 

# left join
select d.id, d.age, d.gender, p.dept,p.manager
from demographic as d 
left join professional as p
on d.id = p.id; 

select d.id,d.age,d.gender, p.dept,p.manager
from professional as p
left join demographic as d
on p.id = d.id
where d.age > 30;

# right join
select d.id , age,gender , dept,manager
from demographic as d
right join professional as p
on d.id = p.id;

# full join

select d.id, age,gender,dept,manager 
from demographic as d
left join professional as p
on d.id = p.id
union
select p.id,age,gender,dept,manager
from demographic as d
right join professional as p
on d.id = p.id;


create table joins_gt as 
select d.id,age,gender,dept,manager
from demographic as d  
left join professional as p
on d.id = p.id
union
select p.id,age,gender,dept,manager
from demographic as d
right join professional as p
on d.id = p.id ;

select * from joins_gt;

describe joins_gt;

# three table joins

use world;

select * from city; 
select * from country;
select * from countrylanguage;

select id as city_ID, ci.Name as city_name, district,ci.population, c.name,continent, region,language
from city as ci
left join country c
on ci.countrycode = c.code
join countrylanguage as cl
on c.code = cl.countrycode;
