CREATE TABLE portfolio_investments (
    portfolio_id INT,
    investment_id INT,
    quantity INT,
    purchase_price DECIMAL(15,2),
    purchase_date DATE,
    PRIMARY KEY (portfolio_id, investment_id, purchase_date),
    FOREIGN KEY (portfolio_id) REFERENCES portfolios(portfolio_id),
    FOREIGN KEY (investment_id) REFERENCES investments(investment_id)
);
INSERT INTO portfolio_investments (portfolio_id, investment_id, quantity, purchase_price, purchase_date)
VALUES
-- Portfolio 1: Growth Fund 1 → tech heavy
(1, 1, 100, 145.00, '2020-01-15'),  -- Apple
(1, 2, 50, 620.00, '2020-02-01'),   -- Tesla

-- Portfolio 2: Balanced Fund → tech + bonds
(2, 3, 75, 210.00, '2019-07-10'),   -- Microsoft
(2, 4, 200, 101.00, '2020-03-01'),  -- US Treasury 10Y

-- Portfolio 3: Conservative → low-risk
(3, 4, 150, 102.00, '2021-05-20'),  -- US Treasury 10Y
(3, 5, 100, 98.00, '2022-02-10'),   -- Corporate Bond

-- Portfolio 4: Real Estate
(4, 6, 1, 500000.00, '2021-07-10'), -- Downtown Office
(4, 7, 1, 240000.00, '2020-11-18'), -- Residential Property NY

-- Portfolio 5: Income Fund → bonds + dividend stocks
(5, 5, 100, 98.00, '2022-01-30'),   -- Corporate Bond
(5, 8, 200, 148.00, '2021-06-01'),  -- Vanguard Growth Fund

-- Portfolio 6: Tech Growth 2 → Tesla-heavy
(6, 2, 40, 630.00, '2021-03-10'),   -- Tesla

-- Portfolio 7: Index Fund
(7, 3, 80, 215.00, '2020-01-05'),   -- Microsoft
(7, 8, 100, 150.00, '2020-06-01'),  -- Vanguard Growth Fund

-- Portfolio 8: Green Fund → commodities, renewables
(8, 10, 100, 68.00, '2022-03-05'),  -- Crude Oil Futures
(8, 9, 50, 1780.00, '2021-08-30'),  -- Gold Futures

-- Portfolio 9: Bond Fund
(9, 4, 200, 101.25, '2021-05-20'),  -- US Treasury 10Y
(9, 5, 100, 98.50, '2022-01-30'),   -- Corporate Bond

-- Portfolio 10: Dividend Fund
(10, 1, 50, 140.00, '2023-01-10'),  -- Apple
(10, 3, 30, 200.00, '2023-01-10');  -- Microsoft
