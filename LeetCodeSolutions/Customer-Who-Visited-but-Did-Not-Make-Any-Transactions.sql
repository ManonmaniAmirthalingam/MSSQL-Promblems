#Approach-1 using window function
select distinct customer_id,
count(*) over (partition by  vis.customer_id ) 'count_no_trans'
from visits vis
left join transactions trans on vis.visit_id=trans.visit_id 
where trans.transaction_id is null and trans.amount is null
--------------------------------------------------------------------
#Approach-2 using left join
select customer_id, count(1) 'count_no_trans'
from visits vis
left join transactions trans on vis.visit_id=trans.visit_id
where transaction_id is null and amount is null
group by customer_id
--------------------------------------------------------------------
#Approach-3 using subquery
select customer_id, count(visit_id) 'count_no_trans'
from visits
where visit_id not in (select visit_id from transactions)
group by customer_id
