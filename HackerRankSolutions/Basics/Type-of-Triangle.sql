Select 
case when A+B<=C or B+C<=A or C+A<=B then 'Not A Triangle'
when A=B and B=C and C=A then 'Equilateral'
when A<>B and B<>C and C<>A then 'Scalene'
else 'Isosceles' end from triangles
