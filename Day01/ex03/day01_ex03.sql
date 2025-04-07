-- Denied	
-- SQL Syntax Construction	any type of JOINs

-- Write an SQL statement that returns common rows for attributes order_date, 
-- person_id from the person_order table on one side and visit_date, 
-- person_id from the person_visits table on the other side (see an example below). 
-- In other words, let's find the identifiers of persons who visited and ordered a pizza on the same day. 
-- Actually, please add the order by action_date in ascending mode and then by person_id in descending mode.
-- 

select order_date as action_date, person_id
from person_order
intersect
select visit_date as action_date, person_id
from person_visits
order by action_date, person_id desc