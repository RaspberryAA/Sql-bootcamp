-- Find all pizza names (and corresponding pizzeria names using the menu table) ordered by Denis or Anna. Sort a result by both columns. The sample output is shown below.
-- 
-- pizza_name	pizzeria_name
-- cheese pizza	Best Pizza
-- cheese pizza	Pizza Hut
-- ...	...

select pizza_name, pizzeria.name as pizzeria_name
from person_order
left join menu on menu_id = menu.id
left join pizzeria on menu.pizzeria_id = pizzeria.id
left join person on person_id = person.id 
where person.name = 'Denis' or person.name = 'Anna'
order by pizza_name, pizzeria_name