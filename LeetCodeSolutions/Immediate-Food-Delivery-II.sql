#Approach-1 using CTE with agg function(runtime - 1153ms)
with cte as 
(select customer_id,min(order_date) 'min_order_date' from delivery 
group by customer_id)

select round(avg(cast(immediate_percentage as float))*100,2) 'immediate_percentage' 
from (
select ct.customer_id,
case when min_order_date=customer_pref_delivery_date then 1 else 0 end 'immediate_percentage'
from cte ct
join delivery del on ct.customer_id=del.customer_id and ct.min_order_date=del.order_date) a
------------------------------------------------------------------------------------------------
#Approach-2 using cte with window function(runtime - 928ms)
with cte as
(select customer_id,
row_number() over(partition by customer_id order by customer_id,order_date ) 'cnt',
order_date 'min_ord_date'
from delivery
)
select round(avg(cast(immediate_percentage as float))*100,2) 'immediate_percentage' from (
select ct.customer_id,
iif(min_ord_date=customer_pref_delivery_date,1,0) 'immediate_percentage'
from cte ct 
join delivery del on ct.customer_id=del.customer_id 
and ct.min_ord_date= del.order_date
where cnt=1)a
----------------------------------------------------------------------------------------------  
#Approach-3 using subquery (runtime - 1602ms)
select round(avg(cast(immediate_percentage as float))*100,2) 'immediate_percentage' from (
select a.customer_id, iif(min_ord_date=customer_pref_delivery_date,1,0) 'immediate_percentage' from
(select 
customer_id,
min(order_date) 'min_ord_date'
from delivery
group by customer_id) a
join delivery b on a.customer_id=b.customer_id and b.order_date=a.min_ord_date)c
-----------------------------------------------------------------------------------------------

