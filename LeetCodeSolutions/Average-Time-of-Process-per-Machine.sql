#Approach-1 using where clause
select ac1.machine_id,
round(avg(ac2.timestamp - ac1.timestamp),3) 'processing_time'
from activity ac1
join activity ac2 on ac1.machine_id = ac2.machine_id and ac1.process_id=ac2.process_id
where ac2.timestamp>ac1.timestamp
group by ac1.machine_id
---------------------------------------------------
#Approach-2 using not in on join condition
select ac1.machine_id,
round(avg(ac2.timestamp - ac1.timestamp),3) 'processing_time'
from activity ac1
join activity ac2 on ac1.machine_id = ac2.machine_id and ac1.process_id=ac2.process_id
and ac1.activity_type not in (ac2.activity_type,'end')
group by ac1.machine_id
---------------------------------------------------
#Approach-3 using case when function without joins
select machine_id,
round(avg(case when activity_type='end' then timestamp end) -
avg(case when activity_type='start' then timestamp end),3) 'processing_time'
from activity
group by machine_id
