-- Before proceeding, please write an SQL statement that returns pizzas and the corresponding pizzeria names. See the example result below (no sorting required).
-- 
-- pizza_name	pizzeria_name
-- cheese pizza	Pizza Hut
-- ...	...
-- Let's prove that your indexes work for your SQL. The sample proof is the output of the EXPLAIN ANALYZE command. 
-- Please take a look at the sample output of the command.
-- 
-- ...
-- ->  Index Scan using idx_menu_pizzeria_id on menu m  (...)
-- ...

SET enable_seqscan TO OFF;
EXPLAIN ANALYZE SELECT pizza_name, pizzeria.name as pizzeria_name FROM menu
JOIN pizzeria on pizzeria.id = pizzeria_id;