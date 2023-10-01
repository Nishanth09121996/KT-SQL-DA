-- 1. Display School table

Select * from school.school;

-- Schoo name, Class Name, StudentName

select 
cls.ClassName,std.StudentName,scl.SchoolName
from school.class as cls
inner join school.student as std
ON cls.ClassId = std.ClassID
inner join school.school scl
on cls.SchoolId = scl.SchoolId;


-- Add Class teacher Name

select 
cls.ClassName
,std.StudentName
,scl.SchoolName
,tch.TeacherName as classTeacher
from school.class as cls
inner join school.student as std
ON cls.ClassId = std.ClassID
inner join school.school scl
on cls.SchoolId = scl.SchoolId
inner join school.teacher tch
on cls.ClassTeacherId = tch.TeacherID;

-- Find How many Students in Each Class
-- Step 1 JOIN Class and Student 
-- Step 2 Count Number of Students 

select cls.ClassName,StudentID
from 
school.class cls
join school.student stu
on cls.ClassId = stu.ClassID;

-- Step2 
select cls.ClassName,count(StudentID)
from 
school.class cls
join school.student stu
on cls.ClassId = stu.ClassID
group by cls.ClassName;

-- Find count of male student and female student in Each Class
-- Step JOin Class & Student
-- Step 2 COunt Number of student by gender

select cls.ClassName,stu.gender,count(stu.StudentID)
from 
school.class cls
join school.student stu
on cls.ClassId = stu.ClassID
where Gender = 'Female'
group by cls.ClassName,stu.gender
having count(StudentID)>2;

-- Class which has more than 4 male 
select cls.ClassName
from 
school.class cls
join school.student stu
on cls.ClassId = stu.ClassID
where Gender = 'Male'
group by cls.ClassName,stu.gender
having count(StudentID)>2;



-- Teacher Name and count of Student

select t.TeacherID,t.TeacherName,count(s.StudentID)
from school.class c
join school.student s
on c.ClassId = s.ClassID
join school.teacher t
on c.ClassTeacherId = t.TeacherID
group by t.TeacherName,t.TeacherID
order by 3 desc;


-- count Of student for male and female Teacher

SELECT 
t.TeacherGender,
 count(s.StudentID)
FROM school.class as c
INNER JOIN school.student as s
ON c.ClassId= s.ClassID
INNER JOIN school.teacher as t
on c.ClassTeacherId= t.TeacherID
GROUP BY t.TeacherGender;

-- Find the Teachers Who doesn't have any Class assigned.

select * from school.teacher;

select * from school.class;

-- Where 
-- Step 1 bring all teacher in class table 

select ClassTeacherId from school.class;
-- step2 filter the teachers who has class
Select * from school.teacher
where TeacherID not in (select ClassTeacherId from school.class);

-- JOin 


select t.TeacherID,c.ClassId from school.teacher t
join school.class c
on t.TeacherID = c.ClassTeacherId;

-- Step 2 Find the class Assigned for each teacher
select t.TeacherID,c.ClassId from school.teacher t
left join school.class c
on t.TeacherID = c.ClassTeacherId
where c.ClassId is null;


-- FInd the Number of student for all Teacher
-- FInf the class for teacher
select   TeacherName,count(s.StudentID) from school.teacher t
left join school.class c
on t.TeacherID = c.ClassTeacherId
left join school.student s
on c.ClassId = s.ClassID
group by 1;



select TeacherName,count(StudentID) from school.teacher t
left join school.class c
on t.TeacherID = c.ClassTeacherId
join school.student s
on c.ClassId = s.ClassID
group by 1;

--  Sum of mark by Student


select * from school.exam_results;

select * from school.subjects;



-- Studentname , SubjectName, sum(mark) as total Mark


-- Step 1 Join Student,exam,studetm  

-- student,sub, mark

-- Step 2 Aggregate StudentName, SubjectName

SELECT s.StudentName, sub.SubjectName, SUM(e.Marks) as total_marks
FROM school.student as s
INNER JOIN
school.exam_results as e
ON s.StudentID= e.StudentID
INNER JOIN 
school.subjects as sub
ON sub.SubjectId= e.SubjectID
GROUP BY e.SubjectID, s.StudentName
order by StudentName;

-- Find the Class Topper
-- ClassName, StudentName,Total Mark,Rank(dense)
with marks as (
select 
c.ClassName
,s.StudentID
,s.StudentName
,sum(er.Marks) as TotalMarks
,dense_rank() over(partition By c.ClassName order by sum(er.Marks) desc ) as Class_Rank
from 
school.class c
join school.student s
on c.ClassId = s.ClassID
join school.exam_results er
on s.StudentID = er.StudentID
group by 1,2,3
order by ClassName asc, 4 desc)
select * from marks
where (className,TotalMarks) in 
(select classname, MAX(Totalmarks)  from marks group by 1);


-- 

with marks as (
select 
c.ClassName
,s.StudentID
,s.StudentName
,sum(er.Marks) as TotalMarks
,dense_rank() over(partition By c.ClassName order by sum(er.Marks) desc ) as Class_Rank
from 
school.class c
join school.student s
on c.ClassId = s.ClassID
join school.exam_results er
on s.StudentID = er.StudentID
group by 1,2,3
order by ClassName asc, 4 desc)
select * from marks 
where class_rank = 1;