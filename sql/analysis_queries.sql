-- 1. find the Total revenue, orders, customers, and average order value
-- to do this we need to do an inner join on orders
SELECT 
    SUM(p.payment_value) AS total_revenue,
    COUNT(DISTINCT o.order_id) AS total_orders,
    COUNT(DISTINCT o.customer_id) AS total_customer,
    ROUND(SUM(p.payment_value) / COUNT(DISTINCT o.order_id), 2) AS avg_order_value
FROM orders o
JOIN payments p
    ON o.order_id = p.order_id
WHERE o.order_status = 'delivered';
-- 2. Monthly revenue trend
-- inner join used to join the payments table to orders
SELECT
    DATE_TRUNC('month', o.order_purchase_timestamp) AS order_month,
    SUM(p.payment_value) AS monthly_revenue,
    COUNT(DISTINCT o.order_id) AS monthly_orders
FROM orders o
JOIN payments p 
    ON o.order_id = p.order_id
WHERE o.order_status = 'delivered'
GROUP BY DATE_TRUNC('month', o.order_purchase_timestamp)
ORDER BY order_month;
-- 3. Top 10 product categories by revenue
-- double inner join required becuase the products produts table does not have the order id field
SELECT
    pr.product_category_name,
    SUM(oi.price + oi.freight_value) AS revenue
FROM order_items oi
JOIN products pr
    ON oi.product_id = pr.product_id
JOIN order o
    ON oi.order_id = o.order_id
WHERE o.order_status = 'delivered'
GROUP BY pr.product_category_name
ORDER BY revenue DESC
LIMIT 10;   
-- 4. Revenue by customer state
-- 2 inner joins required
SELECT
    c.customer_state,
    SUM(p.payment_value) AS totat_revenue,
    COUNT(DISTINCT o.order_id) AS totat_orders
FROM orders o
JOIN customer c
    ON o.customer_id = c.customer_id
JOIN payments p
    ON o.order_id = p.order_id
WHERE o.order_status = 'delivered'
GROUP BY c.customer_state
ORDER BY total_revenue DESC;
-- 5. Repeat customer trend
SELECT
    CASE 
        WHEN order_count = 1 THEN 'One-time customer'
        ELSE 'repeat customer'
    END AS customer_type,
    COUNT(*) AS customer_count
FROM (
    SELECT
        c.customer_unique_id,
        COUNT(DISTINCT o.order_id) AS order_count
    FROM order o
    JOIN customer c
        ON o.customer_id = c.customer_id
    WHERE o.order_status = 'delivered'
    GROUP BY c.customer_unique_id
) customer_orders
GROUP BY customer_type;


