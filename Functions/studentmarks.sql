-- Create the "student" table
CREATE TABLE student_marks (
    id INT,
    name VARCHAR(255) NOT NULL,
    subject VARCHAR(255) NOT NULL,
    marks INT
);

-- Insert records into the "student" table
INSERT INTO student_marks (id, name, subject, marks) VALUES
    (1, 'Alice', 'Maths', 95),
    (1, 'Alice', 'English', 88),
    (1, 'Alice', 'Science', 92),    
    (2, 'Bob', 'Maths', 89),
    (2, 'Bob', 'English', 76),
    (2, 'Bob', 'Science', 97),    
    (3, 'Charlie', 'Maths', 78),
    (3, 'Charlie', 'English', 85),
    (3, 'Charlie', 'Science', 91),
    (4, 'David', 'Maths', 84),
    (4, 'David', 'English', 90),
    (4, 'David', 'Science', 94),    
    (5, 'Taylor', 'Maths', 88),
    (5, 'Taylor', 'English', 87),
    (5, 'Taylor', 'Science', 85);
