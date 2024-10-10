
select product_name, sum(unit) 'unit'
from products pro
join orders ord on pro.product_id=ord.product_id
where left(order_date,7)='2020-02'
group by product_name
having sum(unit)>=100
