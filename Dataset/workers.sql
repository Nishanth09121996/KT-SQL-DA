drop schema workers;
create  database workers;

CREATE TABLE department (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50),
    location VARCHAR(100)
);


CREATE TABLE employee (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    birthdate DATE,
    department_id INT,
    position VARCHAR(50),
    salary DECIMAL(10, 2),
    hire_date DATE,
    FOREIGN KEY (department_id) REFERENCES department(department_id)
);


INSERT INTO department (department_id, department_name, location)
VALUES
    (1, 'Sales', 'New York'),
    (2, 'Engineering', 'San Francisco'),
    (3, 'Marketing', 'Los Angeles');
INSERT INTO employee (employee_id, first_name, last_name, birthdate, department_id, position, salary, hire_date)
VALUES
    (1, 'John', 'Doe', '1990-05-15', 1, 'Manager', 75000.00, '2015-02-10'),
    (2, 'Jane', 'Smith', '1985-11-25', 1, 'Team Lead', 65000.00, '2018-06-20'),
    (3, 'Michael', 'Johnson', '1992-08-03', 2, 'Developer', 55000.00, '2020-01-15'),
    (4, 'Emily', 'Brown', '1988-04-12', 2, 'Designer', 60000.00, '2017-09-05'),
    (5, 'William', 'Davis', '1995-10-08', 3, 'Analyst', 50000.00, '2022-03-30'),
    (6, 'Sarah', 'Wilson', '1993-07-22', 1, 'Sales Rep', 45000.00, '2019-11-12'),
    (7, 'Matthew', 'Anderson', '1987-03-18', 2, 'Senior Developer', 70000.00, '2016-08-03'),
    (8, 'Olivia', 'Martinez', '1991-01-30', 3, 'Marketing Specialist', 48000.00, '2021-04-25'),
    (9, 'James', 'Taylor', '1990-09-02', 2, 'DevOps Engineer', 62000.00, '2018-10-15'),
    (10, 'Ava', 'Garcia', '1994-12-09', 1, 'Sales Rep', 47000.00, '2020-07-07'),
    (11, 'Ethan', 'Brown', '1989-06-18', 2, 'Database Admin', 68000.00, '2016-03-21'),
    (12, 'Mia', 'Johnson', '1993-04-05', 3, 'Content Writer', 44000.00, '2019-09-10'),
    (13, 'Daniel', 'Rodriguez', '1996-08-28', 2, 'Junior Developer', 40000.00, '2021-02-18'),
    (14, 'Sophia', 'Hernandez', '1986-11-14', 1, 'Sales Manager', 80000.00, '2015-01-03'),
    (15, 'Logan', 'Lopez', '1991-07-01', 2, 'Frontend Developer', 56000.00, '2018-04-08'),
    (16, 'Chloe', 'Miller', '1995-03-20', 3, 'Social Media Manager', 52000.00, '2020-09-22'),
    (17, 'Carter', 'White', '1992-09-17', 2, 'Software Engineer', 64000.00, '2017-06-14'),
    (18, 'Grace', 'Lee', '1988-12-28', 1, 'Sales Rep', 46000.00, '2016-11-30'),
    (19, 'Owen', 'Martin', '1994-02-10', 2, 'UI/UX Designer', 58000.00, '2021-07-15'),
    (20, 'Lily', 'Adams', '1993-06-06', 3, 'Marketing Coordinator', 42000.00, '2019-03-05');


