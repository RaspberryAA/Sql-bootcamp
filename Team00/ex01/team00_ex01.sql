-- Please add a way to see additional rows with the most expensive cost to the SQL from the previous exercise.
--  Take a look at the sample data below. Please sort the data by total_cost and then by trip.
-- 
-- total_cost	tour
-- 80	{a,b,d,c,a}
-- ...	...
-- 95	{a,d,c,b,a}
-- 


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
  AND array_length(tour, 1) = 4       -- Проверяем, что пройдены все 4 точки (без учёта возврата)
ORDER BY total_cost, tour;