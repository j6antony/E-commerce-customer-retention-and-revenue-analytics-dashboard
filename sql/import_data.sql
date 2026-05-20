-- Customer dataset
COPY customers (
    customer_id,
    customer_unique_id,
    customer_zip_code_prefix,
    customer_city,
    customer_state
)
FROM '/Users/johanantony/Desktop/e-commerce/E-commerce-customer-retention-and-revenue-analytics-dashboard/data/raw/Brazilian E-Commerce Public Dataset by Olist/olist_customers_dataset.csv'
DELIMITER ','
CSV HEADER;

-- Orders dataset
COPY orders (
    order_id,
    customer_id,
    order_status,
    order_purchase_timestamp,
    order_approved_at,
    order_delivered_carrier_date,
    order_delivered_customer_date,
    order_estimated_delivery_date
)
FROM '/Users/johanantony/Desktop/e-commerce/E-commerce-customer-retention-and-revenue-analytics-dashboard/data/raw/Brazilian E-Commerce Public Dataset by Olist/olist_orders_dataset.csv'
DELIMITER ','
CSV HEADER;

-- Products dataset
COPY products (
    product_id,
    product_category_name,
    product_name_length,
    product_description_length,
    product_photos_qty,
    product_weight_g,
    product_length_cm,
    product_height_cm,
    product_width_cm
)
FROM '/Users/johanantony/Desktop/e-commerce/E-commerce-customer-retention-and-revenue-analytics-dashboard/data/raw/Brazilian E-Commerce Public Dataset by Olist/olist_products_dataset.csv'
DELIMITER ','
CSV HEADER;

-- Order items dataset
COPY order_items (
    order_id,
    order_item_id,
    product_id,
    seller_id,
    shipping_limit_date,
    price,
    freight_value
)
FROM '/Users/johanantony/Desktop/e-commerce/E-commerce-customer-retention-and-revenue-analytics-dashboard/data/raw/Brazilian E-Commerce Public Dataset by Olist/olist_order_items_dataset.csv'
DELIMITER ','
CSV HEADER;

-- Payments dataset
COPY payments (
    order_id,
    payment_sequential,
    payment_type,
    payment_installments,
    payment_value
)
FROM '/Users/johanantony/Desktop/e-commerce/E-commerce-customer-retention-and-revenue-analytics-dashboard/data/raw/Brazilian E-Commerce Public Dataset by Olist/olist_order_payments_dataset.csv'
DELIMITER ','
CSV HEADER;
