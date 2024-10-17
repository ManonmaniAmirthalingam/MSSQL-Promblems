#Approach 1 using cte and subquery
with cte as (
select lat_n,row_number() over (order by lat_n) 'rw',
count(*) over() cnt from station)

select distinct cast (case when cnt%2<>0 then (select lat_n from cte where rw= ceiling((cnt*1.00)/2))
when cnt%2=0 then (select avg(lat_n*1.00) from cte where rw=cnt/2 and rw=(cnt/2)-1) end as decimal(10,4))
from cte
-------------------------------------------------------------------------------------------------------

#Approach 2 using cte 
with cte as (
select lat_n,row_number() over (order by lat_n) 'rw',
    count(*) over() cnt  from station)

select cast(avg(lat_n) as decimal(10,4)) from cte
where rw in ((cnt+1)/2,(cnt+2)/2)
/*The logic resides in where clause --> 
even+1/2 & even+2/2 gives 2 values (i.e 2+1/2-->1 and 2+2/2 -->2)
whereas odd+1/2 & odd+2/2 give same 1 value  (i.e 3+1/2-->2 and 3+2/2-->2)
*/
