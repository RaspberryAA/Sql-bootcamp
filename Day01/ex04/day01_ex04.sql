-- Denied	
-- SQL Syntax Construction	any type of JOINs
-- Please write a SQL statement that returns a difference (minus) 
-- of person_id column values while saving duplicates between person_order table and person_visits
--  table for order_date and visit_date are for January 7, 2022.
-- 
select person_id
from person_order
where order_date = '2022-01-07'
except all
select person_id
from person_visits
where visit_date = '2022-01-07'

