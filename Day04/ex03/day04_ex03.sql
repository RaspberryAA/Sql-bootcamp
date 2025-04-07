-- Write a SQL statement that returns missing days for people's visits in January 2022.
--  Use the v_generated_dates view for this task and sort the result by the missing_date column.
--  The sample data is shown below.
-- 
-- missing_date
-- 2022-01-11
-- 2022-01-12
-- ...
-- 

SELECT generated_date FROM v_generated_dates AS missing_date
WHERE generated_date NOT IN (SELECT visit_date FROM person_visits) 
ORDER BY 1;