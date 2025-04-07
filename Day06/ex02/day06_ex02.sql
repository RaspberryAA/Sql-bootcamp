-- Write a SQL statement that returns the orders with actual price and price with discount applied for each person in the corresponding pizzeria restaurant, sorted by person name and pizza name. Please see the sample data below.
-- 
-- name	    pizza_name	    price	discount_price	pizzeria_name
-- Andrey	cheese pizza	800	    624	            Dominos
-- Andrey	mushroom pizza	1100	858	            Dominos
-- ...	...	...	...	...
-- 

SELECT person.name, menu.pizza_name, price, FLOOR(price - price*discount/100) as discount_price, pizzeria.name
FROM person_order
JOIN menu ON  menu.id = menu_id
JOIN person ON person.id = person_id
JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
JOIN person_discounts ON person_discounts.person_id = person_order.person_id
WHERE person_order.person_id = person_discounts.person_id AND menu.pizzeria_id = person_discounts.pizzeria_id
ORDER BY person.name, pizza_name;