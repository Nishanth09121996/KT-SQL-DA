select * from joins_sample.employee_department;
select * from joins_sample.employee;


select dept.DepartmentID , emp.deptid
from 
joins_sample.employee_department as dept
join joins_sample.employee as emp 
ON dept.DepartmentID = emp.deptid
 ;
 
 -- Find the department which doesn't have employess
 
 -- Step 1 Join two tables and fetch all records for left table 
 
select 
a.DepartmentName,b.empid
from
joins_sample.employee_department a
left join  joins_sample.employee b
on a.DepartmentID = b.deptid;
 
 -- Find Number of emp per deptment
 
 -- Left Join 
select 
a.DepartmentName,count(b.empid)
from
joins_sample.employee_department a
left join  joins_sample.employee b
on a.DepartmentID = b.deptid
group by a.DepartmentName
having count(b.empid)>0;

-- Right

select 
a.DepartmentName,count(b.empid)
from
joins_sample.employee a
Right join  joins_sample.employee_department b
on  b.DepartmentID = a.deptid -- 
group by a.DepartmentName
having count(b.empid)=0;

select distinct deptid from joins_sample.employee;


select 
a.deptid,b.DepartmentID
from
joins_sample.employee a 
Right join   joins_sample.employee_department b
on  b.DepartmentID = a.deptid