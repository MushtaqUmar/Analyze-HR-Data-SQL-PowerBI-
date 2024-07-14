## Analyze HR Employee Data
  Clean and Analyze Human Resources data of an organization using MySQL to extract useful insights from it.Then Visualize the insights using Power BI that will help HR department to make better decisions for future. 

### Key Steps:
DataSet : Understand HR dataset of employees from 2000-2020.

MySQL   : Data Cleaning and Analysis for insights.

Power BI : Visualization of key insights.

### Major Cleaning:
    -> Some records had negative ages and those were excluded during querying.
    -> Ages used were 18 years and above.
    -> Mixed formats and datatypes were balanced using MySQL.
    -> New Columns were added from existing for more clear insights.
    -> Some termdates were far into the future and were not included in the analysis. The only termination dates used for were those less than or equal to the current date(i.e., those terminated).

### Key KPI's (After cleaning & Analysis) :
Total Employees = 9368.
Average Employee Tenure = 8 yesrs.
Total EMployee Hired = 11383.
Total Employee Terminated = 1302.

### MySQL Queries to answer following Questions:

    What is the gender breakdown of employees in the company?
    What is the race/ethnicity breakdown of employees in the company?
    What is the age distribution of employees in the company?
    What is the age distribution of employees among genders in the company?
    How many employees work at headquarters versus remote locations?
    What is the average length of employment for employees who have been terminated?
    How does the gender distribution vary across departments and job titles?
    What is the distribution of job titles across the company?
    Which department has the highest turnover rate?
    What is the distribution of employees across locations by state?
    How has the company's employee count changed over time based on hire and term dates?
    What is the tenure distribution for each department?


### Key Insights:

   -> Balanced gender distribution.However there are more male employees.
   
   -> White race is the most dominant while Native Hawaiian and American Indian are the least dominant.
   
   -> The youngest employee is around 20 years old and the oldest is around 58 years old.
   
   -> 5 age groups were created (18-24, 25-35, 36-45, 46-55, 55+. A large number of employees were between 25-34 followed by 35-45 while the smallest group was 55+.
   
   -> A large number of employees work at the headquarters than remotely.
   
   -> The average length of employment for terminated employees is around 8 years.
   
   -> The gender distribution across departments is fairly balanced but there are generally more male than female employees.
   
   -> The Auduting department has the highest turnover rate followed by Support. The least turn over rate are in the Marketing, Business Development.
   
   -> A large number of employees come from the state of Ohio & least come from Wisconsin.
   
   -> The net change in employees has increased over the years.
   
   -> The average tenure for each department is about 8 years with sales and Auditing having the highest and Services, Business Development having the lowest.
   

