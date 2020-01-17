USE sql_invoicing;

SELECT 
	client_id,
    name,
    (SELECT SUM(invoice_total)
		FROM invoices 
        WHERE client_id = c.client_id) AS total_sales,
	(SELECT AVG(invoice_total)
		FROM invoices) AS invoices_average,
	(SELECT total_sales - invoices_average) AS delta
FROM clients c;