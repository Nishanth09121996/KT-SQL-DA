create schema data_types;

use data_types;

-- Integer Type Data Sample

create table data_types.integer_table(integerColumn int );

Select *
from
    information_schema.columns
where
    table_name = 'integer_table';

insert into
    data_types.integer_table(integerColumn)
values(2147483648);

select * from data_types.integer_table;

-- Decimal Type sample

Create table data_types.decimal_table(decimal_column dec(5,2) );

-- 100.00  100.099

Select *
from
    information_schema.columns
where
    table_name = 'decimal_table';

insert into data_types.decimal_table values(1234.00);

select * from data_types.decimal_table;

-- 0	153	19:30:54	insert into data_types.decimal_table values(1234.00)	Error Code: 1264. Out of range value for column 'decimal_column' at row 1	0.000 sec

-- Char

create table data_types.char_datatype (studentName char(5));

insert into
    data_types.char_datatype(studentName)
values
('Abc'), ('ABCDE'), ('A');

Select *, length(studentName) from data_types.char_datatype;

-- Varchar

create table data_types.varchar_table(studentname varchar(5));

insert into
    data_types.varchar_table(studentName)
values
('Abc'), ('ABCDE'), ('A');

Select *, length(studentName) from data_types.char_datatype;

Select *, length(studentName) from data_types.varchar_table;

insert into data_types.varchar_table(studentName) values('ABCDFFF');

create table data_types.text_table(studentname text);

-- task

-- Date (yyyy-mm-dd) time (yyyy-mm-dd hh:mm::s )

Create table
    data_types.date_table(
        date_column date,
        timestamp_column timestamp default current_timestamp
    );

Select *
from
    information_schema.columns
where table_name = 'date_table';

insert into
    data_types.date_table (date_column, timestamp_column)
values
(
        '2023-13-16',
        '2023-09-16 19:52:50'
    );

-- timestamp_column '2023-09-16 19:52:50'

select * from data_types.date_table;

-- Error Code: 1292. Incorrect date value: '2023-13-16' for column 'date_column' at row 1	0.000 sec

-- Bolean

create table data_types.boolean_table(boolean_column boolean);

insert into data_types.boolean_table values(True);

insert into data_types.boolean_table values(False);

select * from data_types.boolean_table;

-- Json Type

CREATE TABLE
    data_types.Employees (
        EmployeeID INT PRIMARY KEY,
        EmployeeName VARCHAR(50),
        EmployeeInfo JSON
    );

-- Insert JSON data into the table

INSERT INTO
    data_types.Employees (
        EmployeeID,
        EmployeeName,
        EmployeeInfo
    )
VALUES (
        1,
        'John Doe',
        '{"Department": "HR", "Salary": 50000, "Skills": ["Communication", "Problem Solving"]}'
    );

select
    EmployeeID,
    EmployeeName,
    employeeinfo ->> '$.Department' as Department,
    employeeinfo ->> '$.Skills[0]' as skill1,
    employeeinfo ->> '$.Skills[1]' as skill2
from data_types.employees;

select employeeinfo->>'$.Skills[0]' from employees;

-- {key: value }

-- '{"Department": "HR", "Salary": 50000}