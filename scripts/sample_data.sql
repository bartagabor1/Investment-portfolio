-- Sample data for clients
INSERT INTO clients (
    client_id, first_name, last_name, email, phone_number, registration_date, country, risk_tolerance, total_assets
) VALUES
(1, 'Anna', 'Kovacs', 'anna.kovacs@example.com', '+36123456789', '2021-05-01', 'Hungary', 'medium', 1200000.00),
(2, 'Bela', 'Nagy', 'bela.nagy@example.com', '+36701234567', '2022-01-15', 'Hungary', 'high', 850000.00),
(3, 'John', 'Doe', 'john.doe@example.com', '+441234567890', '2020-09-20', 'UK', 'low', 2000000.00);

-- Sample data for portfolios
INSERT INTO portfolios (
    portfolio_id, portfolio_name, manager_id, creation_date, total_value, risk_level, description
) VALUES
(101, 'Growth Portfolio', 1, '2021-06-01', 500000.00, 'medium', 'Tech-focused investment strategy'),
(102, 'Aggressive Returns', 2, '2022-02-01', 300000.00, 'high', 'High risk, high reward assets'),
(103, 'Conservative Wealth', 3, '2020-10-01', 700000.00, 'low', 'Stable and safe long-term holdings');


-- Sample data for investments
INSERT INTO investments (
    investment_id, investment_type, name, ticker, market_price, category, purchase_date, risk_level
) VALUES
(201, 'stock', 'ExampleTech Inc.', 'EXT', 120.00, 'technology', '2021-03-10', 'medium'),
(202, 'bond', 'Gov 10Y Bond', NULL, 101.25, 'government', '2022-01-20', 'low'),
(203, 'real_estate', 'Central Office Block', NULL, 450000.00, 'real_estate', '2020-11-15', 'high'),
(204, 'mutual_fund', 'Secure Growth Fund', NULL, 150.00, 'mutual_fund', '2021-07-05', 'medium'),
(205, 'commodity', 'Copper Futures', NULL, 85.50, 'commodities', '2022-06-30', 'medium');

-- Sample data for transactions
IINSERT INTO transactions (
    transaction_id, investment_id, transaction_type, transaction_date, quantity, price_per_unit, total_value, fees
) VALUES
(301, 201, 'buy', '2021-03-12', 100, 115.00, 11500.00, 50.00),
(302, 202, 'buy', '2022-01-25', 200, 100.50, 20100.00, 20.00),
(303, 203, 'buy', '2020-11-20', 1, 440000.00, 440000.00, 2000.00),
(304, 204, 'buy', '2021-07-07', 300, 145.00, 43500.00, 100.00),
(305, 205, 'buy', '2022-07-01', 150, 82.00, 12300.00, 75.00);

-- Sample data for returns
INSERT INTO returns (
    return_id, portfolio_id, investment_id, return_date, return_percentage, return_type, description
) VALUES
(401, 101, 201, '2022-03-10', 12.50, 'capital_gain', 'Stock price increase'),
(402, 102, 203, '2022-12-01', 7.20, 'rental_income', 'Quarterly office rent received'),
(403, 103, 202, '2023-01-15', 3.00, 'interest', 'Government bond interest payout'),
(404, 101, 204, '2023-03-05', 5.75, 'dividend', 'Fund distributed quarterly dividend'),
(405, 102, 205, '2023-04-20', -2.10, 'market_loss', 'Commodity value drop');