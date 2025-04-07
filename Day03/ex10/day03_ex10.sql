-- Denied	
-- SQL Syntax Pattern	Don’t use direct numbers for identifiers of Primary Key and pizzeria
-- Please register new orders from Denis and Irina on February 24, 2022 for the new menu with "sicilian pizza". 

INSERT INTO person_order
VALUES (
    (SELECT MAX(id) + 1 FROM person_order),
    (SELECT id FROM person WHERE name = 'Denis'), 
    (SELECT id FROM menu WHERE pizza_name = 'sicilian pizza'),
    '2022-02-24'
),(
    (SELECT MAX(id) + 2 FROM person_order),
    (SELECT id FROM person WHERE name = 'Irina'), 
    (SELECT id FROM menu WHERE pizza_name = 'sicilian pizza'),
    '2022-02-24'
)