#Approach-1 using subquery
select name from employee
where id = ( select managerid from employee
group by managerid
having count(managerid)>=5)
---------------------------------------------
#Approach-2 using join
select em1.name from employee em1
join employee em2 on em1.id=em2.managerid
group by em1.name,em1.id
having count(em2.managerid)>4
