-- Find the names of all women who ordered both pepperoni and cheese pizzas (at any time and in any pizzerias). 
-- Make sure that the result is ordered by person's name. The sample data is shown below.
-- 
-- name
-- Anna
-- ...
-- 

with cheesers as (select person.name
from person_order
join person on person_order.person_id = person.id
join menu on menu_id = menu.id 
where gender = 'female' and pizza_name = 'cheese pizza'
), pepperinos as (
select person.name
from person_order
join person on person_order.person_id = person.id
join menu on menu_id = menu.id 
join cheesers on cheesers.name = person.name
where gender = 'female' and pizza_name = 'pepperoni pizza'
)
select cheesers.name from cheesers
join pepperinos on pepperinos.name = cheesers.name
order by name