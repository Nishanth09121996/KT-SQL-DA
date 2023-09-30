-- Join Syntax

-- select * from
-- Table_A as A
-- (JOIN TYPE )LEFT,RIGHT,FULL Table_B  As B
-- ON Condition A.COLNAME = B.COLNAME
-- Inner Join


select * from joins_sample.table_left;

commit;

SELECT count( distinct l.id)
    -- L.Id AS Left_table_id,
--     R.Id AS right_table_id
FROM joins_sample.table_left L
JOIN joins_sample.table_right R ON L.Id = R.Id;


-- SELECT 
--   l.*
--   ,r.*
-- FROM joins_sample.table_left L
-- JOIN joins_sample.table_right R ON L.Id = R.Id;
-- 0	212	20:43:59	SELECT 
--      Id AS Left_table_id,
--      Id AS right_table_id
--  FROM joins_sample.table_left L
--  JOIN joins_sample.table_right R ON L.Id = R.Id
--  LIMIT 0, 20	Error Code: 1052. Column 'Id' in field list is ambiguous	0.000 sec

 truncate table joins_sample.table_right;
 insert into joins_sample.table_right values(3);
 
 truncate table joins_sample.table_left;
 insert into joins_sample.table_left values(1);
 commit;
 
 select * from joins_sample.table_right;
 
 
 commit;
-- Left Join  Macthed records ffrom left & right And Records in left Table 

SELECT
    L.Id AS Left_table_id,
    R.Id AS right_table_id
FROM joins_sample.table_left L
LEFT JOIN joins_sample.table_right R ON L.Id = R.Id;

-- Right Join

SELECT
    L.Id AS Left_table_id,
    R.Id AS right_table_id
FROM joins_sample.table_left L
RIGHT JOIN joins_sample.table_right R ON L.Id = R.Id;

-- Full Join

SELECT
    L.Id AS Left_table_id,
    R.Id AS right_table_id
FROM joins_sample.table_left L
CROSS JOIN joins_sample.Table_right R;

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

