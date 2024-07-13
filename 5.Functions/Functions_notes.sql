select * from sales.product_vw pv ;
-- Like Operatoer 
-- Find the Product Name starting with Letter 'A'

select
distinct ProductName
from  sales.product_vw as pv 
where pv.ProductName  like 'A%'

-- Product ending with 'e'
select
distinct ProductName
from  sales.product_vw as pv 
where pv.ProductName  like '%e'

-- Starting with L and Ending with 'E'
select
distinct ProductName
from  sales.product_vw as pv 
where pv.ProductName  like 'L%e'

-- Starting with anything and enthing with anything with 'Road in middle' 
select
distinct ProductName
from  sales.product_vw as pv 
where pv.ProductName  like '%Road%'

-- Interview Question Product names starting with Vovel and ending with vovel

select distinct ProductName from sales.product_vw as  pv 
where pv.ProductName regexp '^[AEIOUaeiou]'  or pv.ProductName regexp '[aeiou]$'

select distinct ProductName from sales.product_vw pv
where 
	Lower(left(pv.ProductName,1)) in ('a','e','i','o','u')
	or 
	Lower(right(pv.ProductName,1)) in ('a','e','i','o','u')



-- Functions 
-- Upper
select upper('i love india') -- output: I LOVE INDIA
-- Lower 
select lower('I LOVE INDIA') -- output:  i love india
--  Casting coverting one datatype to another datatype
-- Converting srting to Decimal
select cast('1' as decimal(2,1))  as string
-- Coverting Text to date
select cast('2024-07-07 12:59:59' as datetime) as user_date -- 2024-07-07 12:59:59
-- int to char
select  cast(1123 as char)

-- Case statement

use sales;
CREATE TABLE animal (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    characteristic VARCHAR(50)
);
INSERT INTO animal (name, characteristic) VALUES ('Dog', 'Bark');
INSERT INTO animal (name, characteristic) VALUES ('Cat', 'Meow');
INSERT INTO animal (name, characteristic) VALUES ('Cow', 'Moo');
INSERT INTO animal (name, characteristic) VALUES ('Sheep', 'Baa');
INSERT INTO animal (name, characteristic) VALUES ('Duck', 'Quack');
INSERT INTO animal (name, characteristic) VALUES ('Lion', 'Roar');
INSERT INTO animal (name, characteristic) VALUES ('Snake', 'Hiss');
INSERT INTO animal (name, characteristic) VALUES ('Bird', 'Chirp');
INSERT INTO animal (name, characteristic) VALUES ('Frog', 'Ribbit');
INSERT INTO animal (name, characteristic) VALUES ('Horse', 'Neigh');

select 
name 
, characteristic 
, case 
	when characteristic = 'Bark' then 'This is a dog'
	when characteristic = 'Meow' then 'This is a cat'
	else 'This is not cat and dog'
end as animal_type
from sales.animal as  a 

-- Count 

-- Find Number of Products In Sales DB

select 
count(pv.ProductName) as total_products
,count( distinct pv.CategoryName) as total_category 
,count(distinct pv.SubCategoryName) as total_subcategory
,count(*) 
from sales.product_vw as  pv 

with sample_data as
(
select 1 as id , 'a' as name 
union all
select 2 as id , 'b' as name 
union all
select null as id , 'a' as name 
union all
select 3 as id , 'c' as name 
union all
select null as id , 'a' as name 
union all 
select 3 as id , 'c' as name 
)
select count(*), count(1), count(id), count(name) from sample_data;
-- 6,6,4

-- Aggregate Functions 
	-- Sum
	-- Min
	-- max
	-- Avg
create or replace view sales.product_orders 
as 
(
select pv.*
,o.SalesOrderID
,o.OrderDate 
,o.OrderQty
from product_vw as  pv 
join sales.orders as o
on pv.ProductID = o.ProductID 
);


-- SUM 

select 
ProductName
,sum(OrderQty) as units_sold
from sales.product_orders as po 
group by ProductName

-- Group by 2 or more columns


select 
CategoryName
,SubCategoryName 
,ProductName 
,sum(OrderQty) as units_sold
from sales.product_orders as  po 
group by 
CategoryName ,SubCategoryName , ProductName; 


select 
CategoryName
,ProductName
,ListPrice
from product_orders po 


select
CategoryName
,SubCategoryName 	
,min(ListPrice) as minimum_price
,max(ListPrice) as maximum_price
,AVG(ListPrice) as Average_price
from product_orders po 
group by CategoryName,SubCategoryName 


-- Time Series Function
select  current_date(); 

-- date_add (Add 10 days to cuurent date)

select
current_date() as today
,DATE_ADD(current_date(),INTERVAL 10 DAY) as 10_days_later
,DATE_ADD(current_date(),INTERVAL 1 MONTH) as 1_MONTH_later
,DATE_ADD(current_date(),INTERVAL -10 DAY) as 10_days_BACK
,year(current_date()) as YEAR_DATE 
,monthname (current_date()) as moNTHdATE
,DAY(current_date() ) as DAY
,datediff('2024-07-17','2024-07-07')  as dATEdIFF

-- Groupconcat

select CategoryName 
,group_concat(ProductName)
from product_orders po 
group by CategoryName 


-- Coalease

with sample_data as
(
select 1 as id , 'a' as name 
union all
select 2 as id , 'b' as name 
union all
select null as id , 'a' as name 
union all
select 3 as id , 'c' as name 
union all
select null as id , 'a' as name 
union all 
select 3 as id , 'c' as name 
)
select 
id
,coalesce (id,5) as c_id
,case when id is null then 5 else id  end as case_id 
,name  
from sample_data;


