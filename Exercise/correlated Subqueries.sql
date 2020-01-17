-- GET invoices that are larger than the
-- client's average invoice ammount

USE sql_invoicing;
SELECT * 
FROM invoices i
WHERE invoice_total > (
	SELECT AVG(invoice_total)
    FROM invoices
    WHERE client_id = i.client_id
)
