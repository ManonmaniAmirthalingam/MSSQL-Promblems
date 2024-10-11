select id, coalesce(
case when id%2<>0 then lead(student) over(order by id) else lag(student) over (order by id) end ,student) 'student'
from seat
order by id
