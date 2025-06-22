-- Identify High-Value Customers

-- Who are the top 10% of customers based on total spending?
-- What is the average total spending per customer?
-- What is the frequency of purchases made by each customer?

SELECT 
	cdk.customer_id,
	cdk.customer_name,
    ROUND(SUM(IFNULL(tdk.updated_list_price, 0)), 2) AS customer_expenditure
FROM 
	`customer_demographics kpmg` AS cdk
    JOIN `transaction dataset kpmg` AS tdk
    ON cdk.customer_id = tdk.customer_id
GROUP BY cdk.customer_id, cdk.customer_name
ORDER BY customer_expenditure DESC
LIMIT 10;

SELECT 
	cdk.customer_id,
    cdk.customer_name,
    ROUND(AVG(tdk.updated_list_price), 2) AS avg_customer_expenditure
FROM 
	`customer_demographics kpmg` AS cdk
    JOIN `transaction dataset kpmg` AS tdk
    ON cdk.customer_id = tdk.customer_id
GROUP BY cdk.customer_id, cdk.customer_name
ORDER BY avg_customer_expenditure DESC;

SELECT
	cdk.customer_id,
    cdk.customer_name,
    COUNT(cdk.customer_id)  AS purchase_count
FROM 
	`customer_demographics kpmg` AS cdk
    JOIN `transaction dataset kpmg` AS tdk
    ON cdk.customer_id = tdk.customer_id
GROUP BY cdk.customer_id, cdk.customer_name
ORDER BY purchase_count DESC;