-- Please write a SQL statement that returns all possible combinations between person and pizzeria tables,
--  and please set the order of the person identifier columns and then the pizzeria identifier columns. 
-- Please take a look at the sample result below. Please note that the column names may be different for you.
-- 
-- person.id	person.name	age	gender	address	pizzeria.id	pizzeria.name	rating
-- 1	        Anna	    16	female	Moscow	1	        Pizza Hut	    4.6
-- 1	        Anna	    16	female	Moscow	2	        Dominos	        4.3
-- ...	...	...	...	...	...	...	...
-- 

select *
from person, pizzeria
order by person.id, pizzeria.id