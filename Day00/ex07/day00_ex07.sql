-- Let's apply data intervals to the person table. Please make an SQL statement that returns the identifiers of a person, the person's names, and the interval of the person's ages (set a name of a new calculated column as 'interval_info') based on the pseudo code below.
-- 
-- if (age >= 10 and age <= 20) then return 'interval #1'
-- else if (age > 20 and age < 24) then return 'interval #2'
-- else return 'interval #3'
-- And yes... please sort a result by ‘interval_info’ column in ascending mode.

select id, name, 
case
    when age between 10 and 20 then 'interval #1'
    when age between 20 and 24 then 'interval #2'
    else 'interval #3'
end as interval_info
from person 
order by interval_info asc;