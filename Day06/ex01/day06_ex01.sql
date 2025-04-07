-- Actually, we have created a structure to store our discounts and we are ready to go further and fill our person_discounts table with new records.
-- 
-- So, there is a table person_order which stores the history of a person's orders. Please write a DML statement (INSERT INTO ... SELECT ...) that makes inserts new records into the person_discounts table based on the following rules.
-- 
-- Take aggregated state from person_id and pizzeria_id columns.
-- 
-- Calculate personal discount value by the next pseudo code:
-- 
-- if “amount of orders” = 1 then “discount” = 10.5 else if “amount of orders” = 2 then “discount” = 22 else “discount” = 30
-- 
-- To create a primary key for the person_discounts table, use the following SQL construct (this construct is from the WINDOW FUNCTION SQL section).
-- 
-- ... ROW_NUMBER( ) OVER ( ) AS id ...


INSERT INTO person_discounts (id, person_id, pizzeria_id, discount)
SELECT 
    ROW_NUMBER( ) OVER ( ) AS id, person_id, pizzeria_id,
    CASE 
        WHEN count(*) = 1 THEN 10.5
        WHEN count(*) = 2 THEN 22
    ELSE 30
    END AS discount
FROM person_order
JOIN menu on menu.id = person_order.menu_id
GROUP BY person_id, pizzeria_id;