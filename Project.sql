SELECT 
    work_year AS Year,
    job_title AS Title,
    CASE
        WHEN employee_residence = 'BG' THEN 'Bulgaria'
        WHEN employee_residence = 'CA' THEN 'Canada'
        WHEN employee_residence = 'DE' THEN 'Germany'
        WHEN employee_residence = 'DK' THEN 'Denmark'
        WHEN employee_residence = 'ES' THEN 'Spain'
        WHEN employee_residence = 'FR' THEN 'France'
        WHEN employee_residence = 'GB' THEN 'United Kingdom'
        WHEN employee_residence = 'GR' THEN 'Greece'
        WHEN employee_residence = 'HN' THEN 'Honduras'
        WHEN employee_residence = 'HU' THEN 'Hungary'
        WHEN employee_residence = 'IN' THEN 'India'
        WHEN employee_residence = 'KE' THEN 'Kenya'
        WHEN employee_residence = 'LU' THEN 'Luxembourg'
        WHEN employee_residence = 'NG' THEN 'Nigeria'
        WHEN employee_residence = 'PK' THEN 'Pakistan'
        WHEN employee_residence = 'US' THEN 'United States'
        ELSE employee_residence
    END AS `Employee Residence`, 
    CASE
        WHEN company_location = 'BG' THEN 'Bulgaria'
        WHEN company_location = 'CA' THEN 'Canada'
        WHEN company_location = 'DE' THEN 'Germany'
        WHEN company_location = 'DK' THEN 'Denmark'
        WHEN company_location = 'ES' THEN 'Spain'
        WHEN company_location = 'FR' THEN 'France'
        WHEN company_location = 'GB' THEN 'United Kingdom'
        WHEN company_location = 'GR' THEN 'Greece'
        WHEN company_location = 'HN' THEN 'Honduras'
        WHEN company_location = 'HU' THEN 'Hungary'
        WHEN company_location = 'IN' THEN 'India'
        WHEN company_location = 'KE' THEN 'Kenya'
        WHEN company_location = 'LU' THEN 'Luxembourg'
        WHEN company_location = 'NG' THEN 'Nigeria'
        WHEN company_location = 'PK' THEN 'Pakistan'
        WHEN company_location = 'US' THEN 'United States'
        ELSE company_location
    END AS `Company Location`,
    CASE 
        WHEN experience_level = 'EN' THEN 'Entry-level / Junior'
        WHEN experience_level = 'MI' THEN 'Mid-level / Intermediate'
        WHEN experience_level = 'SE' THEN 'Senior-level / Expert'
        WHEN experience_level = 'EX' THEN 'Executive-level / Director'
        ELSE experience_level
    END AS `Experience Level`, 
    CASE
        WHEN company_size = 'L' THEN 'Large/more than 250 employees'
        WHEN company_size = 'M' THEN 'Medium/50 to 250 employees'
        WHEN company_size = 'S' THEN 'Small/less than 50 employees'
        ELSE company_size
    END AS `Company Size`,
    ROUND(AVG(salary_in_usd)/12) AS `Avg Salary in Dollar Monthly`
FROM ds_salaries
WHERE 
    job_title LIKE '%data analyst%' 
    AND employment_type = 'FT'
GROUP BY 
    Year, 
    `Employee Residence`,
    `Company Location`,
    Title, 
    `Experience Level`, 
    `Company Size`
ORDER BY 
    Year;
