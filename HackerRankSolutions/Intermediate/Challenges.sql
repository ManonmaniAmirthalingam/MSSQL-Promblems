with cte as (
select hck.hacker_id, name, count(distinct chal.challenge_id) 'cnt',
dense_rank() over (order by count(distinct chal.challenge_id) desc) 'rw'
from hackers hck 
join challenges chal on hck.hacker_id=chal.hacker_id
group by hck.hacker_id, name )

select hacker_id, name ,cnt
from cte 
where rw= 1 or rw not in (select rw from cte group by rw having count(rw)>1)
order by cnt desc,hacker_id
