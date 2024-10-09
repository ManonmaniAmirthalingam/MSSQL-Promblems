#Approach-1 using concat operator (+)
select user_id, Upper(left(name,1))+Lower(substring(name,2,len(name))) 'name' from users
order by user_id
------------------------------------------------------------------------------------------
#Approach-1 using concat method
select user_id, concat(Upper(left(name,1)),Lower(substring(name,2,len(name)))) 'name'
from users
order by user_id
