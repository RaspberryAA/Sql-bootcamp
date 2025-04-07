-- To comply with Data Governance Policies, you need to add comments for the table and the table's columns. 
-- Let's apply this policy to the person_discounts table. 
-- Please add English or Russian comments (it is up to you) explaining what is a business goal of a table and all its attributes.

COMMENT ON TABLE person_discounts IS 'Stores discount information for each person at different pizzerias';
COMMENT ON COLUMN person_discounts.id IS 'ID of table entry / primary key of the table';
COMMENT ON COLUMN person_discounts.person_id IS 'ID of the person receiving the discount';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'ID of the pizzeria offering the discount';
COMMENT ON COLUMN person_discounts.discount IS 'Discount percentage (0-100) applied to the person';