-- Please change the price of "greek pizza" to -10% of the current value. 
UPDATE menu 
SET price = price * 0.9
WHERE pizza_name = 'greek pizza'