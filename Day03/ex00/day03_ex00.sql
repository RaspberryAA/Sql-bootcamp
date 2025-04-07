-- Please write a SQL statement that returns a list of pizza names, pizza prices, pizzeria names, 
-- and visit dates for Kate and for prices ranging from 800 to 1000 rubles. Please sort by pizza, price,
--  and pizzeria name. See a sample of the data below.
-- 
-- pizza_name	price	pizzeria_name	visit_date
-- cheese pizza	950	DinoPizza	2022-01-04
-- pepperoni pizza	800	Best Pizza	2022-01-03
-- pepperoni pizza	800	DinoPizza	2022-01-04
-- ...	...	...	...
-- 
SELECT pizza_name, price, pizzeria.name as pizzeria_name, visit_date
FROM person_visits
LEFT JOIN pizzeria ON pizzeria_id = pizzeria.id
LEFT JOIN menu ON pizzeria.id = menu.pizzeria_id
LEFT JOIN person on person_id = person.id
WHERE (price BETWEEN 800 AND 1000) AND person.name = 'Kate'
ORDER BY pizza_name, price, pizzeria_name