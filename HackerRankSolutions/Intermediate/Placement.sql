#Approach-1 using 2 cte's 
with cte as (
select std.id 'std', salary 'std_sal', name
from students std join packages pack on std.id=pack.id )

, cte2  as (
select frd.id 'frd', salary 'frd_sal', friend_id
from friends frd join packages pack on frd.friend_id=pack.id)

select name from cte  join cte2 on cte.std=cte2.frd 
where std_sal<frd_sal
order by frd_sal
-----------------------------------------------------------------
#Approach -2 using joins
select std.name from students std
join friends frd on std.id=frd.id
join packages pack on std.id=pack.id
join packages pack2 on frd.friend_id=pack2.id
where pack.salary<pack2.salary
order by pack2.salary
