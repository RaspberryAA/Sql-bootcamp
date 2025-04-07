-- Before diving deeper into this task, please apply the following INSERT statements.
-- 
-- insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29'); insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');
-- 
-- Please write an SQL statement that returns all Users, all Balance transactions (in this task please ignore Currencies that do not have a key in the Currency table) with currency name and calculated value of the currency in USD for the next day.
-- 
-- Below is a table of result columns and the corresponding calculation formula.
-- 
-- Output Column	Formula (pseudocode)
-- name	source: user.name if user.name is NULL then return not defined value
-- lastname	source: user.lastname if user.lastname is NULL then return not defined value
-- currency_name	source: currency.name
-- currency_in_usd	involved sources: currency.rate_to_usd, currency.updated, balance.updated.Take a look at a graphical interpretation of the formula below.
-- T01_06
-- 
-- You need to find a nearest rate_to_usd of currency in the past (t1).
-- If t1 is empty (means no rates in the past), then find a nearest rate_to_usd of currency in the future (t2).
-- Use t1 OR t2 rate to calculate a currency in USD format.
-- See a sample of the output below. Sort the result by User Name in descending order and then by User Lastname and Currency name in ascending order.
-- 
-- name	lastname	currency_name	currency_in_usd
-- Иван	Иванов	    EUR	            150.1
-- Иван	Иванов	    EUR	            17
-- ...	...	...	...

SELECT COALESCE("user".name, 'not defined') AS name,
    COALESCE("user".lastname, 'not defined') AS lastname,
    currency.name AS currency_name,
        CASE 
            WHEN (balance.money * currency.rate_to_usd)::TEXT LIKE '%.%'
            THEN TRIM(TRAILING '.' FROM TRIM (TRAILING '0' FROM (balance.money * currency.rate_to_usd)::TEXT))::NUMERIC
            ELSE (balance.money * currency.rate_to_usd)
        END AS currency_in_usd
FROM balance
    LEFT JOIN "user" ON balance.user_id = "user".id
    JOIN currency ON
        (balance.currency_id = currency.id AND currency.updated = COALESCE(
            (SELECT MAX (currency_t1.updated)
                FROM currency as currency_t1
                WHERE currency.id = currency_t1.id AND balance.updated > currency_t1.updated
                GROUP BY currency_t1.id),
            (SELECT MIN (currency_t2.updated)
                FROM currency as currency_t2
                WHERE currency.id = currency_t2.id AND balance.updated < currency_t2.updated
                GROUP BY currency_t2.id)
        ))
ORDER BY name DESC, lastname, currency_name;