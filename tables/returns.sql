CREATE TABLE returns (
    return_id INT PRIMARY KEY,                    -- Unique identifier for each return record
    portfolio_id INT,                             -- Foreign key referencing the portfolios table
    investment_id INT,                            -- Foreign key referencing the investments table
    return_date DATE,                             -- Date of the return (can be annual, quarterly, etc.)
    return_percentage DECIMAL(5, 2),              -- The percentage return of the investment
    return_type VARCHAR(50),                      -- Type of return (e.g., annual, monthly)
    description TEXT,                             -- Description of the return (e.g., investment growth)
    FOREIGN KEY (portfolio_id) REFERENCES portfolios(portfolio_id),  -- Foreign key constraint for portfolio_id
    FOREIGN KEY (investment_id) REFERENCES investments(investment_id) -- Foreign key constraint for investment_id
);
INSERT INTO returns (return_id, portfolio_id, investment_id, return_date, return_percentage, return_type, description)
VALUES
(1, 1, 1, '2020-12-31', 15.00, 'annual', 'Annual return of Apple Inc. stocks'),
(2, 1, 2, '2020-12-31', 25.00, 'annual', 'Annual return of Tesla Inc. stocks'),
(3, 2, 3, '2020-12-31', 10.00, 'annual', 'Annual return of Microsoft Corp.'),
(4, 3, 4, '2021-12-31', 3.50, 'annual', 'Annual return of US Treasury 10Y'),
(5, 4, 6, '2021-12-31', 8.00, 'annual', 'Annual return of Real Estate portfolio'),
(6, 5, 9, '2021-12-31', 5.50, 'annual', 'Annual return of Bond portfolio'),
(7, 6, 2, '2021-12-31', 40.00, 'annual', 'Annual return of Tesla Inc. stocks'),
(8, 7, 3, '2021-12-31', 7.00, 'annual', 'Annual return of Microsoft Corp.'),
(9, 8, 10, '2021-12-31', 10.00, 'annual', 'Annual return of Oil prices'),
(10, 9, 5, '2022-12-31', 4.00, 'annual', 'Annual return of Corporate bonds');
