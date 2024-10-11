#Approach-1 using cte and dense_rank (494ms)
with cte as (
select *,
dense_rank() over (partition by departmentId order by salary desc) 'rk'
from employee)

select dept.name 'Department',ct.name 'Employee',Salary
from cte ct
join department dept on ct.departmentid=dept.id
where rk<=3
-------------------------------------------------------------------------
#Approach-2 using subquery (409 ms)
select b.name 'Department',a.name 'Employee',salary
from (
select *, dense_rank() over (partition by departmentid order by salary desc) 'rk'
from employee) a 
join department b on a.departmentid=b.id
where rk<=3
