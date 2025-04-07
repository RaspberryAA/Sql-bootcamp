-- As you recall, we created 2 database views to separate data from the person tables by gender attribute.
--  Please define 2 SQL functions (note, not pl/pgsql functions) with the names:
-- 
-- fnc_persons_female (should return female persons),
-- fnc_persons_male (should return male persons).
-- To check yourself and call a function, you can make a statement like this (Amazing! You can work with a function like a virtual table!):
-- 
-- SELECT *
-- FROM fnc_persons_male();
-- 
-- SELECT *
-- FROM fnc_persons_female();

create or replace function fnc_persons_female()
RETURNS TABLE(id bigint,name varchar,age integer,gender varchar,address varchar ) AS $$
    SELECT * FROM person WHERE person.gender = 'female';    
$$ LANGUAGE sql;

create or replace function fnc_persons_male()
RETURNS TABLE(id bigint,name varchar,age integer,gender varchar,address varchar ) AS $$
    SELECT * FROM person WHERE person.gender = 'male';    
$$ LANGUAGE sql;

SELECT *
FROM fnc_persons_male();

SELECT *
FROM fnc_persons_female();