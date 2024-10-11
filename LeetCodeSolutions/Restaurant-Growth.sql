select visited_on,
sum(sum(amount)) over (order by visited_on rows between 6 preceding and current row) 'amount',
round(avg(sum(cast(amount as float))) over (order by visited_on rows between 6 preceding and current row),2) 'average_amount'
from customer
group by visited_on
order by visited_on
offset 6 rows
