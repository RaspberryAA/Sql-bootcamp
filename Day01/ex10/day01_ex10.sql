-- Please write an SQL statement that returns a list of the names of the people who ordered 
-- pizza from the corresponding pizzeria. The sample result (with named columns) is 
-- provided below and yes ... please make the ordering by 3 columns (person_name, pizza_name, pizzeria_name) 
-- in ascending mode.
-- 
-- person_name	pizza_name	pizzeria_name
-- Andrey	cheese pizza	Dominos
-- Andrey	mushroom pizza	Dominos
-- Anna	cheese pizza	Pizza Hut
-- ...	...	...
-- 

select person.name as person_name, menu.pizza_name, pizzeria.name as pizzeria_name
from person_order
join person on person_order.person_id = person.id
join menu on person_order.menu_id = menu.id
join pizzeria on menu.pizzeria_id = pizzeria.id 
order by person_name, pizza_name, pizzeria_name
