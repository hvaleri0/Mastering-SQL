USE sql_store;
START TRANSACTION;
UPDATE customers
SET points = 30
WHERE customer_id=1;
COMMIT;