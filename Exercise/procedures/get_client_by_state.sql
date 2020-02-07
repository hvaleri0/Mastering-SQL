DROP PROCEDURE IF EXISTS get_clientS_by_state;

DELIMITER $$
CREATE PROCEDURE get_clients_by_state
(
	state CHAR(2) -- NY, MI, etc
)
BEGIN
	SELECT * FROM clients c
    WHERE c.state = IFNULL(state ,c.state);
END$$
DELIMITER ;
