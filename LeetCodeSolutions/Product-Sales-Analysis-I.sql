
select product_name,year,price from sales sal
left join product pro on sal.product_id = pro.product_id
