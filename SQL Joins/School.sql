drop schema if exists school;
create schema school;
use school;

-- Create the School table
CREATE TABLE School (
    SchoolId INT PRIMARY KEY,
    SchoolName VARCHAR(255)
);

-- Insert data into the School table
INSERT INTO School (SchoolId, SchoolName)
VALUES (1, 'ABC School');

-- ------------------------------------------------------------
CREATE TABLE Teacher (
    TeacherID INT PRIMARY KEY,
    TeacherName VARCHAR(50),
    TeacherGender VARCHAR(10)
);

INSERT INTO Teacher (TeacherID, TeacherName, TeacherGender)
VALUES
    (1, 'John Smith', 'Male'),
    (2, 'Alice Johnson', 'Female'),
    (3, 'Michael Brown', 'Male'),
    (4, 'Sarah Davis', 'Female'),
    (5, 'Robert Wilson', 'Male'),
    (6, 'Emily Clark', 'Female'),
    (7, 'David Lee', 'Male'),
    (8, 'Jessica White', 'Female'),
    (9, 'Daniel Anderson', 'Male'),
    (10, 'Olivia Martinez', 'Female');
-- --------------------------------------------------------------------------------
-- Create the Class table
CREATE TABLE Class (
    ClassId INT PRIMARY KEY,
    ClassName VARCHAR(20),
    ClassTeacherId INT,
    SchoolId INT
);

-- Insert data into the Class table
INSERT INTO Class (ClassId, ClassName, ClassTeacherId, SchoolId)
VALUES
    (1, 'First', 1, 1),
    (2, 'Second', 2, 1),
    (3, 'Third', 3, 1),
    (4, 'Fourth', 4, 1),
    (5, 'Fifth', 5, 1);
-- -------------------------------------------------------------------

-- Create the Student table
CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(255),
    Gender VARCHAR(10),
    ClassID INT,
    FOREIGN KEY (ClassID) REFERENCES Class(ClassID)
);

-- Insert sample data into the Student table with Indian names
INSERT INTO Student (StudentID, StudentName, Gender, ClassID)
VALUES
    (1, 'Aarav', 'Male', 1),
    (2, 'Arya', 'Female', 2),
    (3, 'Aditi', 'Female', 1),
    (4, 'Akshay', 'Male', 3),
    (5, 'Bhavana', 'Female', 2),
    (6, 'Chirag', 'Male', 4),
    (7, 'Divya', 'Female', 3),
    (8, 'Ganesh', 'Male', 5),
    (9, 'Hina', 'Female', 4),
    (10, 'Ishaan', 'Male', 1),
    (11, 'Jaya', 'Female', 5),
    (12, 'Kunal', 'Male', 2),
    (13, 'Lakshmi', 'Female', 3),
    (14, 'Manish', 'Male', 1),
    (15, 'Neha', 'Female', 2),
    (16, 'Om', 'Male', 3),
    (17, 'Pooja', 'Female', 4),
    (18, 'Raj', 'Male', 5),
    (19, 'Sakshi', 'Female', 1),
    (20, 'Tarun', 'Male', 2),
    (21, 'Uma', 'Female', 3),
    (22, 'Varun', 'Male', 4),
    (23, 'Yashika', 'Female', 5),
    (24, 'Zoya', 'Female', 1),
    (25, 'Vivek', 'Male', 2),
    (26, 'Shreya', 'Female', 3),
    (27, 'Rishi', 'Male', 4),
    (28, 'Nandini', 'Female', 5),
    (29, 'Amit', 'Male', 1),
    (30, 'Ritika', 'Female', 2);
-- --------------------------------------------------------
-- Create the Subjects table
CREATE TABLE Subjects (
    SubjectId INT PRIMARY KEY,
    SubjectName VARCHAR(255)
);

-- Insert data into the Subjects table
INSERT INTO Subjects (SubjectId, SubjectName)
VALUES
    (1, 'Mathematics'),
    (2, 'Science'),
    (3, 'English'),
    (4, 'History');
-- -------------------------------------------------------------------------
CREATE TABLE exam_results (
    ResultID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    SubjectID INT,
    Marks INT,
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (SubjectID) REFERENCES Subjects(SubjectId)
);

INSERT INTO exam_results (StudentID, SubjectID, Marks)
SELECT 
    ROUND(RAND() * 30) + 1 AS StudentID,
    ROUND(RAND() * 3) +1 AS SubjectID,
    ROUND(RAND() * 100) AS Marks
FROM
    (SELECT 1 AS n UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 ) t1,
    (SELECT 1 AS n UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 ) t2
LIMIT 100;

commit;