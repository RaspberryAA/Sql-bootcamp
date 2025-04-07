-- Please write a SQL statement that returns aggregated information by person's address, 
-- the result of "Maximum Age - (Minimum Age / Maximum Age)" presented as a formula column, 
-- next is average age per address and the result of comparison between formula and average columns 
-- (in other words, if formula is greater than average, then True, otherwise False value).
-- 
-- The result should be sorted by address column. Please take a look at the example of output data below.
-- 
-- address	formula	average	comparison
-- Kazan	44.71	30.33	true
-- Moscow	20.24	18.5	true
-- ...	...	...	...
-- 

SELECT address, 
ROUND(MAX(age) - (MIN(age)::NUMERIC/MAX(age)),2) as formula, 
ROUND(AVG(age),2) as average, 
MAX(age) - (MIN(age)/MAX(age)) > AVG(age) as comparison
FROM person
GROUP BY address
ORDER BY address;