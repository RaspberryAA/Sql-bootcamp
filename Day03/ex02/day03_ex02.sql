-- Please use the SQL statement from Exercise #01 and display the names of pizzas from the
--  pizzeria that no one has ordered, including the corresponding prices. 
-- The result should be sorted by pizza name and price. The sample output data is shown below.
-- 
-- pizza_name	price	pizzeria_name
-- cheese pizza	700	Papa Johns
-- cheese pizza	780	DoDo Pizza
-- ...	...	...
-- 

WITH unordered AS (
    SELECT id FROM menu
    EXCEPT
    SELECT person_order.menu_id FROM person_order
)
SELECT pizza_name, price, pizzeria.name as pizzeria_name 
FROM unordered
JOIN menu ON menu.id = unordered.id
JOIN pizzeria on pizzeria_id = pizzeria.id
ORDER BY pizza_name, price