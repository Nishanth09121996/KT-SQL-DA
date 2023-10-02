drop schema interviewquestion;
create schema interviewquestion;
use interviewquestion;
drop table if exists employee;
CREATE TABLE Employee (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(255),
    manager_id INT,
    salary decimal(7,2),
    deptId int
);
INSERT INTO Employee (employee_id, employee_name, manager_id, salary, deptId)
VALUES
    (1, 'John Doe', NULL, 75000.00, 1),
    (2, 'Alice Smith', 1, 60000.00, 2),
    (3, 'Bob Johnson', 1, 65000.00, 2),
    (4, 'Eve Davis', 2, 55000.00, 3),
    (5, 'Michael Brown', 2, 60000.00, 3),
    (6, 'Emily Wilson', 3, 52000.00, 2),
    (7, 'Daniel Lee', 3, 57000.00, 2),
    (8, 'Olivia Adams', 4, 48000.00, 3),
    (9, 'Sophia Martin', 4, 52000.00, 3),
    (10, 'William White', 5, 48000.00, 4),
    (11, 'Ava Hall', 5, 50000.00, 4),
    (12, 'Matthew Turner', 6, 46000.00, 2),
    (13, 'Emma Clark', 6, 48000.00, 2),
    (14, 'James Baker', 7, 45000.00, 2),
    (15, 'Charlotte Wright', 7, 47000.00, 2),
    (16, 'Benjamin Adams', 8, 43000.00, 3),
    (17, 'Mia Harris', 8, 45000.00, 3),
    (18, 'Logan Garcia', 9, 42000.00, 3),
    (19, 'Amelia Martinez', 9, 44000.00, 3),
    (20, 'Lucas Nelson', 10, 41000.00, 4);
CREATE TABLE Department (
    deptId INT PRIMARY KEY,
    department_name VARCHAR(255)
);

INSERT INTO Department (deptId, department_name)
VALUES
    (1, 'HR'),
    (2, 'Marketing'),
    (3, 'Engineering'),
    (4, 'Finance');

-- -----------------------------------------------------------
CREATE TABLE Student (
    studentID INT PRIMARY KEY,
    student_name VARCHAR(255),
    age INT
);


INSERT INTO Student (studentID, student_name, age)
VALUES
    (1, 'John Doe', 20),
    (2, 'Alice Smith', 22),
    (3, 'Bob Johnson', 21),
    (4, 'John Doe', 20),
     (5, 'Michael Brown', 19),
    (6, 'Emily Wilson', 20),
    (7, 'Bob Johnson', 21);

-- ------------------------------------------------------
CREATE TABLE tableOne (
    ID INT
);

INSERT INTO tableOne (ID)
VALUES
    (1),
    (1),
    (1),
    (1);
CREATE TABLE tabletwo (
    ID INT
);
INSERT INTO tabletwo (ID)
VALUES
    (1),
    (1);

CREATE TABLE yearly_sales (
    year INT PRIMARY KEY,
    sales DECIMAL(10, 2)
);

INSERT INTO yearly_sales (year, sales)
VALUES
    (2015, 100000.00),
    (2016, 120000.00),
    (2017, 150000.00),
    (2018, 180000.00),
    (2019, 200000.00),
    (2020, 210000.00),
    (2021, 220000.00),
    (2022, 230000.00),
    (2023, 240000.00);
-- -----------------------------------------------
CREATE TABLE monthly_sales (
    MonthDate DATE PRIMARY KEY,
    salesamount DECIMAL(10, 2)
);

-- Insert monthly sales data for the year 2022
INSERT INTO monthly_sales (MonthDate, salesamount)
VALUES
    ('2022-01-01', 12000.00),
    ('2022-02-01', 13500.00),
    ('2022-03-01', 14500.00),
    ('2022-04-01', 15500.00),
    ('2022-05-01', 16000.00),
    ('2022-06-01', 17000.00),
    ('2022-07-01', 18500.00),
    ('2022-08-01', 19500.00),
    ('2022-09-01', 20000.00),
    ('2022-10-01', 21000.00),
    ('2022-11-01', 22000.00),
    ('2022-12-01', 23000.00);

-- --------------------------------------------------------
CREATE TABLE ProductSales (
    productcategory VARCHAR(255),
    productname VARCHAR(255),
    sales DECIMAL(10, 2)
);

-- Insert sample data
INSERT INTO ProductSales (productcategory, productname, sales)
VALUES
    ('Electronics', 'Laptop', 1200.00),
    ('Electronics', 'Smartphone', 600.00),
    ('Electronics', 'Tablet', 350.00),
    ('Electronics', 'Headphones', 100.00),
    ('Clothing', 'T-Shirt', 20.00),
    ('Clothing', 'Jeans', 40.00),
    ('Clothing', 'Dress', 60.00),
    ('Clothing', 'Shoes', 80.00),
    ('Furniture', 'Sofa', 800.00),
    ('Furniture', 'Dining Table', 450.00),
    ('Furniture', 'Bed', 600.00),
    ('Furniture', 'Chair', 75.00),
    ('Books', 'Novel', 15.00),
    ('Books', 'Textbook', 80.00),
    ('Books', 'Magazine', 5.00),
    ('Books', 'Cookbook', 25.00);
-- --------------------------------------------------

CREATE TABLE SalesData (
    Year INT,
    Month INT,
    MonthText VARCHAR(20),
    Sales DECIMAL(10, 2)
);

-- Insert data for two years with months in text
INSERT INTO SalesData (Year, Month, MonthText, Sales)
VALUES
    (2022, 1, 'January', 12000.00),
    (2022, 2, 'February', 13500.00),
    (2022, 3, 'March', 14500.00),
    (2022, 4, 'April', 15500.00),
    (2022, 5, 'May', 16000.00),
    (2022, 6, 'June', 17000.00),
    (2022, 7, 'July', 18500.00),
    (2022, 8, 'August', 19500.00),
    (2022, 9, 'September', 20000.00),
    (2022, 10, 'October', 21000.00),
    (2022, 11, 'November', 22000.00),
    (2022, 12, 'December', 23000.00),
    (2023, 1, 'January', 12500.00),
    (2023, 2, 'February', 14000.00),
    (2023, 3, 'March', 15000.00),
    (2023, 4, 'April', 16000.00),
    (2023, 5, 'May', 16500.00),
    (2023, 6, 'June', 17500.00),
    (2023, 7, 'July', 19000.00),
    (2023, 8, 'August', 20000.00),
    (2023, 9, 'September', 20500.00),
    (2023, 10, 'October', 21500.00),
    (2023, 11, 'November', 22500.00),
    (2023, 12, 'December', 23500.00);

Commit;