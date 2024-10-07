#Approach-1 using datefunction for month fetch
select convert(char(7),trans_date,120) 'month',
country, count(state) 'trans_count',
sum(iif(state='approved',1,0)) 'approved_count',
sum(amount) 'trans_total_amount',
sum(iif(state='approved',amount,0)) 'approved_total_amount'
from transactions
group by country,convert(char(7),trans_date,120)
-----------------------------------------------------------
#Approach-2 using left function for month fetch
select 
left(trans_date,7) 'month',country,
count(state) 'trans_count',
sum(iif(state='approved',1,0)) 'approved_count',
sum(amount) 'trans_total_amount',
sum(iif(state='approved',amount,0)) 'approved_total_amount'
from transactions
group by country,left(trans_date,7)
-----------------------------------------------------------
#Approach-3 using case when
select 
left(trans_date,7) 'month',
country,
count(state) 'trans_count',
sum(case when state='approved' then 1 else 0 end) 'approved_count',
sum(amount) 'trans_total_amount',
sum(case when state='approved' then amount else 0 end) 'approved_total_amount'
from transactions
group by country,left(trans_date,7)
