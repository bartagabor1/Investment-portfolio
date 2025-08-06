-- Purpose: Retrieve last 3 transactions per investment by value using RANK()
SELECT *
FROM (
    SELECT
        t.investment_id,
        t.transaction_date,
        t.transaction_type,
        t.quantity,
        t.price_per_unit,
        RANK() OVER (
            PARTITION BY t.investment_id
            ORDER BY t.transaction_date DESC
        ) AS transaction_rank
    FROM transactions t
) AS ranked
WHERE ranked.transaction_rank <= 3;

