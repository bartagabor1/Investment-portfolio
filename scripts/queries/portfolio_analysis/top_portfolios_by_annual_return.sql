-- Shows top-performing portfolios based on yearly return
SELECT 
    p.portfolio_id,
    p.portfolio_name,
    EXTRACT(YEAR FROM r.return_date) AS year,
    SUM(r.return_percentage) AS yearly_return
FROM 
    returns r
JOIN 
    portfolios p ON r.portfolio_id = p.portfolio_id
GROUP BY 
    p.portfolio_id, p.portfolio_name, year
ORDER BY 
    yearly_return DESC;
