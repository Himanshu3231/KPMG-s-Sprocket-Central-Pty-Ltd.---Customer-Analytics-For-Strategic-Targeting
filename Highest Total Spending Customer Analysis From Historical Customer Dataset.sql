-- Top Historical Customers by Purchasing Behavior based on High Total Spending 
SELECT 
	age_distrbution_subquery.customer_id,
    age_distrbution_subquery.customer_name,
    age_distrbution_subquery.customer_age_distribution,
    ROUND(SUM(tdk.list_price), 3) AS total_expenditure
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
ORDER BY total_expenditure DESC
LIMIT 1000;
----------------------------------------------------------------------------------
-- Ranking Historical Customers based on their total expenditure
SELECT 
	age_distrbution_subquery.customer_id,
    age_distrbution_subquery.customer_name,
    age_distrbution_subquery.customer_age_distribution,
    updated_gender,
	updated_job_industry_category,
	wealth_segment,
    ROUND(SUM(tdk.list_price), 3) AS total_expenditure,
    DENSE_RANK() OVER (ORDER BY ROUND(SUM(tdk.list_price), 3) DESC)
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
ORDER BY 
	total_expenditure DESC
LIMIT 1000;
-------------------------------------------------------------
-- agewise customer distribution of historical customers by total high spending
SELECT 
	top_spending_customers.customer_age_distribution,
    SUM(top_spending_customers.total_expenditure) AS agewise_expenditure,
    COUNT(top_spending_customers.customer_age_distribution) AS agewise_customer_count
FROM
	(SELECT 
		age_distrbution_subquery.customer_id,
		age_distrbution_subquery.customer_name,
		age_distrbution_subquery.customer_age_distribution,
		ROUND(SUM(tdk.list_price), 3) AS total_expenditure
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
	ORDER BY total_expenditure DESC
	LIMIT 1000) AS top_spending_customers
GROUP BY 
	top_spending_customers.customer_age_distribution
ORDER BY agewise_customer_count DESC;
--------------------------------------------------------------------------------
-- Genderwise Distribution of Historical Customers
SELECT 
	updated_gender,
    COUNT(updated_gender) AS total_historical_customers
FROM 
	(SELECT 
	age_distrbution_subquery.customer_id,
    age_distrbution_subquery.customer_name,
    age_distrbution_subquery.customer_age_distribution,
    updated_gender,
	updated_job_industry_category,
	wealth_segment,
    ROUND(SUM(tdk.list_price), 3) AS total_expenditure,
    DENSE_RANK() OVER (ORDER BY ROUND(SUM(tdk.list_price), 3) DESC)
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
	LIMIT 1000) AS dense_ranked_historical_customers_by_total_spending
GROUP BY updated_gender
ORDER BY total_historical_customers DESC;
---------------------------------------------------------------------------
-- Job Industry Category wise Distribution of Historical Customers
SELECT 
	updated_job_industry_category,
    COUNT(updated_job_industry_category) AS total_historical_customers
FROM 
	(SELECT 
	age_distrbution_subquery.customer_id,
    age_distrbution_subquery.customer_name,
    age_distrbution_subquery.customer_age_distribution,
    updated_gender,
	updated_job_industry_category,
	wealth_segment,
    ROUND(SUM(tdk.list_price), 3) AS total_expenditure,
    DENSE_RANK() OVER (ORDER BY ROUND(SUM(tdk.list_price), 3) DESC)
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
	LIMIT 1000) AS dense_ranked_historical_customers_by_total_spending
GROUP BY updated_job_industry_category
ORDER BY total_historical_customers DESC;
-----------------------------------------------------------------------------------
-- Wealth Segment wise Distribution of Historical Customers
SELECT 
	wealth_segment,
    COUNT(wealth_segment) AS total_historical_customers
FROM 
	(SELECT 
	age_distrbution_subquery.customer_id,
    age_distrbution_subquery.customer_name,
    age_distrbution_subquery.customer_age_distribution,
    updated_gender,
	updated_job_industry_category,
	wealth_segment,
    ROUND(SUM(tdk.list_price), 3) AS total_expenditure,
    DENSE_RANK() OVER (ORDER BY ROUND(SUM(tdk.list_price), 3) DESC)
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
	LIMIT 1000) AS dense_ranked_historical_customers_by_total_spending
GROUP BY wealth_segment
ORDER BY total_historical_customers DESC;