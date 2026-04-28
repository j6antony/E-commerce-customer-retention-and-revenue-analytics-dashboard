# E-Commerce Customer Retention & Revenue Analytics Dashboard

## Project Overview

This project is an end-to-end analytics dashboard built to analyze customer retention, revenue performance, product performance, and churn risk for an e-commerce business.

The goal of this project is to simulate a real business analytics workflow where raw transactional data is cleaned, modeled, analyzed using SQL, and visualized in Power BI for decision-making.

This project is designed to showcase skills in SQL, data modeling, business intelligence, dashboard design, and data storytelling.

## Business Problem

E-commerce businesses often generate a large amount of transactional data, but raw sales data alone does not clearly show where revenue is coming from, which customers are most valuable, or where the business may be losing customers.

This project answers questions such as:

- Which products and categories generate the most revenue?
- Which customer segments are most valuable?
- How much revenue comes from returning customers?
- Which customers may be at risk of churning?
- How does revenue change over time?
- Which regions or markets perform best?
- What business actions could improve retention and revenue?

## Tools Used

- **SQL**: Data cleaning, transformation, joins, aggregations, CTEs, and KPI calculations
- **Power BI**: Dashboard creation, data visualization, slicers, filters, and executive reporting
- **Excel / CSV**: Raw dataset storage and initial review
- **GitHub**: Project documentation and version control

## Dataset

The project uses a public or simulated e-commerce dataset containing customer, order, product, payment, and regional information.

Example tables:

- `customers`
- `orders`
- `order_items`
- `products`
- `payments`
- `regions`

## Database Schema

The database is designed using a relational structure.

### Main Relationships

```text
customers.customer_id → orders.customer_id
orders.order_id → order_items.order_id
products.product_id → order_items.product_id
orders.order_id → payments.order_id
customers.region_id → regions.region_id
```

## Key Metrics

The dashboard focuses on the following KPIs:

- Total Revenue
- Total Orders
- Average Order Value
- Total Customers
- New Customers
- Returning Customers
- Repeat Customer Rate
- Customer Lifetime Value
- Churn-Risk Customers
- Revenue by Product Category
- Revenue by Region
- Monthly Revenue Trend

## SQL Analysis

The SQL portion of the project includes:

- Creating relational tables
- Importing raw data
- Cleaning missing or duplicated records
- Standardizing date and category fields
- Joining multiple tables together
- Creating reporting-ready views
- Calculating business KPIs
- Segmenting customers based on purchase behavior

### Example SQL Query

```sql
WITH customer_orders AS (
    SELECT
        customer_id,
        MIN(order_date) AS first_order_date,
        MAX(order_date) AS last_order_date,
        COUNT(order_id) AS total_orders,
        SUM(order_total) AS lifetime_value
    FROM orders
    WHERE order_status = 'completed'
    GROUP BY customer_id
)

SELECT
    customer_id,
    first_order_date,
    last_order_date,
    total_orders,
    lifetime_value,
    CASE
        WHEN last_order_date < CURRENT_DATE - INTERVAL '90 days'
        THEN 'Churn Risk'
        ELSE 'Active'
    END AS customer_status
FROM customer_orders;
```

## Power BI Dashboard

The Power BI dashboard is divided into multiple pages to make the analysis easy to understand.

### Page 1: Executive Overview

This page gives a high-level view of overall business performance.

Includes:

- Total revenue
- Total orders
- Average order value
- Total customers
- Monthly revenue trend
- Revenue by category
- Revenue by region

### Page 2: Customer Retention

This page focuses on customer behavior and retention.

Includes:

- New vs returning customers
- Repeat customer rate
- Churn-risk customers
- Customer lifetime value
- Customer purchase frequency
- Retention trends over time

### Page 3: Product Performance

This page identifies the strongest and weakest product areas.

Includes:

- Top products by revenue
- Top products by quantity sold
- Revenue by product category
- Low-performing products
- Product contribution to total revenue

### Page 4: Regional Analysis

This page compares performance across different locations.

Includes:

- Revenue by region
- Orders by region
- Average order value by region
- Customer distribution by region

## Dashboard Preview

Screenshots will be added after the Power BI dashboard is completed.

```text
/images/dashboard_overview.png
/images/customer_retention.png
/images/product_performance.png
/images/regional_analysis.png
```

## Project Folder Structure

```text
ecommerce-retention-dashboard/
│
├── data/
│   ├── raw/
│   └── cleaned/
│
├── sql/
│   ├── 01_create_tables.sql
│   ├── 02_clean_data.sql
│   ├── 03_analysis_queries.sql
│   └── 04_reporting_views.sql
│
├── powerbi/
│   └── ecommerce_dashboard.pbix
│
├── images/
│   ├── dashboard_overview.png
│   ├── customer_retention.png
│   ├── product_performance.png
│   └── regional_analysis.png
│
└── README.md
```

## Business Insights

Final insights will depend on the dataset used, but the analysis will aim to identify findings such as:

1. Returning customers may generate a large percentage of total revenue compared to one-time buyers.
2. Certain product categories may drive most of the business's revenue.
3. Some customer segments may show signs of churn based on recent inactivity.
4. Regional differences may reveal opportunities for targeted marketing or expansion.
5. Improving repeat purchase behavior may have a strong impact on long-term revenue.

## Business Recommendations

Based on the analysis, this project will provide recommendations such as:

- Target churn-risk customers with re-engagement campaigns.
- Invest more marketing budget into high-performing product categories.
- Create loyalty offers for repeat customers.
- Improve underperforming regions through localized promotions.
- Monitor customer lifetime value to identify high-value customer segments.

## Skills Demonstrated

This project demonstrates:

- SQL data cleaning and transformation
- Relational database design
- Joining and aggregating multiple tables
- KPI creation
- Customer segmentation
- Churn-risk analysis
- Power BI dashboard design
- Business intelligence reporting
- Data storytelling
- Translating data into business recommendations

## Future Improvements

Possible future improvements include:

- Adding Python for automated data cleaning
- Building a predictive churn model
- Adding profit margin and cost analysis
- Creating a live database connection
- Publishing the dashboard to Power BI Service
- Adding row-level security for business users

## Project Status

Currently planned / in progress.

The final version will include the completed SQL scripts, Power BI dashboard file, screenshots, and final business insights.
