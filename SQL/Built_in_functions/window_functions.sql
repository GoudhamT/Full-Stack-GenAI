# Window functions

use world;

# rank
select rank() over(order by GNP desc) as Ranked, name,continent, GNP
from country;

select rank() over(order by GNp/population desc) as Ranking, name , continent, GNP
from country;

select rank() over(order by gnp/population desc) as Ranking, 
name, continent, GNP, round(gnp*1000/population,2) as GNP_Per_Capita 
from country limit 10; 


select rank() over(order by gnp/population desc) as Ranking, 
name, continent, GNP, round(gnp*1000/population,2) as GNP_Per_Capita 	
from country limit 10; 

## dense_rank
use orders;
select dense_rank() over(order by customer_id desc) as Customer_Ranking , order_id, customer_id 
from order_header; 

# partition by
select rank() over(partition by continent order by gnp/population desc) as Ranking, 
name, continent, GNP, round(gnp*1000/population,2) as GNP_Per_Capita 
from country; 

select rank() over(partition by continent,region order by gnp/population desc) as Ranking, 
name, continent, region,GNP, round(gnp*1000/population,2) as GNP_Per_Capita 
from country; 
 
# Ntile
select name, continent,region, lifeexpectancy,
ntile(4) over(order by lifeexpectancy desc) as life_cluster from country;

# ntile(4) - which means group entire data into 4 groups, like take first 60 into 1 cluster then 60 into another in last it is 59

# ntile and partition
select name, continent,region, lifeexpectancy,
ntile(4) over( partition by continent order by lifeexpectancy desc) as life_cluster from country;


# percentile, quartile - check in google

# sum over
use world;

select name, continent, GNP, 
sum(gnp) over(order by GNP desc) as cum_GNP
from country;

# along with partition
select name, continent, GNP, 
sum(gnp) over( partition by continent order by GNP desc) as cum_GNP
from country;

# avg over
select name, continent , GNP,
round(avg(gnp) over(order by GNP desc),2) as Avg_GNP 
from country;


# lag and lead functions
select name , continent, GNp, 
lag(gnp) over(order by GNP desc) as prev_gnp
from country;

select name , continent, gnp,
lag(gnp) over(order by gnp desc) as prev_gnp,
lag(gnp) over(order by gnp desc) - gnp as gnp_diff
from country;

# lead functions
select name, continent,gnp,
lead(gnp) over(order by gnp desc) as lead_gnp
from country;