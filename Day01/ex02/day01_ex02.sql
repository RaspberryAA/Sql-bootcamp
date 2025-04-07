-- Denied	
-- SQL Syntax Construction	DISTINCT, GROUP BY, HAVING, any type of JOINs

-- Write an SQL statement that returns unique pizza names from the
--  menu table and sorts them by the pizza_name column in descending order.
select pizza_name 
from menu
UNION
select pizza_name 
from menu
order by pizza_name desc