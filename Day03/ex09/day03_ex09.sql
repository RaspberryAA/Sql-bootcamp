-- Denied	
-- SQL Syntax Pattern	Don’t use direct numbers for identifiers of Primary Key and pizzeria
-- Please record new visits to Domino's restaurant by Denis and Irina on February 24, 2022. 
-- 

INSERT INTO person_visits
VALUES (
    (SELECT MAX(id) + 1 FROM person_visits),
    (SELECT id FROM person WHERE name = 'Denis'), 
    (SELECT id FROM pizzeria WHERE name = 'Dominos'),
    '2022-02-24'
),(
    (SELECT MAX(id) + 2 FROM person_visits),
    (SELECT id FROM person WHERE name = 'Irina'), 
    (SELECT id FROM pizzeria WHERE name = 'Dominos'),
    '2022-02-24'
)