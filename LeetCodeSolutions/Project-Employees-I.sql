select 
project_id,
round(avg(cast(experience_years as decimal(10,2))),2) 'average_years'
from project pro 
left join employee em on pro.employee_id=em.employee_id
group by project_id
