CREATE TABLE portfolios (
    portfolio_id INT PRIMARY KEY,                -- Unique identifier for each portfolio
    portfolio_name VARCHAR(100),                  -- Name of the portfolio (e.g., Growth Fund, Balanced Fund)
    manager_id INT,                               -- Portfolio manager's unique identifier (could be referenced to another table)
    creation_date DATE,                           -- Date when the portfolio was created
    total_value DECIMAL(15, 2),                   -- Total value of the portfolio
    risk_level VARCHAR(50),                       -- Risk profile of the portfolio (low, medium, high)
    description TEXT,                             -- Description of the portfolio's investment strategy or goals
    FOREIGN KEY (manager_id) REFERENCES clients(client_id) -- Foreign key referencing the client table (portfolio manager)
);
INSERT INTO portfolios (portfolio_id, portfolio_name, manager_id, creation_date, total_value, risk_level, description)
VALUES
(1, 'Growth Fund 1', 1, '2020-01-01', 250000.00, 'high', 'High-risk tech-heavy portfolio.'),
(2, 'Balanced Fund', 2, '2019-06-15', 150000.00, 'medium', 'Balanced portfolio with stocks and bonds.'),
(3, 'Conservative 1', 3, '2021-03-25', 50000.00, 'low', 'Focuses on stable, low-risk investments.'),
(4, 'Real Estate 1', 1, '2020-08-30', 600000.00, 'medium', 'Focuses on real estate investments.'),
(5, 'Income Fund', 4, '2022-07-18', 100000.00, 'medium', 'Income-focused portfolio with bonds and dividend stocks.'),
(6, 'Tech Growth 2', 5, '2021-11-05', 350000.00, 'high', 'Focused on high-growth tech companies.'),
(7, 'Index Fund', 6, '2020-12-10', 200000.00, 'low', 'Broad market index fund with low risk.'),
(8, 'Green Fund', 7, '2021-05-22', 120000.00, 'medium', 'Investment in green and renewable energy.'),
(9, 'Bond Fund', 8, '2022-02-14', 75000.00, 'low', 'Invests primarily in government and corporate bonds.'),
(10, 'Dividend Fund', 9, '2023-01-10', 95000.00, 'medium', 'Focused on dividend-paying stocks.');
