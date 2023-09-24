SELECT SalesOrderID,ProductName FROM functions_sample.sales_data;
-- Aggregate Functions
-- Count 

-- Get no of records in Table
select count(*) from functions_sample.sales_data;

select  distinct ProductName   from functions_sample.sales_data;

-- Provide count of  Product

select count(ProductName)
from functions_sample.sales_data;

-- Provide Dinstinct count of Procduct

select  count(distinct ProductName) from functions_sample.sales_data;

-- Count(*) vs count(1) vs count(columnname)
with cte as  (
select 1 as colVal
union
select 2 as colVal
union
select null as colVal
)
select count(colVal) as columncount, count(*) row_count from cte;

--            --- ----------------------------------------

-- Group BY

select * from 
constrains_sample.student 
order by deptid;

-- Find NUmber of student in each department

select 
deptid
,count(rollNO) as student_count 
from constrains_sample.student
group by deptID;

select
 gender
 ,count(rollNo)
 from  constrains_sample.student
 group by gender;

--  Find M,G Student in each depart
-- Count With Aggregate with two column
select 
deptid
,gender
,count(rollNO) as student_count 
from constrains_sample.student
group by deptID,gender
order by deptID,gender;


--- 
select CategoryName,SubCategoryName,ProductName from functions_sample.sales_data;

-- Category,subcategory wise find no of distinct product available 
SELECT
 CategoryName
 ,count(DISTINCT ProductName) from 
functions_sample.sales_data GROUP BY CategoryName;

SELECT CategoryName, SubCategoryName, count(DISTINCT ProductName) as Product_count from functions_sample.sales_data
 GROUP BY CategoryName, SubCategoryName
 ORDER BY CategoryName, SubCategoryName;
 
 
 -- SUM
 
 select sum(salesamount) from functions_sample.sales_data;
 
 
 -- Cate wise find the total sales amount
 
 select CategoryName,sum(salesamount) from functions_sample.sales_data
 group by CategoryName;
 
 -- Amount Spent by each customer
 select * from functions_sample.sales_data;
 
 -- MIN/MAX
 -- Which Category has high and Low sales Amount
with temp_sales as (
select CategoryName,sum(salesamount)  as AggsalesAmount from functions_sample.sales_data
 group by 1) 
 select * from temp_sales
 where aggsalesamount = (select MAX(aggsalesAmount) from temp_sales); -- where AggsalesAmount  = (
 -- select MAX(AggsalesAmount) as mininum from temp_sales;
 
 
 
 -- Select * tbl where  = (select * from table)
 
 
 select ProductName,StandardCost from sales.products order by StandardCost limit 10 ;
 
 
 
 select CategoryName,sum(salesamount)  as AggsalesAmount from functions_sample.sales_data
 group by 1;
 
-- 

-- Logical Functions,Comparison Functions
select 
studentName,gender
from  constrains_sample.student
where gender = 'Female';

Select * from constrains_sample.student
where StudentName = 'Abi';
-- I need students whose age is greater than 25
select * from constrains_sample.student
where age <= 30;

-- Student name whose roll No >15

select StudentName from constrains_sample.student
where rollNo>15;


-- List of student Name whose age is greater 20 and Gender = 'Male'
select StudentName,age,gender from constrains_sample.student
where age=34;

-- 
select StudentName,age,gender from constrains_sample.student
where age>20 OR Gender = 'Male';
-- while card % 
-- = => same to same    like  => partially satisfy the condition
select studentName from constrains_sample.student
where trim(StudentName) like 'T%';
-- Privide name has letter 'a' in that
select studentName from constrains_sample.student
where (StudentName) like '%n';

-- YOungest Student

select StudentName,age,gender,deptID from constrains_sample.student
where age = (select max(age) from constrains_sample.student
where gender = 'Female') ;
-- FInd Yougest inDept 3

select * from constrains_sample.student
 where deptid  = 3
 And age = (
select min(age) from constrains_sample.student
where deptID = 3);








 



 
 
 
 
 
 