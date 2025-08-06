-- Lists portfolios with the highest number of distinct investments
SELECT 
    pi.portfolio_id,
    COUNT(DISTINCT pi.investment_id) AS investment_count
FROM 
    portfolio_investments pi
GROUP BY 
    pi.portfolio_id
ORDER BY 
    investment_count DESC;
