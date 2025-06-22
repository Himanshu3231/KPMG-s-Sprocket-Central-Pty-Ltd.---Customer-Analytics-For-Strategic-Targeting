CREATE DATABASE IF NOT EXISTS kpmg_sprocket_central;

USE kpmg_sprocket_central;

-- Customer Demographics & Segmentation

-- What is the distribution of customers by wealth segment?
-- What is the distribution of customers by job industry category?
-- How many customers fall into each age group (e.g., 18–25, 26–35, etc.)?
-- How many customers own a car vs. not?
-- What is the average tenure of a customer?

SELECT 
	wealth_segment,
    COUNT(DISTINCT customer_id) AS total_customer_segment_wise
FROM 
	`customer_demographics kpmg`
GROUP BY wealth_segment;
-------------------------------------------------------------------------------------------- 
SELECT 
	updated_job_industry_category,
    COUNT(DISTINCT customer_id) AS customer_distribution_by_job_industry_category
FROM 
	`customer_demographics kpmg`
GROUP BY updated_job_industry_category;
--------------------------------------------------------------------------------------------     
SELECT 
	customer_age_distribution,
    COUNT(customer_id) AS customer_count
FROM 
	(SELECT 
		customer_id,
		customer_name,
		CASE 
			WHEN customer_age >= 18 AND customer_age <= 25 THEN '18-25'
			WHEN customer_age >= 26 AND customer_age <= 35 THEN '25-35'
			WHEN customer_age > 35 THEN 'Above 35'
			ELSE 'Below 18'
		END AS customer_age_distribution
	FROM 
		`customer_demographics kpmg`) AS age_distrbution_subquery
GROUP BY customer_age_distribution
ORDER BY customer_age_distribution;
------------------------------------------------------------------------------------------ 
SELECT 
	owns_car,
    COUNT(owns_car) AS car_owners_count
FROM 
	`customer_demographics kpmg`
GROUP BY owns_car;
------------------------------------------------------------------------------------------
SELECT 
	customer_id,
    COUNT(*)
FROM 
	`customer_address kpmg`
GROUP BY customer_id
HAVING COUNT(*) > 1;
------------------------------------------------------------------------------------------
-- average tenure: age wise, gender wise, job industry category wise, wealth segment wise

SELECT 
	customer_age_distribution,
    COUNT(customer_id) AS customer_count,
    ROUND(AVG(tenure), 0) AS average_tenure_duration
FROM 
	(SELECT 
		customer_id,
		customer_name,
        tenure,
		CASE 
			WHEN customer_age >= 18 AND customer_age <= 25 THEN '18-25'
			WHEN customer_age >= 26 AND customer_age <= 35 THEN '25-35'
			WHEN customer_age > 35 THEN 'Above 35'
			ELSE 'Below 18'
		END AS customer_age_distribution
	FROM 
		`customer_demographics kpmg`) AS age_distrbution_subquery
GROUP BY customer_age_distribution
ORDER BY customer_age_distribution;

SELECT 
	updated_gender,
    COUNT(customer_id),
    ROUND(AVG(tenure), 0) AS average_tenure_duration
FROM 
	`customer_demographics kpmg`
GROUP BY updated_gender;   

SELECT 
	updated_job_industry_category,
    COUNT(customer_id),
    ROUND(AVG(tenure), 0) AS average_tenure_duration
FROM 
	`customer_demographics kpmg`
GROUP BY updated_job_industry_category;  

SELECT 
	wealth_segment,
    COUNT(customer_id),
    ROUND(AVG(tenure), 0) AS average_tenure_duration
FROM 
	`customer_demographics kpmg`
GROUP BY wealth_segment;  
--------------------------------------------------------------------------------------

	