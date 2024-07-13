-- Select all
select customerID,FirstName,LastName from sales.customers
order by CustomerID,FirstName ;

-- select few
select customerID,FirstName,LastName from sales.customers
order by CustomerID,FirstName ;

-- Select Distinct 

select distinct customerID,FirstName,LastName from sales.customers
order by CustomerID,FirstName ;

-- Alias
select abc.ProductID,abc.ProductName from sales.products as abc

-- View 
create  or replace view sales.Product_vw 
as 
(
select p2.*, p.CategoryName,sc.SubCategoryName from sales.productcategories as P
join sales.productsubcategories as sc
on p.CategoryID = sc.CategoryID 
join sales.products as p2
on sc.SubCategoryID = p2.SubCategoryID 
);

-- Where Clause 

select PVW.CategoryName from sales.Product_vw  as PVW;
select distinct pvw.CategoryName from sales.Product_vw as pvw
where CategoryName in ('Bikes','Clothing');

-- Bikes
-- Components
-- Clothing
-- Accessories

select *  from sales.Product_vw as products
where products.CategoryName = 'Bikes';

-- One or more Filter on Single Columns
select *  from sales.Product_vw as products
where products.CategoryName in ('Bikes','Clothing');

-- I want to category doesn't belongs to Bikes 

select distinct pvw.CategoryName from sales.Product_vw as pvw
where not CategoryName in ('Bikes');

-- And Operator
select distinct p.CategoryName,p.SubCategoryName from sales.product_vw as p
order by p.CategoryName ;

-- Bring the Products  belongs to Category Clothing and Subcategory Caps
select 
pv.CategoryName
,pv.SubCategoryName
,pv.ProductName 
from sales.product_vw as pv
where pv.CategoryName = 'Clothing'
	and pv.SubCategoryName  in ('Caps','Socks')

select 
pv.CategoryName
,pv.SubCategoryName
,pv.ProductName 
from sales.product_vw as pv
where pv.CategoryName = 'Clothing'
	and (pv.SubCategoryName =  'Caps' or pv.SubCategoryName='Socks')

-- OR Clause 

select distinct pv.SubCategoryName, pv.CategoryName from product_vw pv	
where pv.SubCategoryName = 'Mountain Bikes' or  pv.SubCategoryName = 'Road Bikes'

-- In Clause 


select distinct CategoryName from sales.product_vw pv 
where CategoryName  in ('Bikes','Components','Food')


-- Between Clause 

-- Bring the products where cost is between 200 and 500 $ -- 200>= <=500
select  distinct ProductName, StandardCost from sales.product_vw pv 
where StandardCost >=200 and StandardCost <=500

select  distinct ProductName, StandardCost from sales.product_vw pv 
where StandardCost between 204.6251 and 500 ;
	
-- Interview Question 


select * from sales.product_vw pv 
where 1=1; -- T 

select * from sales.product_vw pv 
where 1=2; -- f







	
	
	
	
	
	
	



