#Approach-1 using agg function with dateadd 
select
activity_date 'day', count(distinct user_id) 'active_users'
from activity
where activity_date between dateadd(day,-29,'2019-07-27') and '2019-07-27'
group by activity_date
----------------------------------------------------------------------------
#Approach-2 using agg function with datediff
select
activity_date 'day', count(distinct user_id) 'active_users'
from activity
where datediff(day,activity_date,'2019-07-27') between 0 and 29
group by activity_date
