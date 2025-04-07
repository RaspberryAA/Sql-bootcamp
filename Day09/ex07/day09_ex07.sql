-- Please write an SQL or pl/pgsql function func_minimum (it is up to you) that has an input parameter that 
-- is an array of numbers and the function should return a minimum value.
-- 
-- To check yourself and call a function, you can make a statement like the one below.
-- 
-- SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);

CREATE OR REPLACE FUNCTION func_minimum(arr NUMERIC[])
RETURNS NUMERIC AS $$
    SELECT MIN(value) FROM UNNEST(arr) AS value;
$$ LANGUAGE sql;

SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);