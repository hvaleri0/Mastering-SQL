USE sql_store;

SELECT 
	c.customer_id,
    c.first_name,
    c.last_name,
    c.state,
	SUM(quantity * unit_price) AS total
FROM customers c 
JOIN orders o USING (customer_id)
JOIN order_items oi USING(order_id)
WHERE state IN ('VA')
GROUP BY 
	c.customer_id,
    c.first_name,
    c.last_name,
    c.state
HAVING total > 100