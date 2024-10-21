select start_date,end_date from (
select start_date, row_number() over ( order by start_date) 'rw' from projects
where start_date not in (select end_date from projects)
)a join
(select end_date, row_number() over ( order by end_date) 'rw' from projects
where end_date not in (select start_date from projects))b
on a.rw=b.rw
order by datediff(day,start_date,end_date),start_date
