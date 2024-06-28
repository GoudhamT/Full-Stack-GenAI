# Practice

create database practice;

use practice;
create table countries(country_id int, country_name varchar(35), region_id int);

#Write a MySQL query to create a simple table countries including columns country_id, country_name and region_id which is already exists.
create table if not exists countries(country_id int, country_name varchar(35), region_id decimal(10,0));
# decimal(10,0) - 10 represents 10 numbers and 0 represents no decimal places

# Write a MySQL query to create the structure of a table dup_countries similar to countries.

create table if not exists dup_countries like countries;
# like represents copy of structure countries

describe dup_countries;

#Write a MySQL query to create a duplicate copy of countries table including structure and data by name dup_countries.
create table if not exists dup_data_countries 
as select * from countries; 

#Write a MySQL query to create a table countries set a constraint NULL.

create table if not exists country_null(country_id int not null , country_name varchar(35) not null, region_id decimal(10,0) not null);

describe country_null;

#Write a MySQL query to create a table named jobs including columns job_id, job_title, min_salary, max_salary and check whether the max_salary amount exceeding the upper limit 25000.
create table jobs(job_id int, job_title varchar(30), min_salary decimal(5,3) ,max_salary decimal(5,3), check (max_salary <= 25000));

#Write a MySQL query to create a table named countries including columns country_id, country_name and region_id and make sure that no countries except Italy, India and China will be entered in the table.
create table if not exists cntry(country_id int,country_name varchar(35) check (country_name in ('India','Italy','china')),region_id decimal(10,0));

describe cntry;


#Write a MySQL query to create a table named job_histry including columns employee_id, start_date, end_date, job_id and department_id and make sure that the value against column end_date will be entered at the time of insertion to the format like '--/--/----'.
create table job_histry(employee_id int, start_date date, end_date date check (end_date like '--/--/----'), job_id decimal(3,0),department_id int);

#Write a MySQL query to create a table named countries including columns country_id,country_name and region_id and make sure that no duplicate data against column country_id will be allowed at the time of insertion.
create table test(country_id int not null unique, country_name varchar(35) not null, region_id decimal(10,0) not null);
describe test;

#Write a MySQL query to create a table named jobs including columns job_id, job_title, min_salary and max_salary, and make sure that, the default value for job_title is blank and min_salary is 8000 and max_salary is NULL will be entered automatically at the time of insertion if no value assigned for the specified columns.
create table jobs_test(job_id int, job_title varchar(30) default ' ', min_salary decimal(6,0) default 8000 ,max_salary decimal(5,3) default null, check (max_salary <= 25000));
describe jobs_test;