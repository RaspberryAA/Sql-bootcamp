-- Denied	
-- SQL Syntax Construction	IN, any types of JOINs

-- Write a select statement that returns the names of people (based on an internal query in the SELECT clause) 
-- who placed orders for the menu with identifiers 13, 14, and 18, 
-- and the date of the orders should be January 7, 2022. 

-- Please take a look at the pattern of internal query.

-- SELECT 
    -- (SELECT ... ) AS NAME  -- this is an internal query in a main SELECT clause
-- FROM ...
-- WHERE ...
-- 

SELECT 
    (SELECT name FROM person where id = person_id) AS NAME
FROM person_order 
WHERE (menu_id = 13 OR menu_id = 14 OR menu_id = 18) AND order_date = '2022-01-07';