#Approach-1 using subquery
select contest_id, 
round(cast(count(reg.user_id) as float)/(select count(user_id) from users)*100,2)  'percentage'
from register reg
group by contest_id
order by percentage desc,contest_id
--------------------------------------------------------
#approach-2 using declare statement (improves performance)
declare @usrcnt int = (select count(user_id) from users)

select contest_id, round(cast(count(user_id) as float)/@usrcnt *100,2) 'percentage'
from register reg
group by contest_id
order by percentage desc, contest_id
----------------------------------------------------------
