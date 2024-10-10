
select top 1 person_name from (
select person_name,turn,
sum(weight) over(order by turn rows between unbounded preceding and current row ) 'tot_weight'
from queue)a
where tot_weight<=1000 
order by tot_weight desc

