CREATE INDEX idx_points ON customers (points);
EXPLAIN
	SELECT customer_id FROM customers
    WHERE state = 'CA' 
    UNION
	SELECT customer_id FROM customers
    WHERE  points>1000