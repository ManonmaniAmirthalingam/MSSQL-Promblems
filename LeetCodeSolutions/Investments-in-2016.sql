
with cte as (
select *,count(tiv_2015) over (partition by tiv_2015) 'cnt',
count(lat) over (partition by lat,lon) 'lat_cnt'
from insurance)

select round(sum(tiv_2016),2) 'tiv_2016'
from cte
where cnt>1 and lat_cnt=1
