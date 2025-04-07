-- Denied	
-- SQL Syntax Construction	any type of JOINs
-- Find all menu identifiers that are not ordered by anyone. The result should be sorted by identifier. The sample output is shown below.
-- 
-- menu_id
-- 5
-- 10
-- ...
-- 

SELECT id as menu_id FROM menu
EXCEPT
SELECT person_order.menu_id FROM person_order
ORDER BY menu_id