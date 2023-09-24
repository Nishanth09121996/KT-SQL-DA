Use  constrains_sample;

-- Query 

Select * from student;

-- Subquery Query inside another query 

-- 1. select * from A  where in
-- 2.  (select * from A)
-- Eplain flow of Subquery 

-- First the subqury will be excetured and main query will be executed

select StudentName from student 
where rollNo = (select rollNo from student  where rollno =11) ;
-- 11 -> output

-- Find the youngest student 
select studentname from student where age = (Select min(age) from student order by age);

-- Find the Eldest 
select studentname from student where age = (Select Max(age) from student order by age);


-- CTE 
-- Dept find lowest age
with dept_age as (
select deptid,min(age) as min_age from student
group by deptid
 order by deptid)
 select Deptid,studentname from student
 where (deptid,age) in (select deptid,min_age from dept_age);
 
 
 -- Having 
 
 -- Order of execute

-- 1. from  
-- 2. Join
-- 3. where
-- 4.group by 
-- 5.having

 -- Find the department which has more than or equal to  3 students
select deptid,count(rollno) as student_count from student
where deptid in (1,2,3)
group by deptid
having count(rollno)=4;
-- 0	83	12:18:22	select deptid,count(rollno) as student_count from student
--  group by deptid
--  where deptid in (1,2,3)
--  having count(rollno)=2	Error Code: 1064. You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'where deptid in (1,2,3)
--  having count(rollno)=2' at line 3	0.000 sec


with dept_cnt as (
select deptid,count(rollno) as student_count from student 
group by deptid)
select * from dept_cnt
where student_count = 3;


 
 