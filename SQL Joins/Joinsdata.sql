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

