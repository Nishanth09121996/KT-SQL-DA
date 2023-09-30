DROP SCHEMA Joins_sample;
CREATE SCHEMA Joins_sample;
USE Joins_sample;

-- Create the "country" table
CREATE TABLE country (
    country_code VARCHAR(3) NOT NULL,
    country_id INT PRIMARY KEY
);

-- Insert records into the "country" table
INSERT INTO country (country_code, country_id)
VALUES
    ('IND', 1),
    -- Add more countries here
    ('USA', 2),
    ('CAN', 3),
    ('GBR', 4),
    ('PAK', 6),
    ('AUS', 5);
    
-- Create the "states" table with a foreign key constraint
CREATE TABLE states (
    state_id INT PRIMARY KEY,
    state_name VARCHAR(255) NOT NULL,
    country_id INT
);

-- Insert records into the "states" table
INSERT INTO states (state_id, state_name, country_id) VALUES
    (1, 'Delhi', 1),
    (2, 'Maharashtra', 1),
    (3, 'Tamil Nadu', 1),
    (11, 'Kerala', 1),
    (4, 'New York', 2),
    (5, 'California', 2),
    (6, 'Texas', 2),
    (7, 'Ontario', 3),
    (8, 'Quebec', 3),
    (9, 'London', 4),
    (10, 'Sydney', 5);
    
-- -----------------    
-- Cross Join Data

CREATE TABLE t1
(
    c1 INT NOT NULL
);

INSERT INTO t1(c1) 
VALUES(1),(2),(3);

CREATE TABLE t2
(
    c2 CHAR(1) NOT NULL
);

INSERT INTO t2(c2) 
VALUES('A'),('B'),('C');


-- ---------------------------------------------------------------------------------
-- Self Join Data
-- Create the "employees" table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(255) NOT NULL,
    manager_id INT,
    CONSTRAINT fk_manager FOREIGN KEY (manager_id) REFERENCES employees(employee_id)
);

-- Insert records into the "employees" table
INSERT INTO employees (employee_id, employee_name, manager_id) VALUES
    (1, 'John Doe', NULL), -- John Doe is a manager (no manager)
    (2, 'Jane Smith', 1),   -- Jane Smith reports to John Doe
    (3, 'Bob Johnson', 1),  -- Bob Johnson reports to John Doe
    (4, 'Alice Brown', 2),  -- Alice Brown reports to Jane Smith
    (5, 'Charlie Wilson', 2); -- Charlie Wilson reports to Jane Smith


    

