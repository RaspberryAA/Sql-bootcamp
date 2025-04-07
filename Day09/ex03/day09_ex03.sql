-- Actually, there are 3 triggers for one person table. 
-- Let's merge all our logic into one main trigger called trg_person_audit and a new corresponding trigger function fnc_trg_person_audit.
-- 
-- In other words, all DML traffic (INSERT, UPDATE, DELETE) should be handled by the one function block. 
-- Please explicitly define a separate IF-ELSE block for each event (I, U, D)!
-- 
-- Additionally, please follow the steps below .
-- 
-- to remove 3 old triggers from the person table;
-- to remove 3 old trigger functions;
-- to do a TRUNCATE (or DELETE) of all rows in our person_audit table.
-- When you are ready, reapply the set of DML statements. 
-- INSERT INTO person(id, name, age, gender, address) VALUES (10,'Damir', 22, 'male', 'Irkutsk'); 
-- UPDATE person SET name = 'Bulat' WHERE id = 10; UPDATE person SET name = 'Damir' WHERE id = 10; DELETE FROM person WHERE id = 10;


DROP TRIGGER trg_person_insert_audit on person;
DROP TRIGGER trg_person_update_audit on person;
DROP TRIGGER trg_person_delete_audit on person;
DROP FUNCTION fnc_trg_person_insert_audit;
DROP FUNCTION fnc_trg_person_update_audit;
DROP FUNCTION fnc_trg_person_delete_audit;

TRUNCATE table person_audit;

create or replace function fnc_trg_person_audit()
RETURNS TRIGGER AS $$
BEGIN
    IF TG_OP = 'INSERT' THEN
        INSERT INTO person_audit (created, type_event, row_id, name, age, gender, address)
        VALUES (now(), 'I', NEW.id, NEW.name, NEW.age, NEW.gender, NEW.address);
        RETURN NULL;
    ELSEIF TG_OP = 'UPDATE' THEN
        INSERT INTO person_audit (created, type_event, row_id, name, age, gender, address)
        VALUES (now(), 'U', OLD.id, OLD.name, OLD.age, OLD.gender, OLD.address);
        RETURN NULL;
    ELSEIF TG_OP = 'DELETE' THEN
        INSERT INTO person_audit (created, type_event, row_id, name, age, gender, address)
        VALUES (now(), 'D', OLD.id, OLD.name, OLD.age, OLD.gender, OLD.address);
        RETURN NULL;
    END IF;
END;
$$ LANGUAGE plpgsql;

create or replace trigger trg_person_audit
after insert or update or delete
on person
for each row
execute function fnc_trg_person_audit();

INSERT INTO person(id, name, age, gender, address) VALUES (10,'Damir', 22, 'male', 'Irkutsk'); 
UPDATE person SET name = 'Bulat' WHERE id = 10; 
UPDATE person SET name = 'Damir' WHERE id = 10; 
DELETE FROM person WHERE id = 10;