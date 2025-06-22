-- Top New Customers by Purchasing Behavior based on High Total Spending

-- Dense Ranking new customers based on Value column
SELECT 
	new_customer_name,
	new_customer_age,
	updated_gender,
	updated_job_industry_category,
	wealth_segment,
	CASE 
		WHEN new_customer_age >= 18 AND new_customer_age <= 25 THEN '18-25'
		WHEN new_customer_age >= 26 AND new_customer_age <= 35 THEN '25-35'
		WHEN new_customer_age > 35 THEN 'Above 35'
		ELSE 'Below 18'
	END AS new_customer_age_distribution,
    Value,
    DENSE_RANK() OVER (ORDER BY Value DESC)
FROM
	`new_customer_list kpmg`
LIMIT 1000;
-------------------------------------------------------------------------------
-- agewise distribution of new customers
SELECT
	new_customer_age_distribution,
    COUNT(new_customer_age) AS total_new_customers
FROM 
	(SELECT 
		new_customer_name,
		new_customer_age,
		updated_gender,
		updated_job_industry_category,
		wealth_segment,
        updated_deceased_indicator,
		CASE 
			WHEN new_customer_age >= 18 AND new_customer_age <= 25 THEN '18-25'
			WHEN new_customer_age >= 26 AND new_customer_age <= 35 THEN '25-35'
			WHEN new_customer_age > 35 THEN 'Above 35'
			ELSE 'Below 18'
		END AS new_customer_age_distribution,
		Value,
		DENSE_RANK() OVER (ORDER BY Value DESC)
	FROM
		`new_customer_list kpmg`
	LIMIT 1000) AS dense_ranked_new_customers
WHERE 
	updated_deceased_indicator = 'Not Deceased'
GROUP BY 
	new_customer_age_distribution
ORDER BY 
	total_new_customers DESC;
---------------------------------------------------------------------------------
-- Wealth segment wise distribution of new customers
SELECT
	wealth_segment,
    COUNT(wealth_segment) AS total_new_customers
FROM 
	(SELECT 
		new_customer_name,
		new_customer_age,
		updated_gender,
		updated_job_industry_category,
		wealth_segment,
        updated_deceased_indicator,
		CASE 
			WHEN new_customer_age >= 18 AND new_customer_age <= 25 THEN '18-25'
			WHEN new_customer_age >= 26 AND new_customer_age <= 35 THEN '25-35'
			WHEN new_customer_age > 35 THEN 'Above 35'
			ELSE 'Below 18'
		END AS new_customer_age_distribution,
		Value,
		DENSE_RANK() OVER (ORDER BY Value DESC)
	FROM
		`new_customer_list kpmg`
	LIMIT 1000) AS dense_ranked_new_customers
WHERE 
	updated_deceased_indicator = 'Not Deceased'
GROUP BY 
	wealth_segment
ORDER BY 
	total_new_customers DESC;
----------------------------------------------------------------------------------
-- Job Industry Category wise new customer distribution
SELECT
	updated_job_industry_category,
    COUNT(updated_job_industry_category) AS total_new_customers
FROM 
	(SELECT 
		new_customer_name,
		new_customer_age,
		updated_gender,
		updated_job_industry_category,
		wealth_segment,
        updated_deceased_indicator,
		CASE 
			WHEN new_customer_age >= 18 AND new_customer_age <= 25 THEN '18-25'
			WHEN new_customer_age >= 26 AND new_customer_age <= 35 THEN '25-35'
			WHEN new_customer_age > 35 THEN 'Above 35'
			ELSE 'Below 18'
		END AS new_customer_age_distribution,
		Value,
		DENSE_RANK() OVER (ORDER BY Value DESC)
	FROM
		`new_customer_list kpmg`
	LIMIT 1000) AS dense_ranked_new_customers
WHERE 
	updated_deceased_indicator = 'Not Deceased'
GROUP BY 
	updated_job_industry_category
ORDER BY 
	total_new_customers DESC;
----------------------------------------------------------------------------------
-- gender wise distribution of new customers
SELECT
	updated_gender,
    COUNT(updated_gender) AS total_new_customers
FROM 
	(SELECT 
		new_customer_name,
		new_customer_age,
		updated_gender,
		updated_job_industry_category,
		wealth_segment,
        updated_deceased_indicator,
		CASE 
			WHEN new_customer_age >= 18 AND new_customer_age <= 25 THEN '18-25'
			WHEN new_customer_age >= 26 AND new_customer_age <= 35 THEN '25-35'
			WHEN new_customer_age > 35 THEN 'Above 35'
			ELSE 'Below 18'
		END AS new_customer_age_distribution,
		Value,
		DENSE_RANK() OVER (ORDER BY Value DESC)
	FROM
		`new_customer_list kpmg`
	LIMIT 1000) AS dense_ranked_new_customers
WHERE 
	updated_deceased_indicator = 'Not Deceased'
GROUP BY 
	updated_gender
ORDER BY 
	total_new_customers DESC;
---------------------------------------------------------------------------------
-- Potential New Customers
SELECT
    new_customer_name,
    updated_gender,
    CASE
        WHEN new_customer_age >= 18 AND new_customer_age <= 25 THEN '18-25'
        WHEN new_customer_age >= 26 AND new_customer_age <= 35 THEN '25-35'
        WHEN new_customer_age > 35 THEN 'Above 35'
        ELSE 'Below 18'
    END AS customer_age_distribution,
    job_title,
    updated_job_industry_category,
    wealth_segment,
    owns_car,
    past_3_years_bike_related_purchases,
    address,
    postcode,
    state,
    country,
    Value AS potential_score -- Alias for clarity
FROM
    `new_customer_list kpmg`
ORDER BY
    Value DESC
LIMIT 1000; -- Or whatever number around 1000 is desired
---------------------------------------------------------------------
-- Total New Potential Customers
SELECT COUNT(*)
FROM (SELECT
    new_customer_name,
    updated_gender,
    CASE
        WHEN new_customer_age >= 18 AND new_customer_age <= 25 THEN '18-25'
        WHEN new_customer_age >= 26 AND new_customer_age <= 35 THEN '25-35'
        WHEN new_customer_age > 35 THEN 'Above 35'
        ELSE 'Below 18'
    END AS customer_age_distribution,
    job_title,
    updated_job_industry_category,
    wealth_segment,
    owns_car,
    past_3_years_bike_related_purchases,
    address,
    postcode,
    state,
    country,
    Value AS potential_score -- Alias for clarity
FROM
    `new_customer_list kpmg`
ORDER BY
    Value DESC
LIMIT 1000 -- Or whatever number around 1000 is desired
) AS abc;