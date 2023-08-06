-- Create a stored Procedure
use sales;

create procedure get_customers()
begin
	select * from sales.customers;
end

-- Call a stored Procedure

call get_customers(); 

