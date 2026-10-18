-- Which month generated the most revenue?
SELECT
    d.year AS year,
    d.month AS month,
    d.month_name,
    SUM(f.gross_amount) AS total_revenue
FROM fact_sales f
JOIN dim_date d
    ON f.date_key = d.date_key
GROUP BY d.year, d.month, d.month_name
ORDER BY sum(f.gross_amount) desc limit 1;

-- Which products generated the most revenue?
SELECT
    p.product_name,
    SUM(f.gross_amount) AS total_revenue
FROM fact_sales f
JOIN dim_products p
    ON f.product_id = p.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_revenue DESC
LIMIT 1;


-- Which country generated the most revenue?

SELECT
    c.country_name,
    SUM(f.gross_amount) AS total_revenue
FROM fact_sales f
JOIN dim_customers cs
    ON f.customer_id = cs.customer_id
JOIN dim_states s
    ON cs.state_name = s.state_name
JOIN dim_country c
    ON s.country_id = c.country_id
GROUP BY c.country_id, c.country_name
ORDER BY total_revenue DESC LIMIt 1;

-- Which customers are repeat customers?
-- Count unique customers in the customer table
WITH customer_order_counts AS (
    SELECT
        customer_id,
        COUNT(order_id) AS total_orders
    FROM dim_orders
    GROUP BY customer_id
),
customer_summary AS (
    SELECT
        COUNT(*) AS customers_with_orders,
        SUM(CASE
            WHEN total_orders >= 2 THEN 1
            ELSE 0
        END) AS repeat_customers
    FROM customer_order_counts
)
SELECT
    customers_with_orders,
    repeat_customers,
    ROUND(
        repeat_customers * 100.0 / NULLIF(customers_with_orders, 0),
        2
    ) AS repeat_customer_rate
FROM customer_summary;
 
-- Which payment method has the highest failure rate?
SELECT
    payment_method,
    COUNT(*) AS total_payments,
    SUM(is_failed) AS failed_payments,
    ROUND(
        100.0 * SUM(is_failed) / NULLIF(COUNT(*), 0),
        2
    ) AS failure_rate_percent
FROM fact_payments
GROUP BY payment_method
ORDER BY failure_rate_percent DESC Limit 1;