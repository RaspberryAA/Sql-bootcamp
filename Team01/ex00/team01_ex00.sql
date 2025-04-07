-- Let's take a look at the data sources and the first logical data layer (ODS — Operational Data Store) in the DWH.
-- 
-- User table Definition (in a Green Source Database):
-- 
-- Column Name	Description
-- ID	Primary Key
-- name	Name of User
-- lastname	Last name of User
-- Currency table Definition (in a Red Source Database):
-- 
-- Column Name	Description
-- ID	Primary Key
-- name	Currency Name
-- rate_to_usd	Ratio to USD currency
-- Balance table Definition (in a Blue Source Database):
-- 
-- Column Name	Description
-- user_id	"Virtual Foreign Key" to User table from other source
-- money	Amount of money
-- type	Type of balance (can be 0,1,...)
-- currency_id	"Virtual Foreign Key" to Currency table from other source
-- Green, Red, and Blue databases are independent data sources and fit the microservice pattern. This means that there is a high risk of data anomalies (see below).
-- 
-- Tables are not in data consistency. It means that there is a User, but there are no rows in the Balance table, or vice versa, there is a Balance, but there are no rows in the User table. The same situation exists between the Currency and Balance tables. (In other words, there are no explicit foreign keys between them).
-- Possible NULL values for Name and Lastname in the User table.
-- All tables are working under OLTP (OnLine Transactional Processing) SQL traffic. It means that there is a current state of data at a time, historical changes are not stored for each table.
-- These 3 listed tables are data sources for the tables with similar data models in the DWH area.
-- 
-- User table Definition (in a DWH Database):
-- 
-- Column Name	Description
-- ID	Primary Key
-- name	Name of User
-- lastname	Last name of User
-- Currency table Definition (in a DWH Database):
-- 
-- Column Name	Description
-- ID	Mocked Primary Key
-- name	Currency Name
-- rate_to_usd	Ratio to USD currency
-- updated	Timestamp of event from source database
-- Mocked Primary Key means that there are duplicates with the same ID because a new updated attribute has been added that changes our Relational Model to Temporal Relational Model.
-- 
-- Please take a look at the data sample for currency "EUR" below. This example is based on the SQL statement:
-- 
-- SELECT *
-- FROM Currency
-- WHERE name = ‘EUR’
-- ORDER BY updated DESC;
-- ID	name	rate_to_usd	updated
-- 100	EUR	0.9	03.03.2022 13:31
-- 100	EUR	0.89	02.03.2022 12:31
-- 100	EUR	0.87	02.03.2022 08:00
-- 100	EUR	0.9	01.03.2022 15:36
-- ...	...	...	...
-- Balance table Definition (in a DWH Database):
-- 
-- Column Name	Description
-- user_id	"Virtual Foreign Key" to User table from other source
-- money	Amount of money
-- type	Type of balance (can be 0,1,...)
-- currency_id	"Virtual Foreign Key" to Currency table from other source
-- updated	Timestamp of event from source database
-- Please take a look at the data sample. This example is based on the SQL statement:
-- 
-- SELECT *
-- FROM Balance
-- WHERE user_id = 103
-- ORDER BY type, updated DESC;
-- user_id	money	type	currency_id	updated
-- 103	200	0	100	03.03.2022 12:31
-- 103	150	0	100	02.03.2022 11:29
-- 103	15	0	100	03.03.2022 08:00
-- 103	-100	1	102	01.03.2022 15:36
-- 103	2000	1	102	12.12.2021 15:36
-- ...	...	...	...	...
-- All tables in the DWH inherit all anomalies from the source tables.
-- 
-- Tables are not in data consistency.
-- Possible NULL values for Name and Lastname in the User table.
-- Please write an SQL statement that returns the total volume (sum of all money) of transactions from the user balance aggregated by user and balance type. Note that all data should be processed, including data with anomalies. Below is a table of result columns and the corresponding calculation formula.
-- 
-- Output Column	Formula (pseudocode)
-- name	source: user.name if user.name is NULL then return not defined value
-- lastname	source: user.lastname if user.lastname is NULL then return not defined value
-- type	source: balance.type
-- volume	source: balance.money need to summarize all money “movements”
-- currency_name	source: currency.name if currency.name is NULL then return not defined value
-- last_rate_to_usd	source: currency.rate_to_usd. take a last currency.rate_to_usd for corresponding currency if currency.rate_to_usd is NULL then return 1
-- total_volume_in_usd	source: volume , last_rate_to_usd. make a multiplication between volume and last_rate_to_usd
-- See a sample of the output data below. Sort the result by User Name in descending order, and then by User Lastname and Balance type in ascending order.
-- 
-- name	lastname	type	volume	currency_name	last_rate_to_usd	total_volume_in_usd
-- Петр	not defined	2	    203	    not defined	    1	                203
-- Иван	Иванов	    1	    410	    EUR	            0.9	                369
-- ...	...	...	...	...	...	...


