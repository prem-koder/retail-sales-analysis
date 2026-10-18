
-- Business Question:
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
GROUP BY
    c.country_id,
    c.country_name
ORDER BY total_revenue DESC
LIMIT 1;
