# Database objects

# view - it's table which display data only during execution and not stored in DB
use world;

create view city_get as 
select name, district,population from city;

select * from city_get;

drop view city_get;