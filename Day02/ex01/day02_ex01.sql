-- Denied	
-- SQL Syntax Construction	NOT IN, IN, NOT EXISTS, EXISTS, UNION, EXCEPT, INTERSECT

-- Please write a SQL statement that returns the missing days from January 1 through January 10, 2022 
-- (including all days) for visits by people with identifiers 1 or 2 (i.e., days missed by both).
--  Please order by visit days in ascending mode. The sample data with column names is shown below.
-- 
-- missing_date
-- 2022-01-03
-- 2022-01-04
-- 2022-01-05
-- ...
-- 

select missing_date::date
from generate_series('2022-01-01'::date, '2022-01-10'::date, '1 day') as missing_date
left join  
    (select visit_date from person_visits
    where person_id = 1 or person_id = 2) on missing_date = visit_date
where visit_date is null
order by missing_date asc