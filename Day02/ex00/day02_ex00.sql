-- Denied	
-- SQL Syntax Construction	NOT IN, IN, NOT EXISTS, EXISTS, UNION, EXCEPT, INTERSECT

-- Write a SQL statement that returns a list of pizzerias with the corresponding rating 
-- value that have not been visited by people.

select name, rating 
from pizzeria
left join person_visits
on pizzeria.id = pizzeria_id
where pizzeria_id is null