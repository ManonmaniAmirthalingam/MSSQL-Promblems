#Approach-1 using union
select city, ln from 
(select top 1 city, len(city) 'ln' from station
order by len(city) asc,city asc
union 
select top 1 city,len(city) 'ln' from station
order by len(city) desc, city asc)a
---------------------------------------------------
#Approach-2 using direct select statement
select top 1 city, len(city)  from station
order by len(city) asc,city asc 
select top 1 city,len(city) from station
order by len(city) desc, city asc
