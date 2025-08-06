-- Lists top clients by total transaction fees paid
SELECT 
    c.client_id,
    CONCAT(c.first_name, ' ', c.last_name) AS client_name,
    SUM(t.fees) AS total_fees_paid
FROM 
    client_portfolios cp
JOIN 
    portfolio_investments pi ON cp.portfolio_id = pi.portfolio_id
JOIN 
    transactions t ON t.investment_id = pi.investment_id
JOIN 
    clients c ON cp.client_id = c.client_id
GROUP BY 
    c.client_id, client_name
ORDER BY 
    total_fees_paid DESC
LIMIT 5;
