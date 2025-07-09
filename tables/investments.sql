CREATE TABLE investments (
    investment_id INT PRIMARY KEY,               -- Unique identifier for each investment
    investment_type VARCHAR(50),                  -- Type of the investment (e.g., stock, bond, real estate)
    name VARCHAR(100),                            -- Name of the investment (e.g., company or asset name)
    ticker VARCHAR(10),                          -- Ticker symbol for stocks or funds
    market_price DECIMAL(15, 2),                  -- Current market price per unit of the investment
    category VARCHAR(50),                         -- Investment category (e.g., tech, commodities, real estate)
    purchase_date DATE,                           -- Date the investment was purchased
    risk_level VARCHAR(50)                        -- Risk level associated with the investment (low, medium, high)
);
INSERT INTO investments (investment_id, investment_type, name, ticker, market_price, category, purchase_date, risk_level)
VALUES
(1, 'stock', 'Apple Inc.', 'AAPL', 150.00, 'tech', '2020-01-15', 'medium'),
(2, 'stock', 'Tesla Inc.', 'TSLA', 650.00, 'tech', '2021-03-10', 'high'),
(3, 'stock', 'Microsoft Corp.', 'MSFT', 220.00, 'tech', '2019-07-05', 'medium'),
(4, 'bond', 'US Treasury 10Y', NULL, 101.25, 'government', '2021-05-20', 'low'),
(5, 'bond', 'Corporate Bond - Company X', NULL, 98.50, 'corporate', '2022-01-30', 'medium'),
(6, 'real_estate', 'Downtown Office Building', NULL, 500000.00, 'real_estate', '2021-07-10', 'high'),
(7, 'real_estate', 'Residential Property - NY', NULL, 250000.00, 'real_estate', '2020-11-18', 'medium'),
(8, 'mutual_fund', 'Vanguard Growth Fund', NULL, 150.00, 'mutual_fund', '2020-04-25', 'medium'),
(9, 'commodity', 'Gold Futures', NULL, 1800.00, 'commodities', '2021-08-30', 'medium'),
(10, 'commodity', 'Crude Oil Futures', NULL, 70.00, 'commodities', '2022-03-05', 'high');
