-- Finds clients whose risk tolerance mismatches their portfolio's risk level
SELECT 
    c.client_id,
    CONCAT(c.first_name, ' ', c.last_name) AS client_name,
    c.risk_tolerance AS client_risk,
    p.risk_level AS portfolio_risk
FROM 
    client_portfolios cp
JOIN 
    clients c ON cp.client_id = c.client_id
JOIN 
    portfolios p ON cp.portfolio_id = p.portfolio_id
WHERE 
    c.risk_tolerance != p.risk_level;
