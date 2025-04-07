-- Please make a select statement that returns the person identifiers (without duplicates)
--  who visited pizzerias in a period from January 6, 2022 to January 9, 2022 (including all days)
--  or visited pizzerias with identifier 2. Also include ordering clause by person identifier in descending mode.
-- 

SELECT DISTINCT id
FROM person
WHERE id IN (
    SELECT person_id
    FROM person_visits
    WHERE visit_date BETWEEN '2022-01-06 00:00:00' AND '2022-01-09 23:59:59' 
)
OR id IN(
    SELECT person_id
    FROM person_visits
    WHERE pizzeria_id = 2 
)
ORDER BY id DESC;