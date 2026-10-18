
-- Business Question:
-- Which month generated the most revenue?

SELECT
    d.year AS year,
    d.month AS month,
    d.month_name,
    SUM(f.gross_amount) AS total_revenue
FROM fact_sales f
JOIN dim_date d
    ON f.date_key = d.date_key
GROUP BY
    d.year,
    d.month,
    d.month_name
ORDER BY total_revenue DESC
LIMIT 1;
