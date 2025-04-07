-- Create an SQL statement that returns all columns from the person_order table with rows whose identifier is an even number. 
-- The result must be ordered by the returned identifier.

select * from person_order
where id % 2 = 0
order by id;