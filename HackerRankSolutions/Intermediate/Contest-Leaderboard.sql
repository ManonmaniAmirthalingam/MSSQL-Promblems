select hck.hacker_id, hck.name , sum(score) 'score'
from hackers hck
join 
(select hacker_id, challenge_id, max(score) 'score' from submissions group by challenge_id,hacker_id)
sub on hck.hacker_id=sub.hacker_id
group by hck.hacker_id, hck.name
having sum(score)<>0
order by score desc, hacker_id asc
