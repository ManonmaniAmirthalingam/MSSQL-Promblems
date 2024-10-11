
select user_id,name,mail
from users
where mail like '[A-Za-z]%@leetcode.com' and mail not like '%[^a-z0-9_.-]%@leetcode.com'
