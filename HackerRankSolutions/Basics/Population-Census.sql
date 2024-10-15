select sum(cit.population) from city cit
join country con on cit.countrycode=con.code
where continent ='Asia'
