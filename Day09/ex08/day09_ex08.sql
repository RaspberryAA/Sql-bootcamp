-- Write an SQL or pl/pgsql function fnc_fibonacci (it's up to you) that has an input parameter pstop of type integer (default is 10)
-- and the function output is a table of all Fibonacci numbers less than pstop.
-- 
-- To check yourself and call a function, you can make a statement like the one below.
-- 
-- select * from fnc_fibonacci(100);
-- select * from fnc_fibonacci();


CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop bigint default 10)
RETURNS TABLE("Fibonacci numbers less than pstop" bigint) AS $$
    WITH RECURSIVE fibonacci AS (
    SELECT  
        0 AS fib_1, 
        1 AS fib_2
    UNION ALL
    SELECT 
        fib_2, 
        fib_1 + fib_2
    FROM fibonacci
    WHERE fib_2 < pstop
)
SELECT fib_1 AS num
FROM fibonacci;
$$ LANGUAGE sql;

select * from fnc_fibonacci(100);
select * from fnc_fibonacci();