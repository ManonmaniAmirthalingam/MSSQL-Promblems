#Approach-1 using cte (556ms)
with cte as (
select employee_id, department_id,
count(employee_id) over(partition by employee_id) 'cnt'
from employee)

select ct.employee_id,ct.department_id
from cte ct
join employee em on em.employee_id=ct.employee_id and ct.department_id=em.department_id
where cnt=1 or (cnt<>1 and em.primary_flag='Y')
-----------------------------------------------------------------------------------------
#Approach-2 using subquery (478ms)
select employee_id,department_id from 
(select *, count(employee_id) over (partition by employee_id) 'cnt' from employee)a
where cnt=1 or (cnt<>1 and primary_flag='Y')
-----------------------------------------------------------------------------------------
#Approach-3 using union (614ms)
(SELECT employee_id, max(department_id) 'department_id' --here max() will not affect the result becoz we are using the row only with count 1 so it's going to same only one department id
FROM Employee
GROUP BY employee_id
HAVING COUNT(employee_id) = 1)
UNION
(SELECT employee_id, department_id
FROM Employee
WHERE primary_flag = 'Y')
ORDER BY employee_id;
