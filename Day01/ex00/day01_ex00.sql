-- Please write a SQL statement that returns the menu identifier and pizza names from the menu table and the person identifier 
-- and person name from the person table in one global list (with column names as shown in the example below) ordered by object_id and then by object_name columns.
-- 
-- object_id	object_name
-- 1	        Anna
-- 1	        cheese pizza
-- ...	        ...

select id as object_id, name as object_name 
from person 
union
select id as object_id, pizza_name as object_name 
from menu
order by object_id, object_name
