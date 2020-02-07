DROP PROCEDURE IF EXISTS get_invoices_by_client;

DELIMITER $$
CREATE PROCEDURE get_invoices_by_client
	(
		client_id INT(11) -- 1, 2, 56
	)
BEGIN
	SELECT * FROM invoices i
    WHERE i.client_id = client_id;
END$$

DELIMITER ;