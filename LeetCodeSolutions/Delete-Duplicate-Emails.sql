
#Approach-1 using subquery (468ms)
delete from person
where id not in 
(select min(id) from person group by email)
------------------------------------------------
#Approach-3 using cross join (456ms)
delete p1
from person p1 cross join person p2 
where p1.id>p2.id and p1.email=p2.email
-------------------------------------------------
#Approach-3 using cte (1548ms)
with cte as 
(
select id, email,
row_number() over(partition by email order by id) 'rw'
from person
)
delete from cte where rw>1
