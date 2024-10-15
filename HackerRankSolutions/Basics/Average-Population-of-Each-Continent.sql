select con.continent, floor(avg(cit.population))
from city cit
join country con on cit.countrycode = con.code
group by con.continent
