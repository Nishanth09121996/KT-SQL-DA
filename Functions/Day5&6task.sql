-- Quation 1

select *
from (
        select
            customername,
            salesAmount,
            dense_rank() over(
                order by salesAmount desc
            ) as rnk
        from (
                select
                    CustomerName,
                    sum(SalesAmount) as salesAmount
                from
                    functions_sample.sales_data sd
                group by 1
            ) a
    ) b
where rnk <= 5;

-- Question 2

select *
from (
        select
            customername,
            salesAmount,
            dense_rank() over(
                order by salesAmount
            ) as rnk
        from (
                select
                    CustomerName,
                    sum(SalesAmount) as salesAmount
                from
                    functions_sample.sales_data sd
                group by 1
            ) a
    ) b
where rnk <= 5;

-- Question 3

select
    ProductName,
    sum(OrderQty) as total_quantity_ordered
from
    functions_sample.sales_data sd
group by 1

-- Question 4 

with prod_quantity as (
select  ProductName
,sum(OrderQty) as total_quantity_ordered 
from functions_sample.sales_data sd 
group by 1)
select * from prod_quantity
where total_quantity_ordered =
(select min(total_quantity_ordered) from prod_quantity )

-- Question 5

select CustomerName ,count(SalesOrderID) from functions_sample.sales_data sd 
group by 1
order by 2 desc 
limit 5;

-- Question 6

with orders as (
select CustomerName 
,count(SalesOrderID) as order_count from functions_sample.sales_data sd 
group by 1)
select *,dense_rank() over(order by order_count desc  )  as rnk from orders 
limit 10;

-- Question 7


select CustomerName 
,count(SalesOrderID) as order_count from functions_sample.sales_data sd 
group by 1
having count(SalesOrderID) < 5
order by 2
limit 5;


-- Question 8

select date_format(OrderDate,'%Y/%m')
,sum(SalesAmount) as SalesAmount  
from functions_sample.sales_data sd 
group by 1
order by 1,2
limit 5;

-- Question 9

with sales as (
select date_format(OrderDate,'%Y/%m') as YearMonth
,sum(SalesAmount) as CurrentSalesAmount  
from functions_sample.sales_data sd 
group by 1
)
select YearMonth
,CurrentSalesAmount
,lag(CurrentSalesAmount) over(order by YearMonth ) as PreviousMonthSAles
,case when CurrentSalesAmount > lag(CurrentSalesAmount) over(order by YearMonth ) then 'Increase'
else 'Decrease' end as SaleStatus
from sales
limit 10;

-- Question 10

with product as (
select 
distinct CategoryName
,ProductName
,UnitPrice
from functions_sample.sales_data sd ),
costliest_product as (
select CategoryName
,ProductName
,UnitPrice
,row_number () over(partition by CategoryName order by UnitPrice desc ) as r_num_by_price  from product
)select * from costliest_product
where r_num_by_price = 1;