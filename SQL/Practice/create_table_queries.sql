# Data Definition Language Practice
create database ddl_practice;
use ddl_practice;

# create table statements

# 1. Write a MySQL query to create a simple table countries including columns country_id, country_name and region_id. 
create table if not exists countries(country_id int, country_name varchar(20), region_id decimal(5,0)); 
describe countries;

# 2. 2. Write a MySQL query to create a simple table countries including columns country_id, country_name and region_id which is already exists.
create table if not exists countries_2 like countries;
# using like keyword, will create new table with same structure like countries
describe countries_2;

# 4. Write a MySQL query to create a duplicate copy of countries table including structure and data by name dup_countries.
select * from countries;
create table dup_countries as select * from countries;
select * from dup_countries;
# in create table if you use as select from which means, it will create table with same struture like countries and copy data from countries to new table

# 5. Create a MySQL table named countries with a NOT NULL constraint on certain columns

create table countries_cons(country_id int not null,country_name varchar(20) , region_id decimal(5,0) not null);
describe countries_cons;
# above not null constriant is added to table countries_cons while creating

# 6. Write a MySQL query to create a table named jobs including columns job_id, job_title, min_salary, max_salary and check whether the max_salary amount exceeding the upper limit 25000.
create table jobs(job_id decimal(2,0) not null, job_title char(20),min_salary int, max_salary int, check(max_salary <= 25000));
# here check is constriant keyword added to max salary to check is salary <= 25000

# 7. Write a MySQL query to create a table named countries including columns country_id, country_name and region_id and make sure that no countries except Italy, India and China will be entered in the table.
create table countries_2(country_id decimal(2,0), country_name varchar(20), region_id int, check(country_name in ('India','China','Italy')));
describe countries_2;
# if you try to enter values other than India, China, Italy then "Out of rane error is shown" -> Error Code: 1264. Out of range value for column 'country_id' at row 1

# 8. Write a MySQL query to create a table named job_histry including columns employee_id, start_date, end_date, job_id and department_id and make sure that the value against column end_date will be entered at the time of insertion to the format like '--/--/----'.
create table job_histry(employee_id int not null,start_date date, end_date date,job_id decimal(3,0),department_id int, check(end_date like '--/--/----'));
describe job_histry;

# 9. Write a MySQL query to create a table named countries including columns country_id,country_name and region_id and make sure that no duplicate data against column country_id will be allowed at the time of insertion.
create table countries_cons(country_id int not null primary key, country_name varchar(20),region_id decimal(2,0));
# to define non duplicate data, primary key is declared
describe countries_cons;

# another method of non duplicate constriant in unique
create table countries_cons_2(country_id int,country_name char(10),region_id int, unique(country_id,region_id),check(country_name in ('India') and country_id < 100));
describe countries_cons_2;
# here multiple check is validated using AND keyword

# 10. Write a MySQL query to create a table named jobs including columns job_id, job_title, min_salary and max_salary, and make sure that, the default value for job_title is blank and min_salary is 8000 
#    and max_salary is NULL will be entered automatically at the time of insertion if no value assigned for the specified columns.
create table jobs(job_id int unique not null,job_title varchar(20) default '', min_salary decimal(8,2) default 8000,max_salary decimal(8,2) default null); 
describe jobs;

# 11. Write a MySQL query to create a table named countries including columns country_id, country_name and region_id and make sure that the country_id column will be a key field which will not contain any duplicate data at the time of insertion
create table countries(country_id decimal(2,0) not null,country_name varchar(14),region_id int, primary key(country_id), unique(country_id));
describe countries;

# 12. Write a MySQL query to create a table countries including columns country_id, country_name and region_id and make sure that the column country_id will be unique and store an auto incremented value.
create table countries(country_id int auto_increment,country_name char(10),region_id int, unique(country_id), primary key(country_id));
describe countries;
# here auto increment extra is used for auto increment and no need to specify primary key

# 13. Write a MySQL query to create a table countries including columns country_id, country_name and region_id and make sure that the combination of columns country_id and region_id will be unique.
create table countries(country_id char(8) unique default ' ',country_name char(18),region_id decimal(2,0), primary key(country_id,region_id));
describe countries;
# giving multiple columns inside primary key would be combination, if anyone is unique then enrey is created

# 14. Write a MySQL query to create a table job_history including columns employee_id, start_date, end_date, job_id and department_id and make sure that, 
#the employee_id column does not contain any duplicate value at the time of insertion and the foreign key column job_id contain only those values which are exists in the jobs table.

create table job_history(employee_id int unique auto_increment,start_date date,end_date date ,job_id int,department_id int, 
foreign key(job_id) references jobs(job_id));

describe job_history;

# 15. Write a MySQL query to create a table employees including columns employee_id, first_name, last_name, email, 
#phone_number hire_date, job_id, salary, commission, manager_id and department_id and make sure that, 
#the employee_id column does not contain any duplicate value at the time of insertion and the foreign key 
#columns combined by department_id and manager_id columns contain only those unique combination values, which combinations are exists in the departments table.

# department table:
create table departments(department_id decimal(4,0) not null default 0,department_name varchar(30) not null, 
manager_id decimal(6,0) not null default 0, location_id decimal(4,0), primary key(department_id,manager_id));
describe departments;

create table employees(employee_id int unique, first_name char(10), last_name char(20),email varchar(40),phone_number char(15),hire_date date,job_id int,salary int,
comission int,manager_id decimal(6,0), department_id decimal(4,0), foreign key(department_id,manager_id) references departments(department_id, manager_id));

describe employees; 

#16. Write a MySQL query to create a table employees including columns employee_id, first_name, last_name, email, phone_number hire_date, job_id, salary, commission, manager_id and department_id and make sure that, 
#the employee_id column does not contain any duplicate value at the time of insertion, and the foreign key column department_id, reference by the column department_id of departments table, 
#can contain only those values which are exists in the departments table and another foreign key column job_id, referenced by the column job_id of jobs table, 
#can contain only those values which are exists in the jobs table.The InnoDB Engine have been used to create the tables.
describe jobs;
create table employees_2(employee_id decimal(2,0) not null primary key auto_increment, first_name char(20) not null , last_name varchar(20) default '',
email varchar(20) check(email like '%@%'),phnoe_number varchar(15), hire_date date, job_id  int, salary int, comission int,manager_id decimal(6,0), 
department_id decimal(4,0), foreign key(department_id) references departments(department_id), foreign key(job_id) references jobs(job_id));

describe employees_2;

create table employees_3(employee_id decimal(2,0) not null primary key, first_name char(20) not null , last_name varchar(20) default '',
email varchar(20),phnoe_number varchar(15), hire_date date, job_id  int, salary int, comission int,manager_id decimal(6,0), 
department_id decimal(4,0), check( email like '%@%'),foreign key(department_id) references departments(department_id), foreign key(job_id) references jobs(job_id));