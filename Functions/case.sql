-- Case


select 
studentname
,age
,gender
,case 
when gender = 'Male' then 'M' -- condition 1
when gender = 'Female' then 'F' -- condition 2 
-- condiotn n
else 'O' 
end  as gender_small
from constrains_sample.student;

-- Make gender more specific If gender == male => 'M' , If gender == 'female' Gen = f

-- If age >= 18 means adult else Not adult

select 
studentname
,age
,gender
,case 
when age>=18 then 'Adult'
when age<5 then 'Kid'
else 'not Adult'
end  as age_cat
from constrains_sample.student;

select COALESCE(null,1);
select COALESCE(col,"DCF") from (
select 1 as col 
union 
select 2 as col
union 
select null as coll)A;
-- -----------------------------------------
select cast(1 as char);


select current_timestamp(),cast(current_timestamp() as date);






