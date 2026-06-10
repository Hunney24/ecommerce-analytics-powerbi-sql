CREATE DATABASE ecommerce_analytics;
USE ecommerce_analytics;
SELECT COUNT(*) AS customer_count
FROM customers;
SELECT *
FROM customers
LIMIT 5;
show tables;
SELECT COUNT(*) FROM customers;
SELECT COUNT(*) FROM sessions;
SELECT COUNT(*) FROM products;
SELECT COUNT(*) FROM orders;
SELECT COUNT(*) FROM order_items;
SELECT COUNT(*) FROM reviews;
SELECT COUNT(*) FROM events;


DESCRIBE customers;
DESCRIBE sessions;
DESCRIBE events;
DESCRIBE orders;
DESCRIBE order_items;
DESCRIBE products;
DESCRIBE reviews;
---
SELECT
    COUNT(*) AS total_orders,
    ROUND(SUM(total_usd),2) AS total_revenue,
    ROUND(AVG(total_usd),2) AS avg_order_value
FROM orders;
SELECT
    country,
    COUNT(*) AS orders,
    ROUND(SUM(total_usd),2) AS revenue
FROM orders
GROUP BY country
ORDER BY revenue DESC;
SELECT
    source,
    COUNT(*) AS orders,
    ROUND(SUM(total_usd),2) AS revenue
FROM orders
GROUP BY source
ORDER BY revenue DESC;
---
SELECT
    customer_id,
    COUNT(*) AS total_orders,
    ROUND(SUM(total_usd),2) AS lifetime_value
FROM orders
GROUP BY customer_id
ORDER BY lifetime_value DESC
LIMIT 10;
---
SELECT
    p.name,
    p.category,
    ROUND(SUM(oi.line_total_usd),2) AS revenue
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
GROUP BY p.name, p.category
ORDER BY revenue DESC
LIMIT 10;
---
SELECT
    p.category,
    ROUND(SUM(oi.line_total_usd),2) AS revenue
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
GROUP BY p.category
ORDER BY revenue DESC;
---
SELECT
    p.category,
    ROUND(AVG(r.rating),2) AS avg_rating,
    COUNT(*) AS reviews
FROM reviews r
JOIN products p
    ON r.product_id = p.product_id
GROUP BY p.category
ORDER BY avg_rating DESC;
---
SELECT
    event_type,
    COUNT(*) AS events
FROM events
GROUP BY event_type
ORDER BY events DESC;
---

SHOW FULL TABLES;
---
SELECT COUNT(*) FROM EVENTS;