-- Constrains

-- Not Null 

-- Constrains are rules which are applied on the table.

drop table sample.not_null_cons;
-- Without Constrain 
create table sample.not_null_cons(id int,name varchar(20));
-- with Constrain
create table sample.not_null_cons(id int not null,name varchar(20));

select * from sample.not_null_cons;

insert into sample.not_null_cons(id, name) values(1,'Raja');
-- 3	245	19:42:52	insert into sample.not_null_cons(id, name) values(1,'Raja')	1 row(s) affected	0.015 sec
insert into sample.not_null_cons(id,name) values(2,'Rani');
insert into sample.not_null_cons(name) values('Ravi');
-- 0	251	19:46:18	insert into sample.not_null_cons(name) values('Ravi')	Error Code: 1364. Field 'id' doesn't have a default value	0.000 sec
-- 0	246	19:43:26	3 245 19:42:52 insert into sample.not_null_cons(id, name) values(1,'Raja') 1 row(s) affected 0.015 sec
-- insert into sample.not_null_cons(id,name) values(null,'Rani')	Error Code: 1064. You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '3 245 19:42:52 insert into sample.not_null_cons(id, name) values(1,'Raja') 1 row' at line 1	0.000 sec
-- 0	247	19:44:00	insert into sample.not_null_cons(id,name) values(null,'Rani')	Error Code: 1048. Column 'id' cannot be null	0.000 sec


-- Check Constain

create table sample.person(id int,name varchar(20) ,age int , Constraint age_check check (age>=18));
select * from sample.person;
insert into sample.person values(1,'Raja',21);
insert into sample.person values(2,'Rani',12);
-- 0	256	19:54:56	insert into sample.person values(2,'Rani',12)	Error Code: 3819. Check constraint 'age_check' is violated.	0.000 sec


-- Default Constrains 
drop table sample.person;
create table sample.person(id int PRIMARY key  auto_increment,name varchar(20) default 'Rama' ,age int);
select * from sample.person;
insert into sample.person(id, age) values(2,12);
insert into sample.person(name,age) values('abc',22);

-- Auto increment 
create table sample.person(id int PRIMARY key  auto_increment,name varchar(20) default 'Rama' ,age int);
select * from sample.person;
insert into sample.person(name,age) values('abc',22);


-- Primary Key Constrains 
drop table sample.student;
create database school;
create table school.department(dept_id int primary key  , dept_name varchar(10));
insert into school.department(dept_id,dept_name) values(1,'CSC');
insert into school.department(dept_id,dept_name) values(2,'MAT');
insert into school.department(dept_id,dept_name) values(3,'Science');
commit;
select * from school.department;
-- 0	26	10:46:50	insert into school.department(dept_id,dept_name) values(null,'MAT')	Error Code: 1048. Column 'dept_id' cannot be null	0.000 sec
-- 0	27	10:47:28	insert into school.department(dept_id,dept_name) values(1,'MAT')	Error Code: 1062. Duplicate entry '1' for key 'department.PRIMARY'	0.000 sec
create table school.student(
student_id int primary key AUTO_INCREMENT,
student_name VARCHAR(30),
age int,
dept_id int,
phone varchar(30),
 foreign key(dept_id)  references school.department(dept_id));
 
INSERT INTO school.student
(student_id, student_name, age, dept_id, phone)
VALUES(1, 'Raja', 10, 1, '98888888');

INSERT INTO school.student
(student_id, student_name, age, dept_id, phone)
VALUES(2, 'Rani', 12, 2, '98818888');
 
 INSERT INTO school.student
(student_id, student_name, age, dept_id, phone)
VALUES(3, 'Vimal', 22, 3, '98818888');
 
 









