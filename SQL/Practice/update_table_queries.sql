# update statements practice

use ddl_practice;

select * from employees_2;
describe employees_2;
select * from departments;
INSERT INTO `ddl_practice`.`departments`
(`department_id`,
`department_name`,
`manager_id`,
`location_id`)
VALUES
(4000,'MECH',60,2);

insert into employees_2 values(6,'David','Austin','DAustin@test.com','515.123.4571','1987-06-21',1,10500,0,100,4000);


# 1. Write a  SQL statement to change the email column of employees table with 'not available' for all employees.
set sql_safe_updates = 0;
update employees_2 set email = 'not available@1.com';
select * from employees_2;

# 2. Write a  SQL statement to change the email and commission_pct column of employees table with 'not available' and 1.10 for all employees.
update employees_2 set email = 'not available@1.com' , comission = 1.10;
select * from employees_2;

# 3. Write a  SQL statement to change the email and commission_pct column of employees table with 'na@gt.com' and 2 for those employees whose department_id is 2000.
update employees_2 set email = 'na@gt.com', comission = 2 
where department_id = 2000;
select * from employees_2;

# 4. Write a  SQL statement to change the email column of employees table with 'na@test.com' for those employees whose department_id is 3000 and gets a commission_pct is less than 2
update employees_2 set email = 'na@test.com' 
where department_id = 3000
and comission < 2;
select * from employees_2;

# 5. Write a  SQL statement to change the email column of employees table with 'nodept@dept.com' for those employees who belongs to the 'IT' department.
select * from departments;
# here we are going to use sub query, I know only department name as IT and from departments table we will derive department_id using name
update employees_2 set email = 'nodept@dept.com' 
where department_id = 
(select department_id from departments 
where department_name = 'IT');
select * from employees_2;

# 6. Write a  SQL statement to change salary of employee to 8000 whose ID is 1, if the existing salary is less than 1500.
 update employees_2 set salary = 8000
 where employee_id = 1
 and   salary < 1500;
 select * from employees_2;
 
 # 7. Write a  SQL statement to change job ID of employee which ID is 2, to 1 if the employee belongs to department, which ID is 1000 and the last name does not start with 'KO'.
 select * from jobs;
 update employees_2 set job_id = 1
 where employee_id = 2
 and department_id = 1000
 and not last_name like 'Ko%';
select * from employees_2;

# 8. Write a  SQL statement to increase the salary of employees under the department 2000, 3000 and 4000 
# according to the company rules that, salary will be increased by 25% for the department 2000, 15% for department 3000 and 10% for the department 4000 
# and the rest of the departments will remain same.
update employees_2 
set salary = 
	case department_id
		when 2000 then salary + (salary*(25/100))
		when 3000 then salary + (salary*(15/100))
		when 4000 then salary + (salary*(10/100))
		else salary
	end
where department_id in (2000,3000,4000);
 
select * from employees_2;
select * from jobs;
# 9. Write a  SQL statement to increase the minimum and maximum salary of job id 1 by 2000 as well as the salary for those employees by 20% and commission percent by .10.
update jobs,employees_2
set jobs.min_salary = min_salary + 2000,
    jobs.max_salary = max_salary + 2000,
    employees_2.salary =  employees_2.salary +  (employees_2.salary*(20/100)),
    employees_2.comission = employees_2.comission + 2
where jobs.job_id = 2
and employees_2.job_id = 2;
select * from employees_2; 
select * from jobs;
