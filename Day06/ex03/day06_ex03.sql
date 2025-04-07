-- Actually, we need to improve data consistency from one side and performance tuning from the other side. 
-- Please create a multi-column unique index (named idx_person_discounts_unique) that prevents duplicates of the person and pizzeria identifier pairs.
-- 
-- After creating a new index, please provide any simple SQL statement that shows proof of the index usage (using EXPLAIN ANALYZE). The proof example is below:
-- 
-- ...
-- Index Scan using idx_person_discounts_unique on person_discounts
-- ...
-- 

CREATE UNIQUE INDEX idx_person_discounts_unique ON person_discounts (person_id, pizzeria_id);
SET enable_seqscan TO OFF;
EXPLAIN ANALYZE SELECT person.name, menu.pizza_name, price, FLOOR(price - price*discount/100) as discount_price, pizzeria.name
FROM person_order
JOIN menu ON  menu.id = menu_id
JOIN person ON person.id = person_id
JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
JOIN person_discounts ON person_discounts.person_id = person_order.person_id
WHERE person_order.person_id = person_discounts.person_id AND menu.pizzeria_id = person_discounts.pizzeria_id
ORDER BY person.name, pizza_name;