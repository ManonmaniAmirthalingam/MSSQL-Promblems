#Approach-1 using window function
select  distinct std.student_id,std.student_name, sub.subject_name,
count(exm.student_id) over(partition by sub.subject_name,std.student_id) 'attended_exams'
from students std
cross join subjects sub
left join examinations exm on std.student_id=exm.student_id and sub.subject_name=exm.subject_name
order by std.student_id,std.student_name
-------------------------------------------------------------
#Approach-2 using agg function
select  distinct std.student_id,std.student_name, sub.subject_name,
count(exm.subject_name) 'attended_exams'
from students std
cross join subjects sub
left join examinations exm on std.student_id=exm.student_id and sub.subject_name=exm.subject_name
group by std.student_id,std.student_name, sub.subject_name
order by std.student_id,std.student_name
---------------------------------------------------------------
#Approach-2 using scalar subquery 
select * ,
(select count(student_id) from examinations exm where std.student_id=exm.student_id and sub.subject_name=exm.subject_name) as 'attended_exams'
from students std
cross join subjects sub
ORDER BY student_id, subject_name
