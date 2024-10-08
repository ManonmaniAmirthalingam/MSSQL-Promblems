#Approach-1 using agg function (302ms)
select max(num) 'num' from(
select num,count(num) 'cnt'
from mynumbers 
group by num) a 
where cnt=1
------------------------------
#Approach-2 using having clause (472ms)
select max(num) num
from(
select num
from MyNumbers
group by num
having count( num)=1 )a
---------------------------------
#Approach-3 using top 1 and order by clause (328ms)
select coalesce(
(select top 1 num from mynumbers
group by num
having count(num)=1
order by num desc),null) as num
