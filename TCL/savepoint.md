# Transaction Control Language

## Practical demonstration of TCL

### Table Creation Script

```sql
-- Create the students table
CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    grade CHAR(1)
);

-- Insert initial data into students table
INSERT INTO students (name, grade) VALUES ('Alice', 'A'), ('Bob', 'B'), ('Charlie', 'C');
```

### TCL Demonstration Script

```sql
-- Start the transaction
START TRANSACTION;

-- Set a savepoint before any updates
SAVEPOINT before_updates;

-- Insert a new student
INSERT INTO students (name, grade) VALUES ('David', 'D');

-- Check the current state
SELECT * FROM students;

-- Set another savepoint after the first insert
SAVEPOINT after_first_insert;

-- Update a student's grade
UPDATE students SET grade = 'B' WHERE name = 'Alice';

-- Check the current state
SELECT * FROM students;

-- Intentional error (e.g., trying to insert a student with a duplicate ID)
-- Uncomment the following line to simulate an error
-- INSERT INTO students (student_id, name, grade) VALUES (1, 'Eve', 'E');

-- If an error occurs, rollback to the savepoint after the first insert
ROLLBACK TO after_first_insert;

-- Check the state after rollback
SELECT * FROM students;

-- Commit the transaction
COMMIT;

-- Final state check
SELECT * FROM students;
```

### Explanation

1. **Start the Transaction**: Begin the transaction with `START TRANSACTION;`.
2. **Create Savepoints**: Use `SAVEPOINT savepoint_name;` to create savepoints at various stages.
3. **Perform Operations**: Insert and update records in the `students` table.
4. **Simulate an Error**: An intentional error is commented out. Uncomment this line to simulate an error and see how rollback works.
5. **Rollback to Savepoint**: Rollback to a specific savepoint if an error occurs.
6. **Commit the Transaction**: Commit the transaction with `COMMIT;`.
7. **Check State**: Use `SELECT` statements to check the state of the `students` table at different points.

### Running the Script

You can run this script in a MySQL client (e.g., MySQL Workbench, phpMyAdmin) to see how savepoints work. Uncomment the intentional error line to see how the rollback to a savepoint works in practice. This example demonstrates the usage of savepoints in a simple and clear manner using the `students` table.
