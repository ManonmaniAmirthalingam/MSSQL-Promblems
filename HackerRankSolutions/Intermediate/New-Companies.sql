select com.company_code,com.founder, count(distinct emp.lead_manager_code), 
count(distinct senior_manager_code),count( distinct manager_code),
count( distinct employee_code)
from company com
join lead_manager led on com.company_code=led.company_code
join employee emp on  emp.company_code = com.company_code 
and led.lead_manager_code = emp.lead_manager_code
group by com.company_code,com.founder
order by company_code asc
