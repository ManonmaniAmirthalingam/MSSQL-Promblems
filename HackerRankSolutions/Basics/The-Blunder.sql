#Approach-1 using subquery
select cast(ceiling(org- error) as int) from (
select avg(cast(replace(salary,0,'') as float)) 'error' ,avg(cast(salary as float)) 'org' 
from employees)a
---------------------------------------------------
#Approach-2 using agg operator
select cast(ceiling(avg(salary*1.00) -
avg(cast(replace(salary,0,'') as float))) as integer) from employees
