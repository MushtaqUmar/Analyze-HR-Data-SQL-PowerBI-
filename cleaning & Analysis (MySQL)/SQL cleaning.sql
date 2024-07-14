CREATE DATABASE hr_db;

USE hr_db;

----------------- Import table via wizard ---------------  
SELECT * FROM human_resources;

ALTER TABLE human_resources
CHANGE COLUMN ï»¿id emp_id VARCHAR(20) NOT NULL;


/* Info about table */
DESCRIBE human_resources;

SELECT birthdate FROM human_resources;

SET sql_safe_updates = 0;

-------------------------------------------- -- 
UPDATE human_resources
SET birthdate = CASE
	WHEN birthdate LIKE '%/%' THEN date_format(str_to_date(birthdate, '%m/%d/%Y'), '%Y-%m-%d')
    WHEN birthdate LIKE '%-%' THEN date_format(str_to_date(birthdate, '%m-%d-%Y'), '%Y-%m-%d')
    ELSE NULL
END;

ALTER TABLE human_resources
MODIFY COLUMN birthdate DATE;


------------------------------------------ -- 
UPDATE human_resources
SET hire_date = CASE
	WHEN hire_date LIKE '%/%' THEN date_format(str_to_date(hire_date, '%m/%d/%Y'), '%Y-%m-%d')
    WHEN hire_date LIKE '%-%' THEN date_format(str_to_date(hire_date, '%m-%d-%Y'), '%Y-%m-%d')
    ELSE NULL
END;

ALTER TABLE human_resources
MODIFY COLUMN hire_date DATE;


----------------------------------------------------------- -- 
UPDATE human_resources
SET termdate = IF(termdate IS NOT NULL AND termdate != '',date(str_to_date(termdate, '%Y-%m-%d %H:%i:%s UTC')), '0000-00-00')    /* Date(datetime exp) : Gives YYYY-MM-DD */
WHERE true;






/* -------------- Add 'age' column ------------------ */
ALTER TABLE human_resources 
ADD COLUMN age INT;

UPDATE human_resources
SET age = timestampdiff(YEAR, birthdate, curdate() );  
										/* TIMESTAMPDIFF(unit, datetime_expr1, datetime_expr2) : Returns difference between two date/datetime based on unit(yrs,months,day,hr,s) used to calculate difference */
                                        /* curdate() : return current date in format 'YYYY-MM-DD' */
                                        
                                        
                                        
----------------- Need employee between age 18 & 65 (Drop others as outliers as not suitable for company) ----------------- -- 
DELETE FROM human_resources
WHERE age < 18 OR age > 65;



