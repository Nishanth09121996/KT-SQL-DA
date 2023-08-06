use sales;
drop procedure if exists get_customer_by_id;
create procedure get_customer_by_id(IN customer_id int) -- IN is key word to parameter to send something
begin
	select * from sales.customers where CustomerID = customer_id;
end

-- Call the parameter 
call get_customer_by_id(295); 
