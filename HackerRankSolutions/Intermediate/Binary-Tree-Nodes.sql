select N,
case when p is null then 'Root' 
when N  in (select distinct P from bst) then 'Inner'
else 'Leaf' end
from bst
order by N
