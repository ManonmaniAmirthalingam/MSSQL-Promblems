select 
em1.employee_id , em1.name, count(em2.reports_to) 'reports_count', round(avg(cast(em2.age as float)),0) 'average_age'
from employees em1
join employees em2 on em1.employee_id= em2.reports_to
group by em1.employee_id , em1.name
order by employee_id

