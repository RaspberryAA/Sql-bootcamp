-- Please find the name of the pizzeria Dmitriy visited on January 8, 2022 and could eat pizza for less than 800 rubles.

select pizzeria.name
from person_visits
join person on person_id = person.id
join menu on person_visits.pizzeria_id = menu.pizzeria_id
join pizzeria on menu.pizzeria_id = pizzeria.id
where person.name = 'Dmitriy' and visit_date = '2022-01-08' and menu.price < 800