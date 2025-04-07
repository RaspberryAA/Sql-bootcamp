-- Please add the following constraint rules for existing columns of the person_discounts table.
-- 
-- person_id column should not be NULL (use constraint name ch_nn_person_id);
-- pizzeria_id column should not be NULL (use constraint name ch_nn_pizzeria_id);
-- discount column should not be NULL (use constraint name ch_nn_discount);
-- discount column should be 0 percent by default;
-- discount column should be in a range values from 0 to 100 (use constraint name ch_range_discount).

alter table person_discounts add constraint ch_nn_person_id check (person_id IS NOT NULL);
alter table person_discounts add constraint ch_nn_pizzeria_id check (pizzeria_id IS NOT NULL);
alter table person_discounts add constraint ch_nn_discount check (discount IS NOT NULL);
alter table person_discounts alter column discount SET default 0;
alter table person_discounts add constraint ch_range_discount check (discount between 0 and 100);