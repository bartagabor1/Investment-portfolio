-- Summarizes monthly transaction counts and values for Power BI visuals
SELECT 
    t.transaction_type,
    DATE_TRUNC('month', t.transaction_date) AS month,
    COUNT(*) AS transaction_count,
    SUM(t.total_value) AS total_value
FROM 
    transactions t
GROUP BY 
    t.transaction_type, month
ORDER BY 
    month;
