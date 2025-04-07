-- Looks like 2 functions from Exercise 04 need a more generic approach. 
-- Please remove these functions from the database before proceeding. Write a generic SQL function (note, not pl/pgsql-function) called fnc_persons. 
-- This function should have an IN parameter pgender with the default value = 'female'.
-- 
-- To check yourself and call a function, you can make a statement like this (Wow! You can work with a function like with a virtual table, but with more flexibility!):
-- 
-- select *
-- from fnc_persons(pgender := 'male');
-- 
-- select *
-- from fnc_persons();


DROP FUNCTION fnc_persons_female;
DROP FUNCTION fnc_persons_male;

create or replace function fnc_persons(pgender varchar default 'female')
RETURNS TABLE(id bigint,name varchar,age integer,gender varchar,address varchar ) AS $$
    SELECT * FROM person WHERE person.gender = pgender;    
$$ LANGUAGE sql;

select *
from fnc_persons(pgender := 'male');

select *
from fnc_persons();