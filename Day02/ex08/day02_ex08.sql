-- Please find the names of all men from Moscow or Samara who order either pepperoni or mushroom pizza (or both). Please sort the result by person names in descending order. The sample output is shown below.
-- 
-- name
-- Dmitriy
-- ...
-- 

select person.name
from person_order
join person on person_order.person_id = person.id
join menu on menu_id = menu.id 
where (address = 'Moscow' or address = 'Samara') and gender = 'male' and (pizza_name = 'pepperoni pizza' or pizza_name = 'mushroom pizza')
order by name desc