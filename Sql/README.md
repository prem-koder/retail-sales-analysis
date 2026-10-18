# Retail Sales Analysis Using SQL

## Project Overview

This project analyzes retail sales data using **MySQL** to answer business questions about revenue performance, product performance, customer purchasing behavior, and payment failures.

The objective is to use SQL queries to transform structured retail data into meaningful business findings and identify opportunities for further investigation and improvement.

This project demonstrates practical SQL skills used in data analysis, including joining tables, aggregating data, calculating percentages, using Common Table Expressions (CTEs), and interpreting query results.

## Business Objectives

The project focuses on five business questions:

1. Which month generated the highest revenue?
2. Which product generated the highest revenue?
3. Which country generated the highest revenue?
4. How many customers are repeat customers?
5. Which payment method has the highest failure rate?

## Tools and Technologies

- **Database:** MySQL
- **Query Language:** SQL
- **SQL Environment:** MySQL Workbench
- **Version Control:** Git and GitHub (for project publishing)

## Dataset and Database Structure

The project uses a relational retail dataset containing sales, customer, product, date, order, location, and payment information.

| Table | Purpose |
|---|---|
| `fact_sales` | Contains sales records and gross revenue amounts |
| `dim_date` | Contains date, month, and year information |
| `dim_products` | Contains product details |
| `dim_customers` | Contains customer details and location information |
| `dim_states` | Maps states to countries |
| `dim_country` | Contains country information |
| `dim_orders` | Contains customer order records |
| `fact_payments` | Contains payment methods and payment failure information |

### Key Table Relationships

- `fact_sales.date_key` → `dim_date.date_key`
- `fact_sales.product_id` → `dim_products.product_id`
- `fact_sales.customer_id` → `dim_customers.customer_id`
- `dim_customers.state_name` → `dim_states.state_name`
- `dim_states.country_id` → `dim_country.country_id`

The orders and payments tables support the repeat-customer and payment-failure analyses.

*Note: The state-name join assumes that `state_name` uniquely identifies the relevant state records. If state names can repeat across countries, a unique state key or a join using both state and country identifiers is safer.*

## SQL Skills Demonstrated

- `SELECT` and `WHERE` for retrieving and filtering records
- `JOIN` for combining related tables
- `GROUP BY` for aggregating business data
- Aggregate functions such as `SUM()` and `COUNT()`
- `ORDER BY` and `LIMIT` for identifying top-performing results
- Common Table Expressions (CTEs) for organizing multi-step analysis
- `CASE` expressions for conditional calculations
- `ROUND()` and `NULLIF()` for percentage calculations and division-by-zero protection
- Revenue analysis and payment failure rate calculations

## Business Questions and Key Findings

### 1. Which Month Generated the Highest Revenue?

**Finding:** August 2023 generated the highest monthly revenue in the analysis, totaling **9,094,605**.

**Business interpretation:** August was the strongest month by recorded revenue in the dataset. However, this result alone does not explain why revenue was higher.

**Recommended next steps:**
- Compare monthly order volume and average order value.
- Investigate whether discounts, promotions, or marketing campaigns contributed to the result.
- Compare August revenue with the same month in other years, if the dataset supports it.

### 2. Which Product Generated the Highest Revenue?

**Finding:** Pepperfry Bed Frame Queen Size Lite was the highest-revenue product, generating **247,682** in recorded revenue.

**Business interpretation:** This product contributed more revenue than any other individual product in the query results. Revenue alone does not establish whether it was the most profitable product.

**Recommended next steps:**
- Compare units sold across products.
- Examine product-level profit margins, if cost data is available.
- Review stock availability, discounts, and return rates before making inventory or promotional decisions.

### 3. Which Country Generated the Highest Revenue?

**Finding:** India generated the highest country-level revenue, totaling **60,721,693**.

**Business interpretation:** India was the leading country by recorded revenue in this analysis.

**Recommended next steps:**
- Calculate each country's percentage contribution to total revenue.
- Compare revenue with customer count and order volume.
- Analyze average order value by country to understand differences in purchasing behavior.

### 4. How Many Customers Are Repeat Customers?

**Definition:** A repeat customer is a customer who has placed **at least two orders**.

**Finding:** [Add the verified repeat-customer count, total customers with orders, and repeat-customer rate from the latest SQL query.]

The repeat-customer rate is calculated as:

`Repeat-customer rate = (Repeat customers / Customers with orders) × 100`

**Business interpretation:** Repeat-customer analysis helps measure how many customers return to make additional purchases.

**Recommended next steps:**
- Calculate the repeat-customer rate.
- Analyze how frequently customers place additional orders.
- Investigate customer retention patterns and the time between purchases.

### 5. Which Payment Method Has the Highest Failure Rate?

**Finding:** UPI had the highest reported payment failure rate, at **7.16%**.

**Business interpretation:** A higher payment failure rate may indicate friction in the payment process. The query identifies an area to investigate but does not establish the reason for the failures.

**Recommended next steps:**
- Compare total payment attempts and failed payments across methods.
- Investigate failure reasons and payment-provider performance, if those details are available.
- Monitor the failure rate over time to determine whether the issue is persistent.

*The failure-rate interpretation assumes that `is_failed` correctly identifies failed payment attempts and that the denominator represents the intended population of payment records.*

## Key Business Recommendations

Based on the query results, the following areas deserve further investigation:

1. **Monthly performance:** Investigate the factors associated with the revenue peak in August 2023.
2. **Product performance:** Evaluate product profitability, sales volume, and inventory before prioritizing top-revenue products.
3. **Geographic performance:** Compare country-level revenue contributions, customer counts, and average order values.
4. **Customer retention:** Measure repeat-customer behavior and identify opportunities to encourage additional purchases.
5. **Payment reliability:** Investigate payment failure patterns, especially for UPI, and track changes over time.

These are recommendations for further analysis, not claims that the underlying causes have already been proven.

## Project Limitations

- Findings depend on the accuracy and completeness of the available dataset.
- Revenue does not equal profit because product costs and other expenses may not be included.
- The highest-revenue month does not establish the cause of the increase.
- Repeat-customer metrics depend on the definition of a repeat customer and the denominator used.
- Payment failure analysis depends on accurate failure flags and the appropriate payment-attempt denominator.
- Geographic revenue results depend on correct and unique state-to-country relationships.

## Conclusion

This project demonstrates how SQL can be used to investigate practical retail business questions involving revenue, product performance, customer purchasing behavior, and payment reliability.

It applies core SQL techniques to structured data and translates query results into findings and recommendations for further investigation.

The project also provides a foundation for extending the analysis with additional metrics, visualizations, and business reporting.

## Project Structure

```text
retail-sales-analysis/
│
├── README.md
│
└── sql/
    ├── 01_monthly_revenue.sql
    ├── 02_top_product.sql
    ├── 03_revenue_by_country.sql
    ├── 04_repeat_customers.sql
    └── 05_payment_failure_rate.sql
```

## How to Use This Project

1. Open MySQL Workbench and connect to the MySQL server containing the dataset.
2. Select the database that contains the required tables.
3. Open the SQL files in the `sql` folder.
4. Run the queries to reproduce the analysis.
5. Compare the results with the findings documented above.

**Prerequisite:** The database and required tables must already exist. The SQL files contain the analysis queries; they do not necessarily create or load the dataset.

## Author

Prem Kumar

Project: Retail Sales Analysis Using SQL

