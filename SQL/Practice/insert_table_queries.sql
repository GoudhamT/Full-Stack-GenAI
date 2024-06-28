# insert into statement practice
use ddl_practice;
create database insert_db;
use insert_db;
# 1. Write a  MySQL query to insert a record with your own value into the table countries against each columns.
describe countries;
insert into countries values('C1','Canada',01);

# 2. Write a  MySQL query to insert one row into the table countries against the column country_id and country_name.
insert into countries(country_id,country_name) values('C2','India');

# 3. Write a  MySQL query to create duplicate of countries table named country_new with all structure and data.
#    Here is the structure of the table "countries".
create table country_new as select * from countries;
describe country_new;

# 4. Write a MySQL query to insert NULL values against region_id column for a row of countries table.

insert into countries values('C3','US',Null);
select * from country_new;

# 5. Write a MySQL query to insert 3 rows by a single insert statement.
insert into countries values('C4','China',02),('C5','Japan',03),('C6','Russia',04);

# 6. Write a MySQL query insert rows from country_new table to countries table.

insert into countries select * from country_new;

# 7. Write a  MySQL query to insert one row in jobs table to ensure that no duplicate value will be entered in the job_id column.

# &

# 8. Write a  MySQL query to insert one row in jobs table to ensure that no duplicate value will be entered in the job_id column.
create table jobs( job_id int not null unique,job_title varchar(20), min_salary decimal(8,2), max_salary decimal(8,2));
insert into jobs values(1,'Spool_email',1000,8000);

# 9. Write a MySQL query to insert a record into the table countries to ensure that, a country_id and region_id combination will be entered once in the table.
create table countries(country_id varchar(40), country_name varchar(40), region_id decimal(2,0), unique(country_id, region_id));

insert into countries values('C1','Canada',01);
insert into countries values('C2','British Columbia',02);
insert into countries values('C3','Kelowna',02);
insert into countries values('C2','Vernon',03);
select * from countries;

# 10. Write a MySQL query to insert rows into the table countries in which the value of country_id column will be unique and auto incremented.

drop table countries;

create table countries(country_id int unique auto_increment, country_name varchar(40),region_id decimal(2,0));

insert into countries values(4,'India',01);
insert into countries (country_name,region_id) values('Canada',02);
select * from countries;

# 11. Write a  MySQL query to insert records into the table countries to ensure that the country_id column will not contain any duplicate data and 
#this will be automatically incremented and the column country_name will be filled up by 'N/A' if no value assigned for that column.

drop table countries;

create table countries(country_id int primary key auto_increment, country_name varchar(40) default 'N/A', region_id decimal(2,0));
insert into countries values(1,'India',01);
insert into countries(region_id) values(2);
select * from countries;

# 12. Write a  MySQL query to insert rows in the job_history table in which one column job_id is containing those values which are exists in job_id column of jobs table.
select * from jobs;
describe jobs;
create table jobs_history(employee_id int, start_date date,end_date date,job_id int,department_id int, foreign key(job_id) references jobs(job_id));

insert into jobs_history values(1,'2024-06-30','2025-06-30',3,01);

# 13. Write a MySQL query to insert rows into the table employees 
# in which a set of columns department_id and manager_id contains a unique value and that combined values must have exists into the table departments.
drop table departments;
create table departments(department_id decimal(4,0),department_name varchar(40),manager_id decimal(4,0), primary key(department_id, manager_id));
create table employees(employee_id int, employee_name varchar(40),department_id decimal(4,0) , manager_id decimal(4,0), foreign key(department_id,manager_id) references departments(department_id,manager_id));

insert into departments values(1,'IT',2);

insert into employees values(1,'Goudham',1,3);
select * from departments;
select * from employees;

# 14. Write a  MySQL query to insert rows into the table employees in which a set of columns department_id 
# and job_id contains the values which must have exists into the table departments and jobs.
describe jobs;
create table employees(employee_id int, employee_name varchar(40),department_id decimal(4,0),job_id int, 
foreign key(department_id) references departments(department_id), foreign key(job_id) references jobs(job_id));
select * from jobs;
insert into employees values(1,'Goudham',3,1);