-- Let’s continue to implement our audit pattern for the person table. 
-- Just define a trigger trg_person_update_audit and corresponding trigger function fnc_trg_person_update_audit to handle 
-- all UPDATE traffic on the person table. We should save the OLD states of all attribute values.
-- 
-- When you are ready, apply the UPDATE statements below.
-- 
-- UPDATE person SET name = 'Bulat' WHERE id = 10; UPDATE person SET name = 'Damir' WHERE id = 10;

create or replace function fnc_trg_person_update_audit()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO person_audit (created, type_event, row_id, name, age, gender, address)
    VALUES (now(), 'U', OLD.id, OLD.name, OLD.age, OLD.gender, OLD.address);
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

create or replace trigger trg_person_update_audit
after update
on person
for each row
execute function fnc_trg_person_update_audit();

UPDATE person SET name = 'Bulat' WHERE id = 10; 
UPDATE person SET name = 'Damir' WHERE id = 10; 