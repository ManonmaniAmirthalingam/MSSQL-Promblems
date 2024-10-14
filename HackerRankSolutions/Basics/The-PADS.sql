select name+'('+left(occupation,1)+')' from occupations
union
select concat('There are a total of ', count(occupation),' ', lower(occupation),'s.')  
from occupations
group by occupation
