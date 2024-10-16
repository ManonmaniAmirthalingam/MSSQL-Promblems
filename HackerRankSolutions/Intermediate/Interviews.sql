select con.contest_id, con.hacker_id, con.name , sum(total_submissions),
sum(total_accepted_submissions), sum(total_views) , sum(total_unique_views)
from contests con
join colleges col on con.contest_id=col.contest_id
join challenges chal on chal.college_id = col.college_id
left join (select challenge_id, sum(total_views) 'total_views',sum(total_unique_views) 'total_unique_views' from view_stats group by challenge_id) vw on chal.challenge_id = vw.challenge_id
left join (select challenge_id, sum(total_submissions) 'total_submissions',sum(total_accepted_submissions) 'total_accepted_submissions' from Submission_Stats group by challenge_id) sub on sub.challenge_id=chal.challenge_id
group by con.contest_id, con.hacker_id, con.name
having  sum(total_submissions)+
sum(total_accepted_submissions)+ sum(total_views)+sum(total_unique_views)<>0
order by contest_id
