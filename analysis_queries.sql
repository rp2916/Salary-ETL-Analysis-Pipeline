/* SALARY DATA ANALYSIS PROJECT - CORE QUERIES
This script contains the final queries used to derive insights for the dashboard.
*/

-- 1. Identifying the "Top-Heavy" Data Trap (Alaska Case Study)
-- Shows why Median is better than Average for salary data
SELECT 
    "Work_State_US",
    ROUND(AVG("Annual_salary"), 0) AS average_pay,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY "Annual_salary") AS median_pay,
    MAX("Annual_salary") AS highest_single_salary,
    COUNT(*) AS sample_size
FROM salaries 
WHERE "Work_State_US" IS NOT NULL 
GROUP BY "Work_State_US"  
HAVING COUNT(*) > 50
ORDER BY average_pay DESC;

-- 2. The Promotion Premium (Senior vs Standard Roles)
SELECT 
    CASE 
        WHEN "Job_title" ILIKE '%Senior%' THEN 'Senior Role'
        ELSE 'Standard Role'
    END AS role_type,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY "Annual_salary") AS median_salary,
    COUNT(*) AS sample_size
FROM salaries
WHERE "Industry" = 'Computing or Tech'
  AND ("Job_title" ILIKE '%Engineer%' OR "Job_title" ILIKE '%Developer%')
GROUP BY role_type;

-- 3. Experience vs. Bonus Ratio (Career Stage Analysis)
SELECT 
    CASE 
        WHEN "Exp_Years_Clean" <= 2 THEN '1. Entry Level (0-2 yrs)'
        WHEN "Exp_Years_Clean" BETWEEN 3 AND 10 THEN '2. Mid Career (3-10 yrs)'
        WHEN "Exp_Years_Clean" BETWEEN 11 AND 20 THEN '3. Senior (11-20 yrs)'
        ELSE '4. Executive/Late Career (21+ yrs)'
    END AS career_stage,
    ROUND(AVG("Annual_salary"), 0) AS avg_base_salary,
    ROUND(AVG("Additional_compensation"), 0) AS avg_bonus,
    ROUND((AVG("Additional_compensation") / NULLIF(AVG("Annual_salary"), 0)) * 100, 2) AS bonus_percentage
FROM salaries
WHERE "Exp_Years_Clean" IS NOT NULL
GROUP BY career_stage
ORDER BY career_stage ASC;

-- 4. Education ROI (College Degree vs Master's Degree)
-- Filtering for mid-career professionals in Tech (5-10 years experience)
SELECT 
    "Highest_education", 
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY "Annual_salary") AS median_salary,
    COUNT(*) AS sample_size
FROM salaries
WHERE ("Industry" ILIKE '%Tech%' OR "Industry" ILIKE '%Computing%')
  AND "Field_Exp_Clean" BETWEEN 5 AND 10
  AND "Highest_education" IN ('College degree', 'Master''s degree')
GROUP BY "Highest_education";
