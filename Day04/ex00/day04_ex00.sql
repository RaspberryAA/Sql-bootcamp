-- Our knowledge way is incremental and linear therefore please be aware all changes that you made in Day03 during exercises 07-13 should be on place 

-- Please create 2 Database Views (with similar attributes as the original table) based on a simple filtering by gender of persons. 
-- Set the corresponding names for the database views: v_persons_female and v_persons_male.

CREATE VIEW v_persons_female AS
SELECT * 
FROM person
WHERE gender = 'female';
CREATE VIEW v_persons_male AS
SELECT * 
FROM person
WHERE gender = 'male';