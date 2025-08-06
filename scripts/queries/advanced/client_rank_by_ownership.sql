-- -- Purpose: Rank clients based on total portfolio value they own.
WITH client_ownership AS (
    SELECT 
        c.client_id,
        CONCAT(c.first_name, ' ', c.last_name) AS client_name,
        SUM(p.total_value * cp.allocation_percentage / 100) AS owned_value
    FROM 
        clients c
    JOIN 
        client_portfolios cp ON c.client_id = cp.client_id
    JOIN 
        portfolios p ON cp.portfolio_id = p.portfolio_id
    WHERE 
        cp.allocation_percentage IS NOT NULL
    GROUP BY 
        c.client_id, client_name
)

SELECT
    client_id,
    client_name,
    owned_value,
    RANK() OVER (ORDER BY owned_value DESC) AS client_rank
FROM
    client_ownership;
