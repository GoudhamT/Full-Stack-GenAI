use hr_emp;

select * from employees;

# fetch all data of the department, if manager id is 186

# got data using dept id
select * from employees where department_id = 73;

# got data using manager id
select distinct department_id from employees 
where manager_id = 186; 

# now using manager id get all 
select * from employees 
where department_id = 
(select distinct department_id from employees where manager_id = 186);

# fetch all data from employees where manager id in 50,70,180

select * from employees 
where department_id in (select distinct department_id from employees where manager_id in (60,80,186)) ;

select * from employees where manager_id = 70;

# fetch data who are earning equal to puru
select * from employees where first_name like 'purv';

select * from employees where salary = (select salary from employees where first_name = 'purv');  

# get salary for all where ajay earning equal

# get salary where salary > overall average salary
select avg(salary) from employees;

select * from employees where salary > (select avg(salary) from employees);
 
# fetch data of all empy who are earning avg salary of res department

select * from employees where department_id = 50;

select department_id, avg(salary) from employees group by department_id;

select * from employees as e where salary > ( select avg(t.salary) from employees as t where t.department_id = e.department_id );

use hr_emp;
select * from employees as a where salary > (select avg(salary) from employees as b group by b.department_id having b.department_id = a.department_id);

select * from employees e
join ( select department_id, avg(salary) as avg_salary from employees
    group by department_id) as dept_avg on e.department_id = dept_avg.department_id
where e.salary > dept_avg.avg_salary;