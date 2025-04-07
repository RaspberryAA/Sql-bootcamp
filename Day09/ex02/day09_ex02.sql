-- Finally, we need to handle DELETE statements and make a copy of the OLD states for all attribute’s values. 
-- Please create a trigger trg_person_delete_audit and corresponding trigger function fnc_trg_person_delete_audit.
-- 
-- When you are ready, use the SQL statement below.
-- 
-- DELETE FROM person WHERE id = 10;
-- 
-- 

create or replace function fnc_trg_person_delete_audit()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO person_audit (created, type_event, row_id, name, age, gender, address)
    VALUES (now(), 'D', OLD.id, OLD.name, OLD.age, OLD.gender, OLD.address);
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

create or replace trigger trg_person_delete_audit
after delete
on person
for each row
execute function fnc_trg_person_delete_audit();

DELETE FROM person WHERE id = 10;