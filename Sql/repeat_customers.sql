
-- Business Question:
-- How many customers are repeat customers?
-- Definition: Customers with at least 2 orders.


-- Repeat Customers with at least 2 orders 


-- Total_orders 
WITH customer_order_counts AS (
    SELECT
        customer_id,
        COUNT(order_id) AS total_orders
    FROM dim_orders
    GROUP BY customer_id
),
-- Repeat Customers count
customer_summary AS (
    SELECT
        COUNT(*) AS customers_with_orders,
        SUM(
            CASE
                WHEN total_orders >= 2 THEN 1
                ELSE 0
            END
        ) AS repeat_customers
    FROM customer_order_counts
)
-- repeat_customer_rate 
SELECT
    customers_with_orders,
    repeat_customers,
    ROUND(
        repeat_customers * 100.0
        / NULLIF(customers_with_orders, 0),
        2
    ) AS repeat_customer_rate
FROM customer_summary;
