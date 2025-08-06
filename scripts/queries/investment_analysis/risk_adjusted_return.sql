-- Computes risk-adjusted return scores for investments
SELECT 
    i.name AS investment_name,
    i.risk_level,
    AVG(r.return_percentage) AS avg_return,
    CASE 
        WHEN i.risk_level = 'low' THEN AVG(r.return_percentage) / 1
        WHEN i.risk_level = 'medium' THEN AVG(r.return_percentage) / 2
        WHEN i.risk_level = 'high' THEN AVG(r.return_percentage) / 3
    END AS risk_adjusted_score
FROM 
    returns r
JOIN 
    investments i ON r.investment_id = i.investment_id
GROUP BY 
    i.name, i.risk_level
ORDER BY 
    risk_adjusted_score DESC;
