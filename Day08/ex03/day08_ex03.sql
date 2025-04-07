-- Files to turn-in	day08_ex03.sql with comments for Session #1, Session #2 statements; screenshot of psql output for Session #1; screenshot of psql output for Session #2

-- Please use the command line for PostgreSQL database (psql) for this task. You need to check how your changes will be published to the database for other database users.
-- 
-- Actually, we need two active sessions (i.e. 2 parallel sessions in the command line).
-- 
-- Let's check one of the famous "Non-Repeatable Reads" database patterns, but under the READ COMMITTED isolation level. 
-- You can see a graphical representation of this anomaly on a picture. The horizontal red line represents the final result after all sequential steps for both Sessions.
-- Please check a rating for "Pizza Hut" in a transaction mode for Session #1 and then make an UPDATE of the rating to a value of 3.6 in Session #2 
-- (in the same order as in the picture).

-- SESSION #1
begin transaction isolation level read committed; 

-- SESSION #2
begin transaction isolation level read committed;

-- SESSION #1
select * from pizzeria where name  = 'Pizza Hut';

-- SESSION #2
update pizzeria set rating = 3.6 where name = 'Pizza Hut';
commit;

-- SESSION #1
select * from pizzeria where name  = 'Pizza Hut';
commit;
select * from pizzeria where name  = 'Pizza Hut';

-- SESSION #2
select * from pizzeria where name  = 'Pizza Hut';