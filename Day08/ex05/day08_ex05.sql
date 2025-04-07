-- Files to turn-in	day08_ex05.sql with comments for Session #1, Session #2 statements; screenshot of psql output for Session #1; screenshot of psql output for Session #2


-- Please use the command line for PostgreSQL database (psql) for this task. You need to check how your changes will be published to the database for other database users.

-- Actually, we need two active sessions (i.e. 2 parallel sessions in the command line).

-- Let's check one of the famous "phantom reads" database patterns, but under the READ COMMITTED isolation level. 
-- You can see a graphical representation of this anomaly on a picture. The horizontal red line represents the final results after all sequential steps for both Sessions.	
-- Please summarize all ratings for all pizzerias in one transaction mode for Session #1 
-- and then make INSERT of the new restaurant 'Kazan Pizza' with rating 5 and ID=10 in Session #2 (in the same order as in the picture).




-- SESSION #1
begin transaction isolation level read committed; 

-- SESSION #2
begin transaction isolation level read committed;

-- SESSION #1
select sum(rating) from pizzeria;

-- SESSION #2
insert into pizzeria values (10,'Kazan Pizza', 5);
commit;

-- SESSION #1
select sum(rating) from pizzeria;
commit;
select sum(rating) from pizzeria;
-- SESSION #2
select sum(rating) from pizzeria;