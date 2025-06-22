-- Top Historical Customers by Purchasing Behavior based on Historical Customer's Frequent Purchasing Behavior
SELECT
	cdk.customer_id,
    cdk.customer_name,
    updated_gender,
    customer_age,
	updated_job_industry_category,
	wealth_segment,
    CASE 
			WHEN customer_age >= 18 AND customer_age <= 25 THEN '18-25'
			WHEN customer_age >= 26 AND customer_age <= 35 THEN '25-35'
			WHEN customer_age > 35 THEN 'Above 35'
			ELSE 'Below 18'
		END AS customer_age_distribution,
    COUNT(cdk.customer_id)  AS purchase_count
FROM 
	`customer_demographics kpmg` AS cdk
    JOIN `transaction dataset kpmg` AS tdk
    ON cdk.customer_id = tdk.customer_id
GROUP BY 
	cdk.customer_id, 
	cdk.customer_name,
    updated_gender,
    customer_age,
	updated_job_industry_category,
	wealth_segment
ORDER BY 
	purchase_count DESC
LIMIT 1000;
-----------------------------------------------------------
-- agewise distribution of hostorical customers
SELECT 
    customer_age_distribution,
	COUNT(customer_age) AS total_historical_customer
FROM
	(SELECT
		cdk.customer_id,
		cdk.customer_name,
		updated_gender,
		customer_age,
		updated_job_industry_category,
		wealth_segment,
        CASE 
			WHEN customer_age >= 18 AND customer_age <= 25 THEN '18-25'
			WHEN customer_age >= 26 AND customer_age <= 35 THEN '25-35'
			WHEN customer_age > 35 THEN 'Above 35'
			ELSE 'Below 18'
		END AS customer_age_distribution,
		COUNT(cdk.customer_id)  AS purchase_count
	FROM 
		`customer_demographics kpmg` AS cdk
		JOIN `transaction dataset kpmg` AS tdk
		ON cdk.customer_id = tdk.customer_id
	GROUP BY 
		cdk.customer_id, 
		cdk.customer_name,
		updated_gender,
		customer_age,
		updated_job_industry_category,
		wealth_segment
	ORDER BY 
		purchase_count DESC
	LIMIT 1000) AS top_historicaal_customer_by_purchasing_behavior
GROUP BY 
	customer_age_distribution
ORDER BY total_historical_customer DESC;
--------------------------------------------------------------------------
-- Genderwise distribution of historical customers
SELECT 
    updated_gender,
	COUNT(updated_gender) AS total_historical_customer
FROM
	(SELECT
		cdk.customer_id,
		cdk.customer_name,
		updated_gender,
		customer_age,
		updated_job_industry_category,
		wealth_segment,
        CASE 
			WHEN customer_age >= 18 AND customer_age <= 25 THEN '18-25'
			WHEN customer_age >= 26 AND customer_age <= 35 THEN '25-35'
			WHEN customer_age > 35 THEN 'Above 35'
			ELSE 'Below 18'
		END AS customer_age_distribution,
		COUNT(cdk.customer_id)  AS purchase_count
	FROM 
		`customer_demographics kpmg` AS cdk
		JOIN `transaction dataset kpmg` AS tdk
		ON cdk.customer_id = tdk.customer_id
	GROUP BY 
		cdk.customer_id, 
		cdk.customer_name,
		updated_gender,
		customer_age,
		updated_job_industry_category,
		wealth_segment
	ORDER BY 
		purchase_count DESC
	LIMIT 1000) AS top_historicaal_customer_by_purchasing_behavior
GROUP BY 
	updated_gender
ORDER BY total_historical_customer DESC;
------------------------------------------------------------------------
-- Job Industry Category wise distribution of historical customers
SELECT 
    updated_job_industry_category,
	COUNT(updated_job_industry_category) AS total_historical_customer
FROM
	(SELECT
		cdk.customer_id,
		cdk.customer_name,
		updated_gender,
		customer_age,
		updated_job_industry_category,
		wealth_segment,
        CASE 
			WHEN customer_age >= 18 AND customer_age <= 25 THEN '18-25'
			WHEN customer_age >= 26 AND customer_age <= 35 THEN '25-35'
			WHEN customer_age > 35 THEN 'Above 35'
			ELSE 'Below 18'
		END AS customer_age_distribution,
		COUNT(cdk.customer_id)  AS purchase_count
	FROM 
		`customer_demographics kpmg` AS cdk
		JOIN `transaction dataset kpmg` AS tdk
		ON cdk.customer_id = tdk.customer_id
	GROUP BY 
		cdk.customer_id, 
		cdk.customer_name,
		updated_gender,
		customer_age,
		updated_job_industry_category,
		wealth_segment
	ORDER BY 
		purchase_count DESC
	LIMIT 1000) AS top_historicaal_customer_by_purchasing_behavior
GROUP BY 
	updated_job_industry_category
ORDER BY total_historical_customer DESC;
---------------------------------------------------------------------------
-- Wealth segment wise distribution of historical customers
SELECT 
    wealth_segment,
	COUNT(wealth_segment) AS total_historical_customer
FROM
	(SELECT
		cdk.customer_id,
		cdk.customer_name,
		updated_gender,
		customer_age,
		updated_job_industry_category,
		wealth_segment,
        CASE 
			WHEN customer_age >= 18 AND customer_age <= 25 THEN '18-25'
			WHEN customer_age >= 26 AND customer_age <= 35 THEN '25-35'
			WHEN customer_age > 35 THEN 'Above 35'
			ELSE 'Below 18'
		END AS customer_age_distribution,
		COUNT(cdk.customer_id)  AS purchase_count
	FROM 
		`customer_demographics kpmg` AS cdk
		JOIN `transaction dataset kpmg` AS tdk
		ON cdk.customer_id = tdk.customer_id
	GROUP BY 
		cdk.customer_id, 
		cdk.customer_name,
		updated_gender,
		customer_age,
		updated_job_industry_category,
		wealth_segment
	ORDER BY 
		purchase_count DESC
	LIMIT 1000) AS top_historicaal_customer_by_purchasing_behavior
GROUP BY 
	wealth_segment
ORDER BY total_historical_customer DESC;