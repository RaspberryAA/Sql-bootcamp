-- Files to turn-in 
-- DDL for table creation with INSERTs of data; SQL DML statement

-- Allowed	
-- SQL Syntax Pattern	Recursive Query

-- There are 4 cities (a, b, c and d) and arcs between them with costs (or taxes). Actually, the cost is (a,b) = (b,a).
-- 
-- Please create a table with named nodes using structure {point1, point2, cost} and fill data based on a picture (remember there are direct and reverse paths between 2 nodes). 
-- Please write a SQL statement that returns all tours (aka paths) with minimum travel cost if we start from city "a". 
-- Remember, you need to find the cheapest way to visit all cities and return to your starting point. For example, the tour looks like a -> b -> c -> d -> a.
-- 
-- Below is an example of the output data. Please sort the data by total_cost and then by tour.
-- 
-- total_cost	tour
-- 80	{a,b,d,c,a}
-- ...	...
-- 

CREATE TABLE named_nodes (point1 varchar not null, point2 varchar not null, cost INTEGER NOT NULL);
INSERT INTO named_nodes VALUES ('a','b',10),
                               ('a','c',15),
                               ('a','d',20),
                               ('b','a',10),
                               ('b','c',35),
                               ('b','d',25),
                               ('c','a',15),
                               ('c','b',35),
                               ('c','d',30),
                               ('d','a',20),
                               ('d','b',25),
                               ('d','c',30);
                               
WITH RECURSIVE tours AS (
    SELECT 
        ARRAY[point1] AS tour,         -- Инициализация пути как массива с первой точкой
        point1,
        point2,
        cost,
        cost AS total_cost
    FROM named_nodes
    WHERE point1 = 'a'

    UNION

    SELECT 
        t.tour || nn.point1 AS tour,   -- Добавляем следующую точку в массив пути
        nn.point1,
        nn.point2,
        nn.cost,
        t.total_cost + nn.cost AS total_cost
    FROM named_nodes nn
    JOIN tours t ON nn.point1 = t.point2  -- Соединяем текущую точку с предыдущей
    WHERE NOT nn.point1 = ANY(t.tour)    -- Проверяем, что следующая точка не была посещена
)
SELECT 
    total_cost, 
    tour || point2 AS tour
FROM tours
WHERE point2 = 'a'                       -- Условие завершения пути: вернуться в 'a'
  AND array_length(tour, 1) = 4          -- Проверяем, что пройдены все 4 точки (без учёта возврата)
  AND total_cost = (                -------
    SELECT MIN(total_cost)               --
    FROM tours                           -- Подзапрос оставляющий только самые дешевые пути
    WHERE point2 = 'a'                   --
    AND array_length(tour, 1) = 4   -------
  )
ORDER BY total_cost, tour; 
