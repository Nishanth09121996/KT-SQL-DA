# Constrains in SQL
In MySQL, several types of constraints are used to enforce rules and ensure data integrity:

## Constrains/Key Types

1. **Primary Key Constraint**:
   - Defines a column or set of columns that uniquely identifies each row in a table.
   - It must contain unique values and cannot have NULL values.
   - There can only be one primary key constraint defined per table.
   - Example:

     ```sql
     CREATE TABLE students (
         student_id INT PRIMARY KEY,
         name VARCHAR(100),
         age INT
     );
     ```

2. **Unique Constraint**:
   - Ensures that all values in a column (or a set of columns) are unique.
   - Unlike the primary key, it can contain NULL values, but each non-NULL value must be unique.
   - Multiple unique constraints can be defined per table.
   - Example:

     ```sql
     CREATE TABLE employees (
         employee_id INT,
         email VARCHAR(100) UNIQUE,
         department_id INT,
         UNIQUE(employee_id)
     );
     ```

3. **Foreign Key Constraint**:
   - Maintains referential integrity between two related tables.
   - Specifies a column (or a set of columns) in one table that refers to the primary key column (or unique key column) in another table.
   - Helps enforce relationships between tables and prevent actions that would destroy links between tables.
   - Example:
     ```sql
     CREATE TABLE orders (
         order_id INT PRIMARY KEY,
         customer_id INT,
         order_date DATE,
         FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
     );
     ```

4. **Check Constraint**:
   - Specifies a condition that each row in a table must satisfy.
   - It restricts the values that can be inserted into a column.
   - Example:
     ```sql
     CREATE TABLE products (
         product_id INT PRIMARY KEY,
         product_name VARCHAR(100),
         price DECIMAL(10,2),
         quantity INT,
         CHECK (price > 0 AND quantity >= 0)
     );
     ```

5. **Super Key**:
   - A set of columns that uniquely identifies each row in a table.
   - It can be a candidate for being a primary key.
   - Example:
     ```sql
     CREATE TABLE books (
         isbn VARCHAR(20) PRIMARY KEY,
         title VARCHAR(100),
         author VARCHAR(100),
         publisher VARCHAR(100)
     );
     ```

6. **Candidate Key**:
   - A minimal super key, meaning it is a set of columns that can uniquely identify each row in a table, and no subset of those columns can do the same.
   - Often chosen as the primary key.
   - Example:
     ```sql
     CREATE TABLE customers (
         customer_id INT PRIMARY KEY,
         email VARCHAR(100) UNIQUE,
         phone VARCHAR(20) UNIQUE
     );
     ```

These constraints are fundamental in MySQL (and in most relational databases) to maintain data accuracy, integrity, and relationships between tables.

### Practical Demonstration

