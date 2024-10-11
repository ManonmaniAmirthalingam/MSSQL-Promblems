
select * from (
select top 1 name 'results' from users usr
join movierating mov on usr.user_id=mov.user_id
group by name
order by count(rating) desc,name asc)a
union all
select * from (
select top 1 title 'results' from movies mov
join movierating rat on rat.movie_id=mov.movie_id
where left(created_at,7)='2020-02'
group by title
order by avg(rating*1.00) desc,title asc)b
