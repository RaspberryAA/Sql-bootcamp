--  Our knowledge way is incremental and linear therefore please be aware that all changes you made in Day03 during Exercises 07-13 and in Day04 during Exercise 07 should be on place

-- Let's add a new business feature to our data model. Every person wants to see a personal discount and every business wants to be closer for customers.
-- 
-- Think about personal discounts for people from one side and pizza restaurants from the other. Need to create a new relational table (please set a name person_discounts) with the following rules.
-- 
-- Set id attribute like a Primary Key (please have a look at id column in existing tables and choose the same data type).
-- Set attributes person_id and pizzeria_id as foreign keys for corresponding tables (data types should be the same as for id columns in corresponding parent tables).
-- Please set explicit names for foreign key constraints using the pattern fk_{table_name}_{column_name}, for example fk_person_discounts_person_id.
-- Add a discount attribute to store a discount value in percent. Remember that the discount value can be a floating-point number (just use the numeric datatype). So please choose the appropriate datatype to cover this possibility.
-- 


create table person_discounts
( id bigint primary key ,
 person_id bigint not null ,
 pizzeria_id bigint not null ,
 discount numeric not null,
 constraint fk_person_discounts_person_id foreign key  (person_id) references person(id),
 constraint fk_person_discounts_pizzeria_id foreign key  (pizzeria_id) references pizzeria(id)
 );