-- Please write a SQL statement that returns the number of orders, the average price, 
-- the maximum price and the minimum price for pizzas sold by each pizzeria restaurant.
-- The result should be sorted by pizzeria name. See the sample data below. 
-- Round the average price to 2 floating numbers.
-- 
-- name	        count_of_orders	average_price	max_price	min_price
-- Best Pizza	5	            780	            850	        700
-- DinoPizza	5	            880	            1000	    800
-- ...	...	...	...	...


SELECT pizzeria.name as name, count(*) as count_of_orders, ROUND(AVG(price), 2) as average_price, max(price) as max_price, min(price) as min_price
FROM person_order
JOIN menu on menu_id = menu.id
JOIN pizzeria on pizzeria_id = pizzeria.id
GROUP BY name
ORDER BY name;