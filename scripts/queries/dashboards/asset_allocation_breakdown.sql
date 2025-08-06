-- This query summarizes the investments in the "investment_portfolio" database.
-- Its goal is to calculate the total invested amount per asset category.

SELECT 
    i.category AS asset_type,                           -- Selects the asset category/type (e.g., stocks, bonds, real estate, etc.)
    SUM(pi.quantity * pi.purchase_price) AS total_invested  -- Calculates the total invested value for each category:
                                                          -- multiplies the quantity of each investment by its purchase price,
                                                          -- then sums these values grouped by category.

FROM 
    portfolio_investments pi                            -- The table containing portfolio investments with quantity and purchase price.

JOIN 
    investments i ON pi.investment_id = i.investment_id  -- Joins with the investments table to get asset category info.

GROUP BY 
    i.category                                         -- Groups the results by asset category,
                                                       -- so the total invested amount is aggregated per category.

ORDER BY 
    total_invested DESC;                               -- Orders the output by total invested amount in descending order,
                                                       -- showing the largest investment categories first.
