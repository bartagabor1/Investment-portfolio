-- Calculates time-weighted return for each portfolio
SELECT 
    p.portfolio_name,
    ROUND(SUM(r.return_percentage * pi.quantity * pi.purchase_price) / 
          SUM(pi.quantity * pi.purchase_price), 2) AS weighted_return
FROM 
    returns r
JOIN 
    portfolio_investments pi ON r.portfolio_id = pi.portfolio_id AND r.investment_id = pi.investment_id
JOIN 
    portfolios p ON p.portfolio_id = r.portfolio_id
GROUP BY 
    p.portfolio_name;
