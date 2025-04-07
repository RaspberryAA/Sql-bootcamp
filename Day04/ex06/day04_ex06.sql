-- Please create a Materialized View mv_dmitriy_visits_and_eats (with data included) based on the SQL statement 
-- that finds the name of the pizzeria where Dmitriy visited on January 8, 2022 and could eat pizzas 
--  less than 800 rubles (this SQL can be found at Day #02 Exercise #07).
-- 
-- To check yourself, you can write SQL to the Materialized View mv_dmitriy_visits_and_eats and compare the results with your previous query.


CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS 
select pizzeria.name
from person_visits
join person on person_id = person.id
join menu on person_visits.pizzeria_id = menu.pizzeria_id
join pizzeria on menu.pizzeria_id = pizzeria.id
where person.name = 'Dmitriy' and visit_date = '2022-01-08' and menu.price < 800;