WITH last_rate_to_usd AS ( -- Таблица с свежим курсом валют в USD.
    -- id  | currency_name | last_rate 
    SELECT
        currency.id,
        currency.name AS currency_name,
        (SELECT rate_to_usd
         FROM currency
         -- Определяем самый актуальный курс валюты для каждой валюты
         WHERE currency.updated IN (SELECT MAX(currency.updated) FROM currency)
         -- которая использована в балансе.
         AND id = balance.currency_id
         ) AS last_rate
    FROM currency
        JOIN balance ON currency.id = balance.currency_id
    GROUP BY currency.id, currency_name, balance.currency_id
),
 total_volume_in_all_currencies AS ( -- Таблица с сумми операций аггрегирован по id, типу, валюте.
    -- user_id | type | currency_id | volume
    SELECT
        balance.user_id,
        balance.type,
        balance.currency_id,
        -- Чтобы корректно обрабатывать возможные NULL значения в поле 
        -- balance.money и суммировать значения в колонке, подставляем 0.
        SUM(COALESCE(balance.money, 0)) AS volume
    FROM balance
    GROUP BY balance.user_id, balance.type, balance.currency_id
)
SELECT -- Результирующая таблица для вывода обзего объема (суммы всех деняк) 
    -- по транзакциям из пользовательского баланса агрегированная по >>> user , balance , type.
    -- name  |  lastname   | type | volume | currency_name | last_rate_to_usd | total_volume_in_usd
    -- источник: user.name. Если user.name NULL, то возвращаем значение по умолчанию
    COALESCE("user".name, 'not defined') AS name,
    -- источник: user.lastname. Если user.lastname NULL, то возвращаем значение по умолчанию
    COALESCE("user".lastname, 'not defined') AS lastname,
    -- источник: balance.type
    total_volume_in_all_currencies.type,
    -- источник: balance.money. Нужно суммировать все денежные "движения"
    total_volume_in_all_currencies.volume,
    -- источник: currency.name. Если currency.name NULL, то возвращаем значение по умолчанию
    COALESCE(last_rate_to_usd.currency_name, 'not defined') AS currency_name,
    -- источник: currency.rate_to_usd. Берем последний курс валюты в USD для соответствующей валюты
    -- если currency.rate_to_usd NULL, то возвращаем 1
    COALESCE(last_rate_to_usd.last_rate, 1) AS last_rate_to_usd,
    -- источник: volume и last_rate_to_usd. Умножаем volume на last_rate_to_usd
    total_volume_in_all_currencies.volume * COALESCE(last_rate_to_usd.last_rate, 1) AS total_volume_in_usd
FROM total_volume_in_all_currencies
    -- Здесь используется LEFT JOIN, чтобы сохранить все 
    -- записи из таблицы total_volume_in_all_currencies даже если для них не
    -- будет найдено соответствующих записей в таблицах "user" или last_rate_to_usd.
    LEFT JOIN "user" ON "user".id = total_volume_in_all_currencies.user_id
    LEFT JOIN last_rate_to_usd ON total_volume_in_all_currencies.currency_id = last_rate_to_usd.id
-- Cортируем результат по имени пользователя в порядке убывания, а затем 
-- по фамилии пользователя и типу баланса в порядке возрастания.
ORDER BY name DESC, lastname, total_volume_in_all_currencies.type;
