-- Please create a pl/pgsql function fnc_person_visits_and_eats_on_date based on an SQL statement 
-- that will find the names of pizzerias that a person (IN pperson parameter with default value 'Dmitriy') 
-- visited and where he could buy pizza for less than the given amount in rubles (IN pprice parameter with default value 500) on the 
-- given date (IN pdate parameter with default value January 8, 2022).
-- 
-- To check yourself and call a function, you can make a statement like the one below.
-- 
-- select *
-- from fnc_person_visits_and_eats_on_date(pprice := 800);
-- 
-- select *
-- from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');


create or replace function fnc_person_visits_and_eats_on_date(
    pperson varchar default 'Dmitriy', 
    pprice bigint default 500, 
    pdate date default '2022-1-08')
RETURNS TABLE(name varchar) AS $$
BEGIN
    RETURN QUERY
    SELECT pizzeria.name 
    FROM person_visits
    join person on person_id = person.id
    join menu on person_visits.pizzeria_id = menu.pizzeria_id
    join pizzeria on menu.pizzeria_id = pizzeria.id
    WHERE person.name = pperson AND menu.price < pprice AND visit_date = pdate;
END; 
$$ LANGUAGE plpgsql;

select *
from fnc_person_visits_and_eats_on_date(pprice := 800);

select *
from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');