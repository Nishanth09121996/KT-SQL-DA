-- Find total sales done by a customer order by salesAmount
select c.FullName as CustomerName
,round( sum(o.OrderQty * o.UnitPrice),1) as salesAmount
from sales.orders o 
join sales.customers c 
on o.CustomerID = c.CustomerID 
group by 1
order by 2 desc

-- Find catagory wise sales amount 

select 
p3.CategoryName 
,round( sum(o.OrderQty * o.UnitPrice),1) as salesAmount
from sales.orders o 
join sales.products p 
on o.ProductID = p.ProductID 
join sales.productsubcategories p2 
on p.SubCategoryID = p2.SubCategoryID 
join sales.productcategories p3 
on p2.CategoryID = p3.CategoryID 
group by 1
order by 2 desc

--Which Employee has made more number of sales

select e.FullName
,round( sum(o.OrderQty * o.UnitPrice),1) as salesAmount 
from sales.orders o 
join sales.employees e 
on o.EmployeeID = e.EmployeeID 
group by 1
order by 2 desc

--which product was ordered most number of times

select 
p.ProductName ,
count(distinct SalesOrderID) total_orders_made
from sales.orders o 
join sales.products p 
on o.ProductID = p.ProductID 
group by 1



--Additional Practice Question

--Find total orders by category,subcategory
--Find the sales made by the female employees
--Find the sales made by the vendor
--Find the sales made by the manager
--Find the distinct product brought by the customers
--Find top 5 customer who made more number of orders
--Find top  product of a vendor based on orderQuantity
	with cte as (
	select v2.VendorName ,p.ProductName ,sum(o.OrderQty) as OrderQty  from sales.orders o 
	join sales.products p 
	on o.ProductID = p.ProductID 
	join sales.vendorproduct v 
	on p.ProductID = v.ProductID 
	join sales.vendors v2 
	on v.VendorID = v2.VendorID 
	group by 1,2
	order by 1 asc,2  ,3 desc )
	select vendorName,productname,OrderQty  from cte
	where (vendorName,OrderQty) in (select vendorName,max(OrderQty) from cte group by 1 )