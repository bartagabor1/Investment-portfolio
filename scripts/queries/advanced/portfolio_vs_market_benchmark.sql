-- Purpose: Compare each portfolio's average return to a fixed market benchmark value.
WITH portfolio_avg_returns AS (
    SELECT 
        portfolio_id,
        AVG(return_percentage) AS avg_portfolio_return
    FROM 
        returns
    GROUP BY 
        portfolio_id
),
market_avg_return AS (
    SELECT 
        AVG(return_percentage) AS avg_market_return
    FROM 
        returns
)

SELECT 
    p.portfolio_id,
    p.portfolio_name,
    pr.avg_portfolio_return,
    m.avg_market_return,
    ROUND(pr.avg_portfolio_return - m.avg_market_return, 2) AS difference
FROM 
    portfolio_avg_returns pr
JOIN 
    portfolios p ON p.portfolio_id = pr.portfolio_id,
    market_avg_return m;
