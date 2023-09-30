-- Join Syntax

-- select * from
-- Table_A as A
-- (JOIN TYPE )LEFT,RIGHT,FULL Table_B  As B
-- ON Condition A.COLNAME = B.COLNAME
-- Inner Join

SELECT
    Table_left.Id AS Left_table_id,
    Table_right.Id AS right_table_id
FROM joins_sample.table_left L
JOIN joins_sample.table_right R ON L.Id = R.Id;

-- Left Join

SELECT
    Table_left.Id AS Left_table_id,
    Table_right.Id AS right_table_id
FROM joins_sample.table_left L
LEFT JOIN joins_sample.table_right R ON L.Id = R.Id;

-- Right Join

SELECT
    Table_left.Id AS Left_table_id,
    Table_right.Id AS right_table_id
FROM joins_sample.table_left L
RIGHT JOIN joins_sample.table_right R ON L.Id = R.Id;

-- Full Join

SELECT
    Table_left.Id AS Left_table_id,
    Table_right.Id AS right_table_id
FROM Table_left
CROSS JOIN Table_right;

-- Cross Join Type 2 

SELECT
    A.Id AS Left_table_id,
    B.Id AS right_table_id
FROM Table_left as A,table_right b;


-- Self Join 
SELECT
    A.Id AS Left_table_id,
    B.Id AS right_table_id
FROM Table_left as A
JOIN Table_left as B
ON A.id = B.id;

