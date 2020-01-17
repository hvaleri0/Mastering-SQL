SELECT 
	product_id,
	name,
    COUNT(*) AS orders,
    IF (COUNT(*) > 1, 'Many times', 'Once') AS frequency
FROM products p
JOIN order_items oi USING(product_id)
GROUP BY product_id