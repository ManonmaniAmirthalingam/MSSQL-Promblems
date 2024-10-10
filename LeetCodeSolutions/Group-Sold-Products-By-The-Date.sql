#Approach-1 using subquery
select sell_date, count( product) 'num_sold',
string_agg( product,',') 'products'
from (select distinct * from activities)a
group by sell_date
order by sell_date,products
----------------------------------------------------
#Approach-2 using "within group" for lexicographically order of string agg
select sell_date, count( product) 'num_sold',
string_agg( product,',') within group (order by product)  'products'
from (select distinct * from activities)a
group by sell_date
order by sell_date

