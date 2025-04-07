-- Find complete information about all possible pizzeria names and prices to get mushroom or pepperoni pizza.
--  Then sort the result by pizza name and pizzeria name. The result of the sample data is shown below 
-- (please use the same column names in your SQL statement).
-- 
-- pizza_name	pizzeria_name	price
-- mushroom pizza	Dominos	1100
-- mushroom pizza	Papa Johns	950
-- pepperoni pizza	Best Pizza	800
-- ...	...	...
-- 

select pizza_name, pizzeria.name as pizzeria_name, price
from menu
left join pizzeria on pizzeria_id = pizzeria.id
where pizza_name = 'mushroom pizza' or pizza_name = 'pepperoni pizza'
order by pizza_name, pizzeria_name