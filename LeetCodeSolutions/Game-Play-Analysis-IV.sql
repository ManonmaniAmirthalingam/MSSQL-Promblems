select round(count(distinct a.player_id)*1.0/((select count(distinct player_id) from activity)),2) 'fraction' from (
select player_id,
min(event_date) 'event_date'
from activity 
group by player_id) a
join activity b on a.player_id=b.player_id
where datediff(day, a.event_date,b.event_date)=1
