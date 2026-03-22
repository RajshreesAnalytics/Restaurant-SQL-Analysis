-- Restaurant Sales Analysis

-- Total Orders
SELECT COUNT(DISTINCT order_id) AS total_orders
FROM order_details;

-- Total Revenue
SELECT SUM(mi.price) AS total_revenue
FROM order_details od
JOIN menu_items mi
ON od.item_id = mi.menu_item_id;

-- Top 5 Most Ordered Items
SELECT mi.item_name, COUNT(*) AS total_orders
FROM order_details od
JOIN menu_items mi
ON od.item_id = mi.menu_item_id
GROUP BY mi.item_name
ORDER BY total_orders DESC
LIMIT 5;

-- Orders by Category
SELECT mi.category, COUNT(*) AS total_orders
FROM order_details od
JOIN menu_items mi
ON od.item_id = mi.menu_item_id
GROUP BY mi.category
ORDER BY total_orders DESC;
