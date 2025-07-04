-- Please create a unique BTree index named idx_menu_unique on the menu table for pizzeria_id and pizza_name columns. 
-- Write and provide any SQL with proof (EXPLAIN ANALYZE) that index idx_menu_unique works.

CREATE UNIQUE INDEX idx_menu_unique ON menu (pizzeria_id, pizza_name);
SET enable_seqscan TO OFF;
EXPLAIN ANALYZE SELECT pizzeria_id, pizza_name FROM menu;