```sql
-- Drop and Create Schema
DROP SCHEMA IF EXISTS constrains_sample;
CREATE SCHEMA constrains_sample;
USE constrains_sample;

-- Create Student Table
CREATE TABLE student (
    rollNo INT PRIMARY KEY,
    DOB DATE,
    StudentName VARCHAR(20),
    is_adult BOOLEAN,
    gender ENUM('Male', 'Female'),
    deptID INT
);

-- Select columns from information_schema
SELECT * FROM information_schema.columns WHERE table_name = 'student' AND table_schema = 'constrains_sample';

-- Insert sample data
INSERT INTO student (rollNo, DOB, StudentName, is_adult, gender, deptID)
VALUES (1, '1996-09-09', 'Abi', TRUE, 'Female', 1);

-- Add a new column
ALTER TABLE student ADD COLUMN sample_col INT;

-- Adding Age column with Default Constraint
ALTER TABLE student ADD COLUMN age SMALLINT DEFAULT 15;

-- Additional rows insert
INSERT INTO student (rollNo, DOB, StudentName, is_adult, gender, deptID, age)
VALUES
  (11, '1998-05-10', 'Tom Johnson', TRUE, 'Male', 3, 25),
  (12, '1997-02-15', 'Emily Adams', TRUE, 'Female', 2, 26),
  (13, '1996-11-20', 'Daniel Smith', TRUE, 'Male', 1, 27),
  (14, '1995-08-25', 'Sophia Lee', TRUE, 'Female', 4, 28),
  (15, '1994-04-30', 'Michael Brown', TRUE, 'Male', 1, 29),
  (16, '1993-09-05', 'Olivia Davis', TRUE, 'Female', 3, 30),
  (17, '1992-06-10', 'William Wilson', TRUE, 'Male', 2, 31),
  (18, '1991-03-15', 'Emma Johnson', TRUE, 'Female', 4, 32),
  (19, '1990-12-20', 'James White', TRUE, 'Male', 1, 33),
  (20, '1989-07-25', 'Sophie Clark', TRUE, 'Female', 2, 34);

-- Adding Check Constraint for age >= 15
ALTER TABLE student ADD CONSTRAINT check_age_gt_15 CHECK (age >= 15);

-- Testing check constraint
DELETE FROM student WHERE age < 15;

-- True case insert
INSERT INTO student (rollNo, DOB, StudentName, is_adult, gender, deptID, age, email)
VALUES (26, '2005-04-10', 'Sophia Turner', FALSE, 'Female', 3, 13, 'abc@example.com');

-- False case insert violating check constraint
-- INSERT INTO student (rollNo, DOB, StudentName, is_adult, gender, deptID, age)
-- VALUES (22, '2010-02-20', 'Jake Smith', FALSE, 'Male', 2, 12);

-- Create Department Table
CREATE TABLE Department (
    DeptID INT PRIMARY KEY CHECK (DeptID >= 1 AND DeptID <= 5),
    DeptName VARCHAR(50) NOT NULL,
    StartDate TIMESTAMP DEFAULT NOW()
);

-- Insert data into Department
INSERT INTO Department (DeptID, DeptName)
VALUES
  (1, 'Bio'),
  (2, 'CS'),
  (3, 'Commerce'),
  (4, 'Maths');

-- Applying Foreign Key Constraint
ALTER TABLE student ADD CONSTRAINT fk_deptID FOREIGN KEY (deptID) REFERENCES Department (DeptID);

-- Attempting to insert a deptID that does not exist in Department table
-- INSERT INTO student (rollNo, DOB, StudentName, is_adult, gender, deptID, age)
-- VALUES (22, '2010-02-20', 'Jake Smith', FALSE, 'Male', 5, 18);

-- Adding Email column with NOT NULL constraint
ALTER TABLE student ADD COLUMN Email VARCHAR(100) NOT NULL;

-- Updating records with emails
UPDATE student
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

-- Selecting studentName, email, and their count
SELECT StudentName, Email, COUNT(*) FROM student
GROUP BY StudentName, Email;

-- Deleting sample email record
-- DELETE FROM student WHERE email = 'sample@gmail.com';

-- Adding Unique Constraint on StudentName and Email
ALTER TABLE student ADD CONSTRAINT unique_ck_student UNIQUE (StudentName, Email);

-- Attempting to add duplicate email for unique constraint
-- ALTER TABLE student ADD CONSTRAINT unique_ck_student_email UNIQUE (Email);

-- Create Orders Table with Surrogate Key
CREATE TABLE orders (
    orderid INT AUTO_INCREMENT PRIMARY KEY,
    productID INT
);

-- Inserting data into orders
INSERT INTO orders (productID) VALUES (1), (2), (35), (60);

-- Selecting all from orders
SELECT * FROM orders;
```

This script covers the creation of tables, insertion of data, addition of columns, application of constraints (primary key, foreign key, unique, check), and usage of a surrogate key. Adjustments have been made to ensure SQL statements are commented out where constraints might be violated or not applicable. Adjust as needed for your specific MySQL environment and requirements.