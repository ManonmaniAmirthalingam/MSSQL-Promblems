select cast(long_w as decimal(10,4))
from station
where lat_n =(select min(lat_n) from station where lat_n >38.7780)
