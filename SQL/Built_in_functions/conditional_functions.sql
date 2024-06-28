# conditional functions
use world;
select * from country;
select avg(population) from country;

# if
select count(name), if(population > 2543 ,"Above_Average","Below Average") as den_pop from country
group by den_pop;

# case
select count(name) as coun_cat,case 
when population > 2543 then "Above"
when population < 2543 then "below"
else "Equal_pop"
end as pop_cat
from country
group by pop_cat;

select * from country;

select count(name) as name , case
when population/surfacearea > 650 then "Densly populated"
when population/surfacearea < 650 and population/surfacearea > 450 then "Mild populated"
else "free area" end as dense_pop_cat
from country 
group by dense_pop_cat;

# coalesce
use orders;
select * from order_header where payment_mode is null;

# nullif
select nullif(1,1);
drop table order_header;
select payment_mode, nullif(payment_mode,"Cash") from order_header;

select payment_mode, ifnull(payment_mode,'Demo') from order_header;

# ifnull
select ifnull(1,1);
