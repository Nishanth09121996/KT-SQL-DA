-- Use functions_sample

Use functions_sample;

-- Create the "us_customer" table
CREATE TABLE us_customer (
    Name VARCHAR(255) NOT NULL
);

-- Insert records into the "us_customer" table
INSERT INTO us_customer (Name) VALUES
    ('John Smith'),
    ('Jane Doe'),
    ('Michael Johnson'),
    ('Emily Davis'),
    ('Neha Sharma'),
    ('Sneha Kapoor'),
    ('William Brown');

-- Create the "ind_customer" table
CREATE TABLE ind_customer (
    Name VARCHAR(255) NOT NULL
);

-- Insert records into the "ind_customer" table
INSERT INTO ind_customer (Name) VALUES
    ('Amit Patel'),
    ('Neha Sharma'),
    ('Rajesh Singh'),
    ('Sneha Kapoor'),
    ('Vikram Gupta');
