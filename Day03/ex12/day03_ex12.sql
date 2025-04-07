-- Allowed	
-- SQL Syntax Construction	generate_series(...)
-- SQL Syntax Patten	Please use “insert-select” pattern
-- INSERT INTO ... SELECT ...	
-- Denied	
-- SQL Syntax Patten	- Don’t use direct numbers for identifiers of Primary Key, and menu
-- Don’t use window functions like ROW_NUMBER( )
-- Don’t use atomic INSERT statements |

-- Please register new orders of all persons for "greek pizza" on February 25, 2022. 


INSERT INTO person_order
SELECT (SELECT MAX(id) FROM person_order) + gs,
person.id,
(SELECT id FROM menu WHERE pizza_name = 'greek pizza'),
'2022-02-25' 
FROM generate_series(1, (SELECT COUNT(*) FROM person)) AS gs
JOIN person ON person.id = gs