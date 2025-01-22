with ct  (n,n1,n2)
as
(
select 1 as n,0 as n1,1 as n2
union all
select n+1,n2,n1+n2 from ct
where n<20
)

select n,n1 from ct
