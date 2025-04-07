-- Let's go back to Exercise #03 and modify our SQL statement to return person names instead 
-- of person identifiers and change the order by action_date in ascending mode and then by person_name 
-- in descending mode. Take a look at the sample data below.
-- 
-- action_date	person_name
-- 2022-01-01	Irina
-- 2022-01-01	Anna
-- 2022-01-01	Andrey
-- ...	...
-- 

select action_date, (select name from person where id = person_id) as person_name
from(
select order_date as action_date, person_id
from person_order
intersect
select visit_date as action_date, person_id
from person_visits
)
order by action_date, person_name desc