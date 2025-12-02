create database Hr;
use hr;
use hr;
select * from hr_data;

#Average Attrition rate for all Departments#
SELECT 
    Department,
    ROUND(AVG(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100, 2) AS Attrition_Rate_Percentage
FROM hr_data
GROUP BY Department;

#Average Hourly Rate of Male Research Scientist#
SELECT 
    ROUND(AVG(HourlyRate), 2) AS Avg_HourlyRate_Male_RS
FROM hr_data
WHERE Gender = 'Male' AND JobRole = 'Research Scientist';

#Attrition Rate vs Monthly Income Stats#
SELECT 
    Attrition,
    ROUND(AVG(MonthlyIncome), 2) AS Avg_MonthlyIncome,
    ROUND(MIN(MonthlyIncome), 2) AS Min_Income,
    ROUND(MAX(MonthlyIncome), 2) AS Max_Income,
    COUNT(*) AS Employee_Count
FROM hr_data
GROUP BY Attrition;

#Average Working Years for Each Department#
SELECT 
    Department,
    ROUND(AVG(TotalWorkingYears), 2) AS Avg_WorkingYears
FROM hr_data
GROUP BY Department;

#Job Role vs Work-Life Balance#
SELECT 
    JobRole,
    ROUND(AVG(WorkLifeBalance), 2) AS Avg_WorkLife_Balance
FROM hr_data
GROUP BY JobRole
ORDER BY Avg_WorkLife_Balance DESC;

#Attrition Rate vs Years Since Last Promotion#
SELECT 
    ROUND(AVG(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100, 2) AS Attrition_Rate_Percentage,
    ROUND(AVG(YearsSinceLastPromotion), 2) AS Avg_Years_Since_Last_Promotion
FROM hr_data;

#Average Age of Employees#
SELECT 
    ROUND(AVG(Age), 2) AS Average_Age
FROM hr_data;

# Average Promotion
SELECT 
    ROUND(AVG(YearsSinceLastPromotion), 2) AS Avg_Promotion
FROM hr_data;

#
SELECT 
    COUNT(*) AS Total_Employees
FROM hr_data;

# Total Employees by Department#
SELECT 
    Department,
    COUNT(*) AS Total_Employees
FROM hr_data
GROUP BY Department
ORDER BY Total_Employees DESC;

#Education Field by Average Attrition Rate#
SELECT 
    EducationField,
    ROUND(AVG(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100, 2) AS Avg_Attrition_Rate_Percentage
FROM hr_data
GROUP BY EducationField
ORDER BY Avg_Attrition_Rate_Percentage DESC;
