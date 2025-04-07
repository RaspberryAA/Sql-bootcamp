-- Our knowledge way is incremental and linear therefore please be aware all changes that you made in Day03 during Exercises 07-13 and in Day04 during Exercise 07 should be on place

-- We want to be stronger with data, and we don't want to lose any change events. Let's implement an audit function for the incoming changes of INSERT. 
-- Please create a table person_audit with the same structure as a person table, but please add some additional changes. 
-- Take a look at the table below with descriptions for each column.
-- 
-- Column	        Type	                    Description
-- created	        timestamp with time zone	timestamp when a new event has been created. Default value is a current timestamp and NOT NULL
-- type_event	    char(1)	                    possible values I (insert), D (delete), U (update). Default value is ‘I’. NOT NULL. Add check constraint ch_type_event with possible values ‘I’, ‘U’ and ‘D’
-- row_id	        bigint	                    copy of person.id. NOT NULL
-- name	            varchar	                    copy of person.name (no any constraints)
-- age	            integer	                    copy of person.age (no any constraints)
-- gender	        varchar	                    copy of person.gender (no any constraints)
-- address	        varchar	                    copy of person.address (no any constraints)
-- Actually, let’s create a Database Trigger Function with the name fnc_trg_person_insert_audit that should process 
-- INSERT DML traffic and make a copy of a new row in the person_audit table.
-- 
-- Just a hint, if you want to implement a PostgreSQL trigger (please read it in PostgreSQL documentation), 
-- you need to create 2 objects: Database Trigger Function and Database Trigger.
-- 
-- So, please define a Database Trigger with the name trg_person_insert_audit with the following options:
-- 
-- trigger with "FOR EACH ROW" option;
-- trigger with "AFTER INSERT";
-- trigger calls fnc_trg_person_insert_audit trigger function.
-- When you are done with the trigger objects, please issue an INSERT statement into the person table. 
-- INSERT INTO person(id, name, age, gender, address) VALUES (10,'Damir', 22, 'male', 'Irkutsk');

create table person_audit( 
    created timestamp with time zone not null,
    type_event char(1) DEFAULT 'I' not null,
    constraint ch_type_event check (type_event = 'I' OR type_event = 'D' OR type_event = 'U'),
    row_id bigint not null,
    name varchar,
    age integer,
    gender varchar,
    address varchar
);

create function fnc_trg_person_insert_audit()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO person_audit (created, type_event, row_id, name, age, gender, address)
    VALUES (now(), 'I', NEW.id, NEW.name, NEW.age, NEW.gender, NEW.address);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

create trigger trg_person_insert_audit after insert
on person
for each row
execute function fnc_trg_person_insert_audit();

INSERT INTO person(id, name, age, gender, address) VALUES (10,'Damir', 22, 'male', 'Irkutsk');