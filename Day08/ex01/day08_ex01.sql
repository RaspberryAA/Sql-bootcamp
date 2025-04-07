-- Files to turn-in	day08_ex01.sql with comments for Session #1, Session #2 statements; screenshot of psql output for Session #1; screenshot of psql output for Session #2
-- Please use the command line for PostgreSQL database (psql) for this task. You need to check how your changes will be published to the database for other database users.
-- 
-- Actually, we need two active sessions (i.e. 2 parallel sessions in the command line).
-- 
-- Before running a task, make sure you are at a standard isolation level in your database. Just run the following statement SHOW TRANSACTION ISOLATION LEVEL; and the result should be "read committed".
-- 
-- If not, please set the read committed isolation level explicitly on a session level.
-- 
-- Let's examine one of the famous "Lost Update Anomaly" database patterns. You can see a graphical representation of this anomaly on a picture. The horizontal red line represents the final results after all the sequential steps for both Sessions.	D08_06
-- Please check a rating for "Pizza Hut" in a transaction mode for both sessions and then make an UPDATE of the rating to a value of 4 in Session #1 and make an UPDATE of the rating to a value of 3.6 in Session #2 (in the same order as in the picture).

-- SESSION #1
begin; 

-- SESSION #2
begin;

-- SESSION #1
select * from pizzeria where name  = 'Pizza Hut';

-- SESSION #2
select * from pizzeria where name  = 'Pizza Hut';

-- SESSION #1
update pizzeria set rating = 4 where name = 'Pizza Hut';

-- SESSION #2
update pizzeria set rating = 3.6 where name = 'Pizza Hut';

-- SESSION #1
commit;

-- SESSION #2
commit;

-- SESSION #1
select * from pizzeria where name  = 'Pizza Hut';

-- SESSION #2
select * from pizzeria where name  = 'Pizza Hut';