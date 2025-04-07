-- Write an SQL statement that returns the order date from the person_order table 
-- and the corresponding person name (name and age are formatted as in the data sample below) 
-- who made an order from the person table. Add a sort by both columns in ascending order.
-- 
-- order_date	person_information
-- 2022-01-01	Andrey (age:21)
-- 2022-01-01	Andrey (age:21)
-- 2022-01-01	Anna (age:16)
-- ...	...
-- 
select order_date, CONCAT (name, ' (age:', age,')' ) AS person_information
from person_order
join person
on person_order.person_id = person.id
order by order_date, person_information