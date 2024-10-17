with cte as (
select x,y,row_number() over(order by x,y) rw from functions)

select distinct f1.x ,f1.y from cte f1
join cte f2 on f1.x=f2.y and f1.y=f2.x
where f1.rw<> f2.rw and f1.x<=f1.y
order by f1.x
