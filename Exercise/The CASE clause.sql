SELECT 
	CONCAT(first_name, ' ',last_name ) AS customer,
	points,
	CASE
		WHEN points BETWEEN 0 AND 1000 THEN 'Bronze' 	-- POINTS > 3000
		WHEN points BETWEEN 1000 AND 3000 THEN 'Silver' -- POINT >= 2000
		WHEN points > 3000 THEN 'Gold'					-- ELSE 'BRONZE'
        ELSE 'None'
	END AS category 
FROM sql_store.customers
ORDER BY points DESC;