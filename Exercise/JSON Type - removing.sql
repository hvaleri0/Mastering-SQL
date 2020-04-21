USE sql_store;
UPDATE products
SET properties = JSON_REMOVE(
	properties,
    '$.age'
)
WHERE product_id = 1;