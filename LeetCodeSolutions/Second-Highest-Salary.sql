#Approach-1 using subquery with not in (345ms)
select max(salary) 'SecondHighestSalary' from employee
where salary <>
(select max(salary) from employee)
--------------------------------------------------------
#Approach-2 using subquery with '<' operator (377ms)
select max(salary) 'SecondHighestSalary' from employee
where salary <
(select max(salary) from employee)
--------------------------------------------------------
#Approach-3 using subquery with window function (555ms)
select coalesce((select distinct salary  from
(
select *,dense_rank() over ( order by salary desc) 'rw'
from employee
)a where rw=2),null) 'SecondHighestSalary'
