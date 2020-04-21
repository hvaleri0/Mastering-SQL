USE sql_store;
UPDATE products
-- SET properties = '
-- {
-- 	"dimensions": [1, 2, 3],
--     "weight": 10,
--     "manufacturer": {"name": "sony"}
-- }
-- '

-- MY SQL internal functions:
SET properties = JSON_OBJECT(
	'weight', 10,
    'dimensions', JSON_ARRAY(1, 2, 3),
    'manufacturer', JSON_OBJECT('name', 'sony')
)
WHERE product_id = 1;