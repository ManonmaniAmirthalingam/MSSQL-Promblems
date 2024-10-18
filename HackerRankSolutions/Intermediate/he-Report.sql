
#Approach-1 using iif condition
select iif(grade<8, null,name) , grade , marks
from Students mar
join grades grad on mar.marks between grad.min_mark and grad.max_mark
order by grade desc, name asc
--------------------------------------------------------------------------
#Approach-2 using case when
select case when grade<8 then null else name end, grade , marks
from Students mar
join grades grad on mar.marks between grad.min_mark and grad.max_mark
order by grade desc, name asc
