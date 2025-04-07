-- Files to turn-in	day08_ex07.sql with comments for Session #1, Session #2 statements; screenshot of psql output for Session #1; screenshot of psql output for Session #2

-- Please use the command line for PostgreSQL database (psql) for this task. You need to check how your changes will be published to the database for other database users.
-- 
-- Actually, we need two active sessions (i.e. 2 parallel sessions in the command line).
-- 
-- Let’s reproduce a deadlock situation in our database.
-- 
-- You can see a graphical representation of the deadlock situation in a picture. It looks like a "Christ-lock" between parallel sessions.	
-- Please write any SQL statement with any isolation level (you can use the default setting) on the table pizzeria to reproduce this deadlock situation.



-- SESSION #1
begin; 

-- SESSION #2
begin;

-- SESSION #1
update pizzeria set rating = 1 where id = 1;

-- SESSION #2
update pizzeria set rating = 1 where id = 2;

-- SESSION #1
update pizzeria set rating = 1 where id = 2;

-- SESSION #2
update pizzeria set rating = 1 where id = 1;

-- SESSION #1
commit;
-- SESSION #2
commit;