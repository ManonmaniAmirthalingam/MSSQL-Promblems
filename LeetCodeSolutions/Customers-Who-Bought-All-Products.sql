#Approach-1 using having & joins (1412ms)
select customer_id
from customer cust
right join product pro on cust.product_key=pro.product_key
group by customer_id
having count(distinct cust.product_key) = (select count(distinct product_key) from product)
------------------------------------------------------------------------------------------
#Approach-2 using declare statement (2001 ms)
Declare @cnt int;
set @cnt = (select count(product_key) from product)

select customer_id from customer cust
group by customer_id
having count(distinct product_key) = @cnt
