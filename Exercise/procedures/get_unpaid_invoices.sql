DROP PROCEDURE IF EXISTS get_unpaid_invoices;

DELIMITER $$
CREATE PROCEDURE get_unpaid_invoices
	(
		client_id INT,
        OUT invoice_count INT,
        OUT invoices_total DECIMAL(9, 2)        
    )
BEGIN
	SELECT COUNT(*), SUM(invoice_total)
    INTO invoice_count, invoices_total
    FROM invoices i
    WHERE i.client_id = client_id
		AND payment_total = 0;
END$$
DELIMITER ;