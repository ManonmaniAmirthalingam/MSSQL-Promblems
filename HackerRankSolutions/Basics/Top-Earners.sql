#Approach-1 using agg
select top 1 * from (
select max(salary*months) 'earnings',count(*) 'cnt'
from employee
group by salary*months)a
order by earnings desc
---------------------------------------------------------
#Approach-2 using concat
select  concat(max(months*salary),space(2)),count(*)
from Employee
where (months*salary) = (select max(months*salary) from employee)
