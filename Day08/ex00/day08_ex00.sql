-- Our knowledge way is incremental and linear therefore please be aware all changes that you made in Day03 during Exercises 07-13 and in Day04 during Exercise 07 should be on place 
-- 
-- Files to turn-in	day08_ex00.sql with comments for Session #1, Session #2 statements; screenshot of psql output for Session #1; screenshot of psql output for Session #2
--
-- Please use the command line for PostgreSQL database (psql) for this task. You need to check how your changes will be published to the database for other database users.
-- 
-- Actually, we need two active sessions (i.e. 2 parallel sessions in the command line).
-- 
-- Please provide a proof that your parallel session can’t see your changes until you will make a COMMIT;
-- 
-- See the steps below.
-- 
-- Session #1
-- 
-- Update of rating for "Pizza Hut" to 5 points in a transaction mode.
-- Check that you can see a changes in session #1.
-- Session #2
-- 
-- Check that you can’t see a changes in session #2.
-- Session #1
-- 
-- Publish your changes for all parallel sessions.
-- Session #2
-- 
-- Check that you can see a changes in session #2.
-- So, take a look on example of our output for Session #2.
-- 
-- pizza_db=> select * from pizzeria where name  = 'Pizza Hut';
-- id |   name    | rating
--+-----------+--------
-- 1 | Pizza Hut |    4.6
-- (1 row)
-- 
-- pizza_db=> select * from pizzeria where name  = 'Pizza Hut';
-- id |   name    | rating
--+-----------+--------
-- 1 | Pizza Hut |      5
-- (1 row)
-- You can see that the same query returns different results because the first query was run before publishing in Session#1 and the second query was run after Session#1 was finished.
-- 
-- 

 
SESSION #1
begin; 
update pizzeria set rating = 5 where name = 'Pizza Hut';
select * from pizzeria where name  = 'Pizza Hut';

-- SESSION #2
select * from pizzeria where name  = 'Pizza Hut';

-- SESSION #1
commit;

-- SESSION #2
select * from pizzeria where name  = 'Pizza Hut';