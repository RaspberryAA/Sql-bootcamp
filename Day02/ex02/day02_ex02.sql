-- Denied	
-- SQL Syntax Construction	NOT IN, IN, NOT EXISTS, EXISTS, UNION, EXCEPT, INTERSECT
-- Please write an SQL statement that will return the entire list of names of people who visited (or did not visit) pizzerias during the period from January 1 to January 3, 2022 on one side and the entire list of names of pizzerias that were visited (or did not visit) on the other side. The data sample with the required column names is shown below. Please note the replacement value '-' for NULL values in the columns person_name and pizzeria_name. Please also add the order for all 3 columns.
-- 
-- person_name	visit_date	pizzeria_name
-- -	null	DinoPizza
-- -	null	DoDo Pizza
-- Andrey	2022-01-01	Dominos
-- Andrey	2022-01-02	Pizza Hut
-- Anna	2022-01-01	Pizza Hut
-- Denis	null	-
-- Dmitriy	null	-
-- ...	...	...

select COALESCE(person.name, '-') as person_name, visit_date, COALESCE(pizzeria.name, '-') as pizzeria_name 
    from (select * from person_visits
        where visit_date between '2022-01-01' and '2022-01-03') as visits_between_dates
    full join person on visits_between_dates.person_id = person.id
    full join pizzeria on visits_between_dates.pizzeria_id = pizzeria.id
order by person_name, visit_date, pizzeria_name