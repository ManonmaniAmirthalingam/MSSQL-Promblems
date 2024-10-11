
select top 1 requester_id 'id', sum(cnt) over(partition by requester_id) 'num' from(
select requester_id, count(requester_id) 'cnt' from RequestAccepted
group by requester_id
union all
select accepter_id, count(accepter_id) 'cnt' from RequestAccepted
group by accepter_id
)a
order by num desc
