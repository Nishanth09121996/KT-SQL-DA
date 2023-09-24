use functions_sample;
-- Create the "student" table
CREATE TABLE student_marks (
    id INT,
    name VARCHAR(255) NOT NULL,
    subject VARCHAR(255) NOT NULL,
    marks INT
);

-- Insert records into the "student" table
INSERT INTO student_marks (id, name, subject, marks) VALUES
    (1, 'Alice', 'Maths', 95),
    (1, 'Alice', 'English', 88),
    (1, 'Alice', 'Science', 92),    
    (2, 'Bob', 'Maths', 89),
    (2, 'Bob', 'English', 76),
    (2, 'Bob', 'Science', 97),    
    (3, 'Charlie', 'Maths', 78),
    (3, 'Charlie', 'English', 85),
    (3, 'Charlie', 'Science', 91),
    (4, 'David', 'Maths', 84),
    (4, 'David', 'English', 90),
    (4, 'David', 'Science', 94),    
    (5, 'Taylor', 'Maths', 88),
    (5, 'Taylor', 'English', 87),
    (5, 'Taylor', 'Science', 85);


select * from student_marks;
-- Find total mark of each student 

-- id,name,totalmark

-- Rank 
with marks as (
select 
id
,name
,sum(marks) as total_marks 
from student_marks
group by id,name
union
select 7,'raju',275
union 
select 12,'kumar',275
)
-- Rank the students based on their marks 
select *,
 dense_rank() over( order by total_marks desc) as dense_rnk 
 ,rank() over( order by total_marks desc) as rnk 
 ,row_number() over(order by total_marks asc)+10 as row_num
 from marks
order by total_marks desc;

-- Lead 

-- It is used to look up the next record
-- orderdate,totalsale
-- 2011-05-31,2000
-- 2011-06-01,2000
with cte as (
select cast(OrderDate as date) as orderDate
,round(sum(SalesAmount),2) as total_sales
from functions_sample.sales_data
group by cast(OrderDate as date)
order by 1)
select *,
lag(total_sales) over(order by orderDate) as lag_data
,lead(total_sales) over(order by orderDate) as lead_data  from cte;




-- lag

-- It is used to compare with previous record 



with year_data as (
select distinct year(orderdate) as year_name from functions_sample.sales_data
)
select year_name
,lag(year_name) over( order by year_name) as previous_year -- previous record
,lead(year_name) over( order by year_name) as next_year -- Next record
from year_data;

-- Compare current year sales vs previous year sales 
-- Steps 
-- 1.year wise sales amount

with year_sales_cte as (
select year(orderdate) as sales_year,round(sum(SalesAmount),2) as sales_amount
from functions_sample.sales_data
group by year(orderdate)
order by 1
)
, step2_cte as (
select *,COALESCE(lag(sales_amount) over(order by sales_year asc),0) as previous_year_sales from year_sales_cte)
select *
, (sales_amount > previous_year_sales)
,(sales_amount - previous_year_sales)/previous_year_sales *100
 from step2_cte;
-- ---------------------------------------------
-- Running Total 
with sales_cte as (
select 
cast(orderdate as date) as dailydate
,round(sum(SalesAmount),2) as daily_sales
, 1 as sales_amount
 from functions_sample.sales_data
 group by 1
 order by 1
 )
 select * 
 , sum(daily_sales) over(order by dailydate) as running_sales
 , sum(sales_amount) over(order by dailydate) as running_sales 
 , sum(sales_amount) over(partition by year(dailydate) order by dailydate) as running_sales
 from sales_cte;

with dept_marks as (
select 'math' as dept,'raja' as studentName,1000 as mark
union all
select 'math' as dept,'Ravi' as studentName,2000 as mark
union 
select 'math' as dept,'Ram' as studentName,3000 as mark
union 
select 'eng' as dept,'Kirthi' as studentName,1000 as mark
union 
select 'eng' as dept,'Reena' as studentName,4000 as mark
)
select * 
, max(mark) over(partition by dept order by mark desc) 
from dept_marks;

