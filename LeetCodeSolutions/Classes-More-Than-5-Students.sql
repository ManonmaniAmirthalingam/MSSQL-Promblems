#Approach-1 using having clause (706ms)
select class
from courses 
group by class
having count(student)>=5
-------------------------------------
#Approach-2 using subquery (1717ms)
select class from (
select class, count(student) 'cnt'
from courses
group by class)a
where cnt>=5
