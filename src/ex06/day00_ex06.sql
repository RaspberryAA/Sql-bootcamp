-- Denied	
-- SQL Syntax Construction	IN, any types of JOINs

-- Use the SQL construction from Exercise 05 and add a new calculated column (use column name ‘check_name’) with a check statement a pseudocode for this check is given below) in the SELECT clause.
-- 
-- if (person_name == 'Denis') then return true
    -- else return false

SELECT 
    (SELECT name FROM person where id = person_id) AS NAME,
    (select name = 'Denis' from person where id = person_id ) as check_name
FROM person_order 
WHERE (menu_id = 13 OR menu_id = 14 OR menu_id = 18) AND order_date = '2022-01-07';