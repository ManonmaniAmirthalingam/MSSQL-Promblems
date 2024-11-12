declare @x int,@y int
set @x= 20
set @y=1
while(@y<=@x)
begin
select replicate('* ',@y)
set @y=@y+1
end
