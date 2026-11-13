-- Goldcomb Goods / Analyst Hive learning exercise.
-- SQL dialect is that of the original exercise, not SQLite.
-- Requires the Analyst Hive tables; no dataset is redistributed.

-- Day 1: all customer rows
SELECT COUNT(*) FROM customers;

-- Day 2: active customers per exercise's clarified definition
SELECT COUNT(DISTINCT c.customer_id) AS total_customers
FROM orders o JOIN customers c ON c.customer_id=o.customer_id
WHERE o.order_ts >= '2025-10-01' AND o.order_ts < '2026-10-01'
AND o.status IN ('completed','refunded') AND c.is_test_account=FALSE;

-- Day 3: September refund records
SELECT COUNT(*) AS refunds FROM refunds
WHERE refund_ts >= '2026-09-01' AND refund_ts < '2026-10-01';

-- Day 3: orders with multiple September refund records
SELECT COUNT(*) FROM (
 SELECT DISTINCT order_id FROM refunds
 WHERE refund_ts >= '2026-09-01' AND refund_ts < '2026-10-01'
 GROUP BY order_id HAVING COUNT(*)>1
) duplicates;

-- Day 3: product with most attributed September refund dollars
-- Caution: full order-level refund amount is attributed to every joined product.
WITH september_refunds AS (
 SELECT DISTINCT order_id,amount FROM refunds
 WHERE refund_ts >= '2026-09-01' AND refund_ts < '2026-10-01'
)
SELECT p.product_name,SUM(r.amount) AS refunded
FROM september_refunds r JOIN order_items oi ON oi.order_id=r.order_id
JOIN products p ON p.product_id=oi.product_id
GROUP BY p.product_name ORDER BY refunded DESC LIMIT 1;

-- Day 4: Sales gross sales (Eastern daylight time, all statuses)
SELECT SUM(oi.quantity*oi.unit_price) AS gross_sales
FROM orders o JOIN order_items oi ON oi.order_id=o.order_id
WHERE o.order_ts - INTERVAL 4 HOUR >= '2026-09-01'
AND o.order_ts - INTERVAL 4 HOUR < '2026-10-01';

-- Day 4: Finance sales before refunds (UTC, excluding cancelled)
SELECT SUM(oi.quantity*oi.unit_price) AS sales
FROM orders o JOIN order_items oi ON oi.order_id=o.order_id
WHERE o.status <> 'cancelled'
AND o.order_ts >= '2026-09-01' AND o.order_ts < '2026-10-01';

-- Day 4: Finance net revenue
WITH sales AS (
 SELECT SUM(oi.quantity*oi.unit_price) AS sales
 FROM orders o JOIN order_items oi ON oi.order_id=o.order_id
 WHERE o.status <> 'cancelled'
 AND o.order_ts >= '2026-09-01' AND o.order_ts < '2026-10-01'
), refunded AS (
 SELECT SUM(amount) AS refunds FROM (
  SELECT DISTINCT order_id,amount FROM refunds
  WHERE refund_ts >= '2026-09-01' AND refund_ts < '2026-10-01'
 )
)
SELECT sales - refunds AS net_revenue FROM sales,refunded;

-- Day 5: sales by UTC month
SELECT DATE_TRUNC('month',o.order_ts) AS month,
SUM(oi.quantity*oi.unit_price) AS sales
FROM orders o JOIN order_items oi ON oi.order_id=o.order_id
WHERE o.status <> 'cancelled'
AND o.order_ts >= '2026-06-01' AND o.order_ts < '2026-10-01'
GROUP BY DATE_TRUNC('month',o.order_ts) ORDER BY month ASC;

-- Day 5: monthly refunds
SELECT month,SUM(amount) AS refunds FROM (
 SELECT DISTINCT order_id,amount,DATE_TRUNC('month',refund_ts) AS month
 FROM refunds
) WHERE month >= '2026-06-01' AND month < '2026-10-01'
GROUP BY month ORDER BY month ASC;

-- Day 5: net revenue and month-over-month change
WITH sales AS (
 SELECT DATE_TRUNC('month',o.order_ts) AS month,
 SUM(oi.quantity*oi.unit_price) AS sales
 FROM orders o JOIN order_items oi ON oi.order_id=o.order_id
 WHERE o.status <> 'cancelled'
 AND o.order_ts >= '2026-06-01' AND o.order_ts < '2026-10-01'
 GROUP BY 1
), refunded AS (
 SELECT month,SUM(amount) AS refunds FROM (
  SELECT DISTINCT order_id,amount,DATE_TRUNC('month',refund_ts) AS month
  FROM refunds
 ) GROUP BY 1
), monthly AS (
 SELECT s.month,s.sales-COALESCE(r.refunds,0) AS net_revenue
 FROM sales s LEFT JOIN refunded r ON r.month=s.month
)
SELECT month,net_revenue,
ROUND(100.0*(net_revenue/LAG(net_revenue) OVER (ORDER BY month)-1),1) AS mom_change_pct
FROM monthly ORDER BY month;
