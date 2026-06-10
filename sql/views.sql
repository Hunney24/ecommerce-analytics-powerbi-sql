CREATE VIEW vw_funnel_metrics AS
SELECT
    SUM(CASE WHEN event_type='page_view' THEN 1 ELSE 0 END) AS page_views,
    SUM(CASE WHEN event_type='add_to_cart' THEN 1 ELSE 0 END) AS add_to_cart,
    SUM(CASE WHEN event_type='checkout' THEN 1 ELSE 0 END) AS checkout_events,
    SUM(CASE WHEN event_type='purchase' THEN 1 ELSE 0 END) AS purchases
FROM events;
---
SELECT * FROM vw_funnel_metrics;
---
CREATE VIEW vw_funnel_conversion AS
SELECT
    546458 AS page_views,
    145042 AS add_to_cart,
    44909 AS checkout_events,
    33580 AS purchases,

    ROUND((145042/546458)*100,2) AS page_to_cart_pct,
    ROUND((44909/145042)*100,2) AS cart_to_checkout_pct,
    ROUND((33580/44909)*100,2) AS checkout_to_purchase_pct,
    ROUND((33580/546458)*100,2) AS overall_conversion_pct;
    ---
    SELECT * FROM vw_funnel_conversion;