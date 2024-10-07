#Approach-1 using case when
select
sig.user_id,
cast(sum(case when action='confirmed' then 1 else 0 end)as float)/count(sig.user_id)  'confirmation_rate'
from signups sig
left join confirmations conf on sig.user_id = conf.user_id
group by sig.user_id
--------------------------------------------------------------------------------------------------
#Approach-2 using iif function
select
sig.user_id,
cast(sum(iif(action='confirmed',1,0))as float)/count(sig.user_id)  'confirmation_rate'
from signups sig
left join confirmations conf on sig.user_id = conf.user_id
group by sig.user_id
--------------------------------------------------------------------------------------------------
#Approach-3 using agg function
select
sig.user_id,
avg(cast(iif(action='confirmed',1,0)as float))  'confirmation_rate'
from signups sig
left join confirmations conf on sig.user_id = conf.user_id
group by sig.user_id
