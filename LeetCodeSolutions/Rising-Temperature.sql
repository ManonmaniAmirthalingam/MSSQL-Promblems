#Approach-I using dateadd function
select we2.id from weather we1
join weather we2 on we2.recorddate= dateadd(day,1,we1.recorddate)
where we2.temperature>we1.temperature

----------------------------------------------------------
#Approach-2 using datediff function
select we2.id from weather we1
join weather we2 on datediff(day,we1.recorddate,we2.recorddate)=1
where we2.temperature>we1.temperature

-----------------------------------------------------------
#Approach-3 using LAG Window function
select id from (
select id,
recorddate,
temperature,
LAG(temperature) over (order by recorddate) 'prevtemp',
LAG(recorddate) over (order by recorddate) 'prevdate'
from weather)a 
where  temperature > prevtemp
