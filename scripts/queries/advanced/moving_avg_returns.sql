-- Calculates the 3-month moving average of monthly returns for each portfolio.
-- Useful for identifying short-term trends and smoothing return volatility over time.
WITH monthly_returns AS (
    SELECT
        portfolio_id,
        DATE_TRUNC('month', return_date) AS month,
        AVG(return_percentage) AS monthly_return
    FROM
        returns
    GROUP BY
        portfolio_id, month
)

SELECT
    portfolio_id,
    month,
    monthly_return,
    ROUND(AVG(monthly_return) OVER (
        PARTITION BY portfolio_id
        ORDER BY month
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ), 2) AS moving_avg_return
FROM
    monthly_returns
ORDER BY
    portfolio_id, month;
