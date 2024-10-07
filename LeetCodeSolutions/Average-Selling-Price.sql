
select
pri.product_id,
coalesce(round(cast(sum(price*units) as float)/sum(units),2),0) 'average_price'
from prices pri
left join unitssold uni on pri.product_id=uni.product_id
and purchase_date between start_date and end_date 
group by pri.product_id

