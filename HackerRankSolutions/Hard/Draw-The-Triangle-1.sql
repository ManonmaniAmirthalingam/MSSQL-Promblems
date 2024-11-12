declare @x int 
set @x = 20

while(@x>0)
begin
 select replicate('* ',@x)
 set @x=@x-1;
end
