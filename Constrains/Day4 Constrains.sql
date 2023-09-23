-- Constrains

drop schema constrains_sample;
Create Schema constrains_sample;
use constrains_sample;
Create table
 constrains_sample.student(rollNo int primary key
 , DOB date
 , StudentName Varchar(20)
 , is_adult boolean
 , gender enum('Male','Female')
 , deptID int
);
 
 Select * from information_schema.columns where table_name = 'student' and table_schema = 'constrains_sample' ;
 
 insert into 
 constrains_sample.student(rollNo
 , DOB 
 , StudentName 
 , is_adult 
 , gender 
 , deptID  )
 values (1,"1996-09-09",'Abi',True,'Female',1);
 
 
 
 
 
 Alter table constrains_sample.student add column sample_col int;
 
 
 -- Adding A column to a table called Age with Default Constrain
 
 Alter table constrains_sample.student Add column age smallint default 15;
 Select * from  constrains_sample.student;
 
 
 -- Adding Additional Rows
 INSERT INTO constrains_sample.student (rollNo, DOB, StudentName, is_adult, gender, deptID, age)
VALUES
  (11, '1998-05-10', 'Tom Johnson', true, 'Male', 3, 25),
  (12, '1997-02-15', 'Emily Adams', true, 'Female', 2, 26),
  (13, '1996-11-20', 'Daniel Smith', true, 'Male', 1, 27),
  (14, '1995-08-25', 'Sophia Lee', true, 'Female', 4, 28),
  (15, '1994-04-30', 'Michael Brown', true, 'Male', 1, 29),
  (16, '1993-09-05', 'Olivia Davis', true, 'Female', 3, 30),
  (17, '1992-06-10', 'William Wilson', true, 'Male', 2, 31),
  (18, '1991-03-15', 'Emma Johnson', true, 'Female', 4, 32),
  (19, '1990-12-20', 'James White', true, 'Male', 1, 33),
  (20, '1989-07-25', 'Sophie Clark', true, 'Female', 2, 34);
  
  -- Adding Check Constrain 
  
  
  -- First, add a new constraint to the table
ALTER TABLE constrains_sample.student
ADD CONSTRAINT check_age_gt_15 CHECK (age >= 15);

-- 11:52:09	ALTER TABLE constrains_sample.student ADD CONSTRAINT check_age_gt_15 CHECK (age >= 15)	Error Code: 3819. Check constraint 'check_age_gt_15' is violated.	0.234 sec

delete  from constrains_sample.student where age <15;
-- True Case 

-- This INSERT statement adheres to the age constraint
INSERT INTO constrains_sample.student (rollNo, DOB, StudentName, is_adult, gender, deptID, age,email)
VALUES (26, '2005-04-10', 'Sophia Turner', false, 'Female', 3, 13,'abc');

-- False Case

-- This INSERT statement violates the age constraint
INSERT INTO constrains_sample.student (rollNo, DOB, StudentName, is_adult, gender, deptID, age)
VALUES (22, '2010-02-20', 'Jake Smith', false, 'Male', 2, 12);

-- 0	283	11:56:44	INSERT INTO constrains_sample.student (rollNo, DOB, StudentName, is_adult, gender, deptID, age)
-- VALUES (22, '2010-02-20', 'Jake Smith', false, 'Male', 2, 12)	Error Code: 3819. Check constraint 'check_age_gt_15' is violated.	0.000 sec
-- -----------------------------------------------------------------------------------
-- Foriegn Key 

CREATE TABLE constrains_sample.Department (
  DeptID INT PRIMARY KEY CHECK (DeptID >= 1 AND DeptID <= 5),
  DeptName VARCHAR(50) NOT NULL,
  StartDate timestamp DEFAULT now()
);

-- Insert 

INSERT INTO constrains_sample.Department (DeptID, DeptName)
VALUES
  (1, 'Bio'),
  (2, 'CS'),
  (3, 'Commerce'),
  (4, 'Maths');
  
select * from constrains_sample.Department;

select * from constrains_sample.student;

-- Applying Foreign key 

-- Adding a foreign key constraint
ALTER TABLE constrains_sample.student
ADD CONSTRAINT fk_deptID FOREIGN KEY (deptID) REFERENCES Department (DeptID);

-- Can you able to add new deptid which is not in dept table in Student Table ?
INSERT INTO constrains_sample.student (rollNo, DOB, StudentName, is_adult, gender, deptID, age)
VALUES (22, '2010-02-20', 'Jake Smith', false, 'Male', 5, 18);

INSERT INTO constrains_sample.Department (DeptID, DeptName)
VALUES
  (5, 'Phy');
--
-- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`constrains_sample`.`student`, CONSTRAINT `fk_deptID` FOREIGN KEY (`deptID`) REFERENCES `department` (`DeptID`))

-- --------------------------------------------------------------------------------
-- Unique Constrain & Not Null 

ALTER TABLE constrains_sample.student
ADD Email VARCHAR(100) not null ;

-- Update records with roll numbers 11 to 20 and add email addresses
UPDATE constrains_sample.student
SET Email = CASE
    WHEN rollNo = 11 THEN 'john@example.com'
    WHEN rollNo = 12 THEN 'jane@example.com'
    WHEN rollNo = 13 THEN 'billy@example.com'
    WHEN rollNo = 14 THEN 'emma@example.com'
    WHEN rollNo = 15 THEN 'michael@example.com'
    WHEN rollNo = 16 THEN 'olivia@example.com'
    WHEN rollNo = 17 THEN 'david@example.com'
    WHEN rollNo = 18 THEN 'sophia@example.com'
    WHEN rollNo = 19 THEN 'james@example.com'
    WHEN rollNo = 20 THEN 'sophie@example.com'
    WHEN rollNo = 1 THEN 'abi@example.com'
    ELSE 'sample@gmail.com'
  END;


Select studentName,email,count(*) from constrains_sample.student
group by studentName,email;

delete from student where email = 'sample@gmail.com';

Alter table constrains_sample.student
 add constraint unique_ck_student unique(StudentName,email);
 
 
Alter table constrains_sample.student
 add constraint unique_ck_student_email unique(email);
 
 
 
--  CREATE TABLE `student` (
--   `rollNo` int NOT NULL,
--   `DOB` date DEFAULT NULL,
--   `StudentName` varchar(20) DEFAULT NULL,
--   `is_adult` tinyint(1) DEFAULT NULL,
--   `gender` enum('Male','Female') DEFAULT NULL,
--   `deptID` int DEFAULT NULL,
--   `sample_col` int DEFAULT NULL,
--   `age` smallint DEFAULT '15',
--   `Email` varchar(100) NOT NULL,
--   PRIMARY KEY (`rollNo`),
--   UNIQUE KEY `unique_ck_student_email` (`Email`),
--   UNIQUE KEY `unique_ck_student` (`StudentName`,`Email`),
--   KEY `fk_deptID` (`deptID`),
--   CONSTRAINT `fk_deptID` FOREIGN KEY (`deptID`) REFERENCES `department` (`DeptID`),
--   CONSTRAINT `check_age_gt_15` CHECK ((`age` >= 15))
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Surrogate key 

create table constrains_sample.orders (orderid int auto_increment  primary key , productID int);

insert into constrains_sample.orders (productid) values(1),(2),(35),(60);

select * from constrains_sample.orders;




