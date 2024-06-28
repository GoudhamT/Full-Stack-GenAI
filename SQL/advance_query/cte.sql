# CTE - common table expressions

use hr_emp;

with departmentwisesalary as (
select department_id, count(manager_id) as No_0f_Managers, round(avg(salary),0) as Average_Salary
from employees
group by department_id
order by Average_Salary desc)

select * from departmentwisesalary;

with depatavgsalary as(
select department_id, avg(salary) as Avg_Salary 
from employees
group by department_id)
select first_name , last_name, emp.department_id, salary
from employees as emp
left join  depatavgsalary as deps
on emp.department_id = deps.department_id
where emp.salary > deps.Avg_Salary;

use join_db;