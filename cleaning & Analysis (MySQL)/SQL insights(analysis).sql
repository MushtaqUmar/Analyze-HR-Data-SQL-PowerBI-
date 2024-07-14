/* Analysis for insights */

-- ========================  1.  What is the gender breakdown of employees in the company?    (Those who are working in the company)
 SELECT gender, count(*) 
 FROM human_resources
 WHERE termdate = '0000-00-00'    /* Still working i.e., not terminated */
 GROUP BY gender;
 
-- ========================  2. What is the race/ethnicity breakdown of employees in the company?
 SELECT race, count(*) AS count
 FROM human_resources
 WHERE termdate = '0000-00-00'    /* Still working i.e., not terminated */
 GROUP BY race
 ORDER BY count DESC;
 
 
-- ========================  3. What is the age distribution of employees in the company?

/* for idea of age range */
SELECT 
	min(age) AS youngest,
    max(age) AS oldest
FROM human_resources;


SELECT 
	CASE
		WHEN age >= 18 AND age <= 24 THEN '18-24'
        WHEN age >= 25 AND age <= 35 THEN '25-35'
        WHEN age >= 36 AND age <= 45 THEN '36-45'
        WHEN age >= 46 AND age <= 55 THEN '46-55'
        WHEN age >= 56 THEN '56+'
	END AS age_group,
    count(*) AS count
FROM human_resources
WHERE termdate = '0000-00-00'    /* Still working i.e., not terminated */
GROUP BY age_group
ORDER BY age_group;



-- ========================   4. What is the age distribution of employees among genders in the company?

SELECT 
	CASE
		WHEN age >= 18 AND age <= 24 THEN '18-24'
        WHEN age >= 25 AND age <= 35 THEN '25-35'
        WHEN age >= 36 AND age <= 45 THEN '36-45'
        WHEN age >= 46 AND age <= 55 THEN '46-55'
        WHEN age >= 56 THEN '56+'
	END AS age_group, gender,
    count(*) AS count
FROM human_resources
WHERE termdate = '0000-00-00'    /* Still working i.e., not terminated */
GROUP BY age_group,gender
ORDER BY age_group,gender;



--  ======================== 5.  How many employees work at headquarters versus remote locations?
SELECT location, count(*) AS count
FROM human_resources
WHERE termdate = '0000-00-00'    /* Still working i.e., not terminated */
GROUP BY location;




-- ========================  6.  What is the average length of employment for employees who have been terminated?  (i.e., how long employees were working before they were fired or they quit).

SELECT ROUND(AVG(datediff(termdate , hire_date)) / 365, 0) AS avg_yrs_employment             /* datediff(date1-earlier, date2) : retrun difference b/w as no. of days between them */
FROM human_resources
WHERE termdate < curdate() AND termdate != '0000-00-00';  									 /* those who terminated by today */





-- ======================== 7. How does the gender distribution vary across departments and job titles?
/* 7.1 */
SELECT department , gender, count(gender) AS count
FROM human_resources
WHERE termdate = '0000-00-00'    /* Those who are not terminated yet */
GROUP BY department, gender
ORDER BY department, gender;

/* 7.2 */
SELECT jobtitle ,gender, count(gender) AS count
FROM human_resources
WHERE termdate = '0000-00-00'    /* Those who are not terminated yet */
GROUP BY jobtitle, gender
ORDER BY jobtitle, gender;



-- ======================== 8.  What is the distribution of job titles across the company?
SELECT jobtitle, count(*) AS count
FROM human_resources
WHERE termdate = '0000-00-00'    /* Those who are not terminated yet */
GROUP BY jobtitle
ORDER BY jobtitle DESC;

-- ========================  9.  Which department has the highest turnover rate?  (turnover (of employees): rate at which employees leave a company and are replaced by new hires.)

SELECT department , total_count , term_count , term_count/total_count AS term_ratio
FROM
(SELECT department , count(*) AS total_count , SUM( CASE WHEN termdate <= curdate() AND termdate != '0000-00-00' THEN 1 ELSE 0  END) AS term_count            /* for each dept bcz grouped by dept */  
FROM human_resources
group by department) AS sub_table
ORDER BY term_ratio DESC;

--  ========================  10.  What is the distribution of employees across locations by state?
SELECT location_state, COUNT(*) AS count
FROM human_resources
WHERE termdate = '0000-00-00'    /* Those who are working. */
group by location_state
ORDER BY count DESC;

--  ========================  11.  How has the company's employee count changed over time based on hire and term dates?   (i.e., for eg for year 2000, how many employees were hired, terminated and % change.)
SELECT year, hires, terminations, (hires - terminations) AS net_change , ROUND(((hires - terminations) / hires)*100 , 2) AS net_percent_change
FROM
		(SELECT year(hire_date) AS year,
				count(*) AS hires,
				sum(CASE WHEN termdate <= curdate() AND termdate != '0000-00-00' THEN 1 ELSE 0 END) AS terminations
		FROM human_resources
		group by year(hire_date)
        ) AS sub_table
ORDER BY year ASC;


--  ========================  12.  What is the tenure distribution for each department?   (tenure here: How long employees stay in department before they leave )
SELECT department , ROUND(AVG(datediff(termdate, hire_date)/365),0) AS avg_emp_tenure                                     /* datediff()  give difference in years */
FROM human_resources
WHERE termdate <= curdate() AND termdate != '0000-00-00'                                                    /* Those who are terminated from company */
group by department
ORDER BY avg_emp_tenure;
