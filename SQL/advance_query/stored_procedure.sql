# stored procedure
use world;

select * from city ;

delimiter //
create procedure allcitydata()
begin 
select * from city;
end //

delimiter ;

call allcitydata;

delimiter **
create procedure allcitydata1()
begin 
select * from city;
end **

delimiter ;

call allcitydata1;

drop procedure allcitydata1;


delimiter //
create procedure Continent_LE()
begin
select continent, round(avg(lifeexpectancy),2) as AVG_LE 
from country 
group by continent
order by avg_le desc;
end //

delimiter ; 

delimiter //
create procedure City_Pop_Data(in name_of_country varchar(20))
begin
select ci.name, co.name as country_name, ci.population
from city ci
left join country co
on ci.countrycode = co.code
where co.name = name_of_country;
end // 

delimiter ;

call City_Pop_Data('Italy');




