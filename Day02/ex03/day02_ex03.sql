-- Allowed	
-- SQL Syntax Construction	generate_series(...)
-- Denied	
-- SQL Syntax Construction	NOT IN, IN, NOT EXISTS, EXISTS, UNION, EXCEPT, INTERSECT
-- 
-- Let's go back to Exercise #01, please rewrite your SQL using the CTE (Common Table Expression) pattern. 
-- Please go to the CTE part of your "day generator". The result should look similar to Exercise #01.
-- 
-- missing_date
-- 2022-01-03
-- 2022-01-04
-- 2022-01-05
-- ...
-- 


with visit_dates as (
    select visit_date 
    from person_visits
    where person_id = 1 or person_id = 2
), date_series AS (
    SELECT generate_series('2022-01-01'::date, '2022-01-10'::date, '1 day') AS missing_date
)
select missing_date::date
from date_series
left join visit_dates on missing_date = visit_date
where visit_date is null
order by missing_date asc