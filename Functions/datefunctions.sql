-- https://dev.mysql.com/doc/refman/8.0/en/date-and-time-functions.html

-- CURRENT_DATE(): Returns the current date.
select current_date();
-- CURRENT_TIME(): Returns the current time.
select current_time();
-- CURRENT_TIMESTAMP(): Returns the current timestamp (date and time).
select current_timestamp();
-- DATEPART(): Extracts a specific part (year, month, day, etc.) from a date or timestamp.
select year(current_timestamp),month(current_timestamp);


-- DATEDIFF(): Calculates the difference between two dates or timestamps.
SELECT DATEDIFF('2010-11-30 23:59:59','2010-12-31');

-- DATEADD() :SELECT DATE_ADD('2023-09-15', INTERVAL 3 DAY) AS new_date;

SELECT DATE_ADD(current_date, INTERVAL 3 DAY),DATE_ADD(current_date, INTERVAL 3 year),DATE_ADD(current_date, INTERVAL 3 month)   ;


-- Maths 

select round(12.53,1), ceil(12.53), floor(12.53),abs(-12.53)



