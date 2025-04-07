-- Please create a Database View v_price_with_discount that returns the orders of a person with person name, pizza name,
--  real price and calculated column discount_price (with applied 10% discount and satisfying formula price - price*0.1).
--  Please sort the result by person names and pizza names and convert the discount_price column to integer type.
--  See a sample result below.
-- 
-- name	pizza_name	price	discount_price
-- Andrey	cheese pizza	800	720
-- Andrey	mushroom pizza	1100	990
-- ...	...	...	...
-- 

CREATE VIEW v_price_with_discount AS 
SELECT person.name, pizza_name, price, (price - price * 0.1)::INTEGER AS discount_price
FROM person_order
JOIN person on person_id = person.id
JOIN menu on menu_id = menu.id
ORDER BY 1, 2;