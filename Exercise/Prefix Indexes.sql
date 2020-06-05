USE sql_store;
SELECT 
	COUNT(DISTINCT LEFT(last_name,1)),
    COUNT(DISTINCT LEFT(last_name,5)),
    COUNT(DISTINCT LEFT(last_name,10))
FROM customers;
-- 5 we get the best bang for our buck

EXPLAIN SELECT customer_id FROM customers WHERE last_name = 'Gonet';

CREATE INDEX idx_last_name ON customers(last_name(5));