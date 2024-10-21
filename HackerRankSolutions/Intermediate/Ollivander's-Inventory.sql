select id, age, coins_needed, power 
from Wands wan
join wands_property wan_prop on wan.code= wan_prop.code
where is_evil =0
and coins_needed= (select min(coins_needed) from wands x join wands_property y on x.code=y.code
                 where x.power=wan.power and y.age=wan_prop.age)
order by power desc, age desc
