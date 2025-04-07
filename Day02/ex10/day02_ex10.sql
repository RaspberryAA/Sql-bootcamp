-- Find the names of people who live at the same address. Make sure the result is sorted by 1st person's name,
--  2nd person's name, and shared address. The data sample is shown below.
--  Make sure your column names match the column names below.
-- 
-- person_name1	person_name2	common_address
-- Andrey	Anna	Moscow
-- Denis	Kate	Kazan
-- Elvira	Denis	Kazan
-- ...	...	...
-- 

select person1.name as person_name1, person2.name as person_name2, person1.address as common_address
from person as person1
    join person as person2 on person1.name != person2.name
    where person1.name != person2.name and person1.address = person2.address and person1.id > person2.id
order by person_name1, person_name2, common_address