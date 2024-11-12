select m.submission_date,m.x,n.hacker_id,n.name 
from (
select submission_date,count(hacker_id) as x 
from (select submission_date,hacker_id,row_number() over(partition by hacker_id order by hacker_id) ct,datediff(dd,'2016-03-01',submission_date)+1 as ali 
from (select distinct submission_date,hacker_id from submissions) t) k
where ct=ali 
group by submission_date) m,
(select s.submission_date,s.hacker_id,h.name 
from hackers h,(select submission_date,hacker_id,count(hacker_id) as ct,dense_rank() over (partition by submission_date order by count(hacker_id) desc,hacker_id asc) as ctt 
from submissions group by submission_date,hacker_id) s
where h.hacker_id = s.hacker_id
and   s.ctt = 1
) n
where m.submission_date = n.submission_date
