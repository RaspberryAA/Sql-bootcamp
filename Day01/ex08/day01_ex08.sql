-- Denied	
-- SQL Syntax Construction	other type of JOINs
-- Please rewrite a SQL statement from Exercise #07 by using NATURAL JOIN construction.
--  The result must be the same like for Exercise #07.

select order_date, CONCAT (name, ' (age:', age,')' ) AS person_information
from person_order
natural join (
    select id as person_id, name, age
    from person
)
order by order_date, person_information