-- Please create a Database View (with name v_generated_dates) which should "store" generated dates from January 1st to
--  January 31st, 2022 in type DATE. Don't forget the order of the generated_date column.
-- 
-- generated_date
-- 2022-01-01
-- 2022-01-02
-- ...
-- 

CREATE VIEW v_generated_dates AS
SELECT generate_series('2022-01-01'::date, '2022-01-31'::date, '1 day')::date AS generated_date
ORDER BY 1;