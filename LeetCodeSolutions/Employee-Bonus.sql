#Approach-1
select name, bonus 
from employee em
left join bonus bon on em.empid=bon.empid
where bonus<1000 or bonus is null
----------------------------------------------
#Approach-2
select name, bonus 
from employee em
left join bonus bon on em.empid=bon.empid
where isnull(bonus,0)<1000
