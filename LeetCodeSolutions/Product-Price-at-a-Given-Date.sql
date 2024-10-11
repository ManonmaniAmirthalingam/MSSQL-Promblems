select  pro1.product_id, coalesce(pro2.new_price,10) as price from
(
select product_id , 
max(case when change_date <= '2019-08-16' then change_date end ) as dt
from products
group by product_id
) pro1
 left join products pro2 on pro1.product_id = pro2.product_id
 and pro1.dt=pro2.change_date
