SELECT 
	date,
    pm.name,
    SUM(amount)
FROM payments p
JOIN payment_methods pm
	ON p.payment_method = pm.payment_method_id
-- WHERE payment_date IS NOT NULL
GROUP BY date, pm.name
ORDER BY date
