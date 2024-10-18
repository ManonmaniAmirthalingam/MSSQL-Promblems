select  hacker_id, name from (
select distinct  hck.hacker_id, name ,count(sub.challenge_id) 'cnt'
from hackers hck
join submissions sub on hck.hacker_id=sub.hacker_id
join challenges chal on chal.challenge_id=sub.challenge_id  
join difficulty diff on diff.difficulty_level = chal.difficulty_level and  diff.score =sub.score
group by hck.hacker_id, name
)a
where cnt>1
order by cnt desc,hacker_id asc
