-- Denied	
-- SQL Syntax Construction	any types of JOINs

-- Please make a select statement that returns person names and pizzeria names based on the person_visits table with a visit date in a period from January 07 to January 09, 2022 (including all days) (based on an internal query in the `FROM' clause).
-- 
-- Please take a look at the pattern of the final query.
-- 
-- SELECT (...) AS person_name ,  -- this is an internal query in a main SELECT clause
        -- (...) AS pizzeria_name  -- this is an internal query in a main SELECT clause
-- FROM (SELECT … FROM person_visits WHERE …) AS pv -- this is an internal query in a main FROM clause
-- ORDER BY ...
-- Please add a ordering clause by person name in ascending mode and by pizzeria name in descending mode.

SELECT (SELECT name FROM person where id = person_id) AS person_name ,  -- this is an internal query in a main SELECT clause
        (select name from pizzeria where id = pizzeria_id) AS pizzeria_name  -- this is an internal query in a main SELECT clause
FROM (SELECT * FROM person_visits WHERE visit_date between '2022-01-07' and '2022-01-09') AS pv -- this is an internal query in a main FROM clause

order by person_name, pizzeria_name desc;