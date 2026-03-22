-- =========================================
-- SQL PROJECT: Restaurant Sales Analysis
-- =========================================

-- Objective:
-- Analyze menu performance and sales using order data

-- =========================================
-- BASIC METRICS
-- =========================================

-- 1. Total Orders
SELECT COUNT(DISTINCT order_id) AS total_orders
FROM order_details;

-- 2. Total Revenue
SELECT SUM(mi.price) AS total_revenue
FROM order_details od
JOIN menu_items mi
ON od.item_id = mi.menu_item_id;

-- =========================================
-- PRODUCT PERFORMANCE
-- =========================================

-- 3. Top 5 Most Ordered Items
SELECT mi.item_name, COUNT(*) AS total_orders
FROM order_details od
JOIN menu_items mi
ON od.item_id = mi.menu_item_id
GROUP BY mi.item_name
ORDER BY total_orders DESC
LIMIT 5;

-- 4. Least Ordered Items
SELECT mi.item_name, COUNT(*) AS total_orders
FROM order_details od
JOIN menu_items mi
ON od.item_id = mi.menu_item_id
GROUP BY mi.item_name
ORDER BY total_orders ASC
LIMIT 5;

-- =========================================
-- CATEGORY ANALYSIS
-- =========================================

-- 5. Orders by Category
SELECT mi.category, COUNT(*) AS total_orders
FROM order_details od
JOIN menu_items mi
ON od.item_id = mi.menu_item_id
GROUP BY mi.category
ORDER BY total_orders DESC;

-- 6. Revenue by Category
SELECT mi.category, SUM(mi.price) AS total_revenue
FROM order_details od
JOIN menu_items mi
ON od.item_id = mi.menu_item_id
GROUP BY mi.category
ORDER BY total_revenue DESC;

-- =========================================
-- PRICE ANALYSIS
-- =========================================

-- 7. Average Price per Category
SELECT category, AVG(price) AS avg_price
FROM menu_items
GROUP BY category
ORDER BY avg_price DESC;

-- 8. Most Expensive Item
SELECT item_name, price
FROM menu_items
ORDER BY price DESC
LIMIT 1;

-- =========================================
-- ADVANCED INSIGHT
-- =========================================

-- 9. Top 5 Revenue Generating Items
SELECT mi.item_name, SUM(mi.price) AS revenue
FROM order_details od
JOIN menu_items mi
ON od.item_id = mi.menu_item_id
GROUP BY mi.item_name
ORDER BY revenue DESC
LIMIT 5;
