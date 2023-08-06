use sales;
drop procedure if exists get_no_of_orders_by_customers;
create procedure get_no_of_orders_by_customers(out records int, in customer_id int)
begin
	select coalesce (count(distinct o.SalesOrderID),0) into records from sales.orders o
	join sales.customers c 
	on o.CustomerID = c.CustomerID 
	where c.CustomerID = customer_id ;
end

-- execute in a diffrent line
call get_no_of_orders_by_customers(@records,295);
select @records;

