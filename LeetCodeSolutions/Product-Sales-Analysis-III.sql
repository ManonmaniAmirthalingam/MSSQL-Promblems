#Approach-1 using CTE (3337ms)
with cte as(
select product_id,
min(year) 'first_year'
from sales
group by product_id)

select ct.product_id, ct.first_year,quantity,price
from cte ct join sales sal
on ct.product_id=sal.product_id and ct.first_year=sal.year
----------------------------------------------------------------
#Approach-2 using window rank function (2803ms)
select product_id,year 'first_year',quantity, price from (
select * , dense_rank() over(partition by product_id order by year) 'cnt'
from sales)a
where cnt=1
-----------------------------------------------------------------
#Approach-3 using except operator
select product_id,year 'first_year',quantity, price
from sales
except
select s1.product_id,s1.year,s1.quantity, s1.price from sales s1
join sales s2 on s1.product_id=s2.product_id and s1.year>s2.year

