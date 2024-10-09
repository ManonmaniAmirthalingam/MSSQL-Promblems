#Approach-1 using joins (523ms)
select l1.num 'ConsecutiveNums'
from logs l1
join logs l2 on l1.id=l2.id+1
join logs l3 on l2.id+1 = l3.id+2
where l1.num=l2.num and l2.num=l3.num
-----------------------------------------------------------------
#Approach-2 using join with difference in on condition  (524ms)
select distinct a.num ConsecutiveNums
from logs a
join logs b on a.id=b.id-1
join logs c on b.id=c.id-1
where a.num=b.num and b.num=c.num
--------------------------------------------------------------------
#Approach-3 using Lead function (577ms)
select distinct num 'ConsecutiveNums' from (
select num,
lead(num,1) over (order by id) 'num2',
lead(num,2) over (order by id) 'num3'
from logs) a
where num=num2 and num2=num3
