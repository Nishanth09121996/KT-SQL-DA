-- CONCAT(): Concatenates two or more strings together.
select concat("Raj","Kumar");


-- SUBSTRING(): Extracts a portion of a string based on a specified starting position and length.
select 'Abcde', substring('Abcde',5,5);

-- I need Last two character
select length('Gustavo');


-- UPPER(): Converts a string to uppercase.

select upper('Gustavo');

-- LOWER(): Converts a string to lowercase.

select lower('Gustavo');
-- LENGTH(): Returns the length (number of characters) of a string.

select length('Gustavo');

-- TRIM(): Removes leading and trailing spaces from a string.

select trim('  abc  ');



select firstname, lastname
,concat(firstname,' ',lastname)  as FullName
,substring(firstname,1,2) as first_two
,substring(firstname,length(firstname)-1,length(firstname)) as last_two_character
,substring(REVERSE(firstname),length(firstname)-1,length(firstname)) as last_two_character
,substring(fullname,1,locate(' ',fullname)) as first_name_gen
,substring(fullname,locate(' ',fullname),length(fullname)) as last_name_gen
 from sales.customers;