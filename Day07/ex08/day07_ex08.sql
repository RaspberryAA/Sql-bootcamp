-- We know personal addresses from our data. 
-- Let's assume that this person only visits pizzerias in his city. 
-- Write a SQL statement that returns the address, the name of the pizzeria, and the amount of the person's orders. 
-- The result should be sorted by address and then by restaurant name. 
-- Please take a look at the sample output data below.
-- 
-- address	name	count_of_orders
-- Kazan	Best Pizza	4
-- Kazan	DinoPizza	4
-- ...	...	...
-- 

SELECT address, pizzeria.name as name, COUNT(*) as count_of_orders
FROM person_order
JOIN person on person_order.person_id = person.id
JOIN menu on menu_id = menu.id
JOIN pizzeria on pizzeria_id = pizzeria.id
GROUP BY address, pizzeria.name
ORDER BY address, name;