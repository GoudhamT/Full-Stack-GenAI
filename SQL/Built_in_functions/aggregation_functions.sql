use orders;

select * from order_items;

select count(order_id) as orders, sum(product_quantity) as '# Products' from order_items;

select distinct order_id, count(distinct order_id) as orders, sum(product_quantity) as '# Products' from order_items
where order_id = '10001';

select * from order_items
where order_id = '10001';

use world;

select lifeexpectancy from country;

select sum(lifeexpectancy) from country;

select avg(lifeexpectancy) as AVG_LE from country;

select * from country;

select continent, count(name),
sum(surfacearea) as surface_area,
(sum(population)/1000000) as Population_in_MN, 
round(avg(lifeexpectancy),2),
sum(gnp) from country
group by continent
having continent like 'A%'
order by Population_in_MN desc
;

describe country;

set global sql_mode = (select replace(@@sql_mode,'only_full_group_by',"'"));

set sql_safe_updates = 1;

SELECT @@sql_mode;