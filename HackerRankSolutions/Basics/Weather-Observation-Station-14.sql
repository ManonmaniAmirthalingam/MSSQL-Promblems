select cast(max(Lat_n) as decimal(10,4))  from station
where lat_n < 137.2345
