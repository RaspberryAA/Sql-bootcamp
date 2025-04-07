-- Denied	
-- SQL Syntax Pattern	Don’t use direct numbers for identifiers of Primary Key and pizzeria
-- Please register a new pizza with the name "sicilian pizza" (whose id should be calculated by the formula "maximum id value + 1") 
-- with the price of 900 rubles in the restaurant "Dominos" (please use internal query to get the identifier of the pizzeria). 

INSERT INTO menu 
VALUES (
    (SELECT MAX(id) + 1 FROM menu), 
    (SELECT id FROM pizzeria WHERE name = 'Dominos'),
    'sicilian pizza',
    '900'
)