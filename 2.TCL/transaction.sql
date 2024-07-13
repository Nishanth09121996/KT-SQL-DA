truncate table sample.student;
create table sample.student(id int, name varchar(20), marks int);

insert into sample.student(id, name, marks) values(1,'Raja',400);
commit;
rollback;

select @@autocommit;

set autocommit = 0;

select * from sample.student;

----- 

-- SavePoint 

start Transaction;
Savepoint before_insert;
insert into sample.student(id, name, marks) values(2,'Rani',400);
savepoint after_insert;
insert into sample.student(id, name, marks) values(3,'Sita',400);
rollback to after_insert;
commit;


