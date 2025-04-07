-- Files to turn-in	day08_ex02.sql with comments for Session #1, Session #2 statements; screenshot of psql output for Session #1; screenshot of psql output for Session #2


-- Please use the command line for PostgreSQL database (psql) for this task. You need to check how your changes will be published to the database for other database users.
-- 
-- Actually, we need two active sessions (i.e. 2 parallel sessions in the command line).
-- 
-- Let's examine one of the famous "Lost Update Anomaly" database patterns, but under the REPEATABLE READ isolation level. 
-- You can see a graphical representation of this anomaly on a picture. Horizontal red line means the final results after all sequential steps for both Sessions.
-- Please check a rating for "Pizza Hut" in a transaction mode for both sessions and then make an UPDATE of the rating to a value of 4 in Session #1 
-- and make an UPDATE of the rating to a value of 3.6 in Session #2 (in the same order as in the picture).


-- SESSION #1
begin transaction isolation level repeatable read; 

-- SESSION #2
begin transaction isolation level repeatable read;

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