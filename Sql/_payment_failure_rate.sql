
-- Business Question:
-- Which payment method has the highest failure rate?

SELECT
    payment_method,
    COUNT(*) AS total_payments,
    SUM(is_failed) AS failed_payments,
    ROUND(
        100.0 * SUM(is_failed)
        / NULLIF(COUNT(*), 0),
        2
    ) AS failure_rate_percent
FROM fact_payments
GROUP BY payment_method
ORDER BY failure_rate_percent DESC
LIMIT 1;
