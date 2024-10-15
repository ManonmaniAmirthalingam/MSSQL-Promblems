select cit.name 
from city cit
join country con on cit.countrycode=con.code
where continent='Africa'
