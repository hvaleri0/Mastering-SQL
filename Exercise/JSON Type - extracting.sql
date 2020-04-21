-- SELECT product_id, JSON_EXTRACT(properties, '$.weight') AS weight
SELECT 
	product_id, 
	properties -> '$.weight' AS weight,
    properties -> '$.dimensions[0]' AS dimensions,
    properties ->> '$.manufacturer.name' AS name,
    properties -> '$.age' AS age
FROM sql_store.products
WHERE properties ->> '$.manufacturer.name' = 'sony'