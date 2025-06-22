-- Top Historical Customers by Purchasing Behavior based on High Avg Spending
SELECT 
	age_distrbution_subquery.customer_id,
    age_distrbution_subquery.customer_name,
    age_distrbution_subquery.customer_age_distribution,
    ROUND(AVG(tdk.list_price), 0) AS avg_expenditure
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
    JOIN `transaction dataset kpmg` AS tdk
    ON age_distrbution_subquery.customer_id = tdk.customer_id
GROUP BY 
	age_distrbution_subquery.customer_id,
	age_distrbution_subquery.customer_name,
    age_distrbution_subquery.customer_age_distribution
ORDER BY avg_expenditure DESC
LIMIT 1000;
---------------------------------------------------------------------------
-- Ranking Historical Customers based on their avg expenditure
SELECT 
	age_distrbution_subquery.customer_id,
    age_distrbution_subquery.customer_name,
    age_distrbution_subquery.customer_age_distribution,
    updated_gender,
	updated_job_industry_category,
	wealth_segment,
    ROUND(AVG(tdk.list_price), 3) AS avg_expenditure,
    DENSE_RANK() OVER (ORDER BY ROUND(AVG(tdk.list_price), 3) DESC)
FROM 
	(SELECT 
		customer_id,
		customer_name,
        updated_gender,
		updated_job_industry_category,
		wealth_segment,
		CASE 
			WHEN customer_age >= 18 AND customer_age <= 25 THEN '18-25'
			WHEN customer_age >= 26 AND customer_age <= 35 THEN '25-35'
			WHEN customer_age > 35 THEN 'Above 35'
			ELSE 'Below 18'
		END AS customer_age_distribution
	FROM 
		`customer_demographics kpmg`) AS age_distrbution_subquery
    JOIN `transaction dataset kpmg` AS tdk
    ON age_distrbution_subquery.customer_id = tdk.customer_id
GROUP BY 
	age_distrbution_subquery.customer_id,
	age_distrbution_subquery.customer_name,
    age_distrbution_subquery.customer_age_distribution,
    updated_gender,
	updated_job_industry_category,
	wealth_segment
ORDER BY avg_expenditure DESC
LIMIT 1000;

---------------------------------------------------------------------------
-- agewise customer distribution of historical customers by High Avg Spending
SELECT 
	avg_spending.customer_age_distribution,
    SUM(avg_spending.avg_expenditure) AS agewise_avg_expenditure,
    COUNT(avg_spending.customer_age_distribution) AS agewise_customer_count
FROM
	(SELECT 
		age_distrbution_subquery.customer_id,
		age_distrbution_subquery.customer_name,
		age_distrbution_subquery.customer_age_distribution,
		ROUND(AVG(tdk.list_price), 0) AS avg_expenditure
	FROM 
		(SELECT 
			customer_id,
			customer_name,
            updated_gender,
			updated_job_industry_category,
			wealth_segment,
			CASE 
				WHEN customer_age >= 18 AND customer_age <= 25 THEN '18-25'
				WHEN customer_age >= 26 AND customer_age <= 35 THEN '25-35'
				WHEN customer_age > 35 THEN 'Above 35'
				ELSE 'Below 18'
			END AS customer_age_distribution
		FROM 
			`customer_demographics kpmg`) AS age_distrbution_subquery
		JOIN `transaction dataset kpmg` AS tdk
		ON age_distrbution_subquery.customer_id = tdk.customer_id
	GROUP BY 
		age_distrbution_subquery.customer_id,
		age_distrbution_subquery.customer_name,
		age_distrbution_subquery.customer_age_distribution
	ORDER BY avg_expenditure DESC
	LIMIT 1000) AS avg_spending
GROUP BY avg_spending.customer_age_distribution
ORDER BY agewise_customer_count DESC;
----------------------------------------------------------------------------------
-- Genderwise Distribution of Historical Customers (Avg Expenditure)
SELECT
	updated_gender,
    COUNT(updated_gender) AS total_historical_customer
FROM 
	(SELECT 
	age_distrbution_subquery.customer_id,
    age_distrbution_subquery.customer_name,
    age_distrbution_subquery.customer_age_distribution,
    updated_gender,
	updated_job_industry_category,
	wealth_segment,
    ROUND(AVG(tdk.list_price), 3) AS avg_expenditure,
    DENSE_RANK() OVER (ORDER BY ROUND(AVG(tdk.list_price), 3) DESC)
FROM 
	(SELECT 
		customer_id,
		customer_name,
        updated_gender,
		updated_job_industry_category,
		wealth_segment,
		CASE 
			WHEN customer_age >= 18 AND customer_age <= 25 THEN '18-25'
			WHEN customer_age >= 26 AND customer_age <= 35 THEN '25-35'
			WHEN customer_age > 35 THEN 'Above 35'
			ELSE 'Below 18'
		END AS customer_age_distribution
	FROM 
		`customer_demographics kpmg`) AS age_distrbution_subquery
		JOIN `transaction dataset kpmg` AS tdk
		ON age_distrbution_subquery.customer_id = tdk.customer_id
	GROUP BY 
		age_distrbution_subquery.customer_id,
		age_distrbution_subquery.customer_name,
		age_distrbution_subquery.customer_age_distribution,
		updated_gender,
		updated_job_industry_category,
		wealth_segment
	ORDER BY avg_expenditure DESC
	LIMIT 1000) AS dense_ranked_historical_by_avg_expenditure
GROUP BY updated_gender
ORDER BY total_historical_customer DESC;
------------------------------------------------------------------------------
-- Job Industry Category wise distribution of Historical Customers
SELECT
	updated_job_industry_category,
    COUNT(updated_job_industry_category) AS total_historical_customer
FROM 
	(SELECT 
	age_distrbution_subquery.customer_id,
    age_distrbution_subquery.customer_name,
    age_distrbution_subquery.customer_age_distribution,
    updated_gender,
	updated_job_industry_category,
	wealth_segment,
    ROUND(AVG(tdk.list_price), 3) AS avg_expenditure,
    DENSE_RANK() OVER (ORDER BY ROUND(AVG(tdk.list_price), 3) DESC)
FROM 
	(SELECT 
		customer_id,
		customer_name,
        updated_gender,
		updated_job_industry_category,
		wealth_segment,
		CASE 
			WHEN customer_age >= 18 AND customer_age <= 25 THEN '18-25'
			WHEN customer_age >= 26 AND customer_age <= 35 THEN '25-35'
			WHEN customer_age > 35 THEN 'Above 35'
			ELSE 'Below 18'
		END AS customer_age_distribution
	FROM 
		`customer_demographics kpmg`) AS age_distrbution_subquery
		JOIN `transaction dataset kpmg` AS tdk
		ON age_distrbution_subquery.customer_id = tdk.customer_id
	GROUP BY 
		age_distrbution_subquery.customer_id,
		age_distrbution_subquery.customer_name,
		age_distrbution_subquery.customer_age_distribution,
		updated_gender,
		updated_job_industry_category,
		wealth_segment
	ORDER BY avg_expenditure DESC
	LIMIT 1000) AS dense_ranked_historical_by_avg_expenditure
GROUP BY updated_job_industry_category
ORDER BY total_historical_customer DESC;
------------------------------------------------------------------------------
-- Wealth segment wise distribution of historical customers
SELECT
	wealth_segment,
    COUNT(wealth_segment) AS total_historical_customer
FROM 
	(SELECT 
	age_distrbution_subquery.customer_id,
    age_distrbution_subquery.customer_name,
    age_distrbution_subquery.customer_age_distribution,
    updated_gender,
	updated_job_industry_category,
	wealth_segment,
    ROUND(AVG(tdk.list_price), 3) AS avg_expenditure,
    DENSE_RANK() OVER (ORDER BY ROUND(AVG(tdk.list_price), 3) DESC)
FROM 
	(SELECT 
		customer_id,
		customer_name,
        updated_gender,
		updated_job_industry_category,
		wealth_segment,
		CASE 
			WHEN customer_age >= 18 AND customer_age <= 25 THEN '18-25'
			WHEN customer_age >= 26 AND customer_age <= 35 THEN '25-35'
			WHEN customer_age > 35 THEN 'Above 35'
			ELSE 'Below 18'
		END AS customer_age_distribution
	FROM 
		`customer_demographics kpmg`) AS age_distrbution_subquery
		JOIN `transaction dataset kpmg` AS tdk
		ON age_distrbution_subquery.customer_id = tdk.customer_id
	GROUP BY 
		age_distrbution_subquery.customer_id,
		age_distrbution_subquery.customer_name,
		age_distrbution_subquery.customer_age_distribution,
		updated_gender,
		updated_job_industry_category,
		wealth_segment
	ORDER BY avg_expenditure DESC
	LIMIT 1000) AS dense_ranked_historical_by_avg_expenditure
GROUP BY wealth_segment
ORDER BY total_historical_customer DESC;