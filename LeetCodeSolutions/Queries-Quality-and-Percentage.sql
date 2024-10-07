
select
query_name,
round(avg(cast(rating as float )/position ),2) 'quality',
round(sum(cast(iif(rating<3,1,0)as float))/count( rating) *100,2) 'poor_query_percentage'
from queries
where query_name is not null
group by query_name
