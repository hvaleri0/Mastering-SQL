SELECT
	client_id
    name,
    get_risk_factor_for_client(client_id) As risk_factor
FROM clients
