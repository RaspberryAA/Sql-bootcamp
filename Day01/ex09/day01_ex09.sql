-- Write 2 SQL statements that return a list of pizzerias that 
-- have not been visited by people using IN for the first and EXISTS for the second.

select name 
from pizzeria
where id NOT IN (SELECT pizzeria_id from person_visits)
;
select name 
from pizzeria
where NOT EXISTS (SELECT pizzeria_id from person_visits where person_visits.pizzeria_id = pizzeria.id )  