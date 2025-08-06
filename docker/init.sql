-- 1. Creating the database 
CREATE DATABASE IF NOT EXISTS investment_portfolio;
USE investment_portfolio;

-- 2.TABLE: clients
CREATE TABLE clients (
    client_id INT PRIMARY KEY,                    
    first_name VARCHAR(100),                      
    last_name VARCHAR(100),                
    email VARCHAR(255),                  
    phone_number VARCHAR(20),                    
    registration_date DATE,                  
    country VARCHAR(100),                        
    risk_tolerance VARCHAR(50),                 
    total_assets DECIMAL(15, 2)  
);

-- TABLE: portfolios
CREATE TABLE portfolios (
    portfolio_id INT PRIMARY KEY,
    portfolio_name VARCHAR(100),
    manager_id INT,
    creation_date DATE,
    total_value DECIMAL(15, 2), 
    risk_level VARCHAR(50),
    description TEXT, 
    FOREIGN KEY (manager_id) REFERENCES clients(client_id)
);

-- TABLE: investments
CREATE TABLE investments (
    investment_id INT PRIMARY KEY,               
    investment_type VARCHAR(50),                  
    name VARCHAR(100),                            
    ticker VARCHAR(10),                          
    market_price DECIMAL(15, 2),                 
    category VARCHAR(50),                        
    purchase_date DATE,                           
    risk_level VARCHAR(50)    
);

-- TABLE: transactions
CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY,               
    investment_id INT,                            
    transaction_type VARCHAR(50),                 
    transaction_date DATE,                        
    quantity INT,                                 
    price_per_unit DECIMAL(15, 2),               
    total_value DECIMAL(15, 2),                   
    fees DECIMAL(15, 2),                         
    FOREIGN KEY (investment_id) REFERENCES investments(investment_id)
);

-- TABLE: returns
CREATE TABLE returns (
    return_id INT PRIMARY KEY,                    
    portfolio_id INT,                             
    investment_id INT,                          
    return_date DATE,                             
    return_percentage DECIMAL(5, 2),              
    return_type VARCHAR(50),                      
    description TEXT,                             
    FOREIGN KEY (portfolio_id) REFERENCES portfolios(portfolio_id), 
    FOREIGN KEY (investment_id) REFERENCES investments(investment_id)
);

-- Connection tables for clients and portfolios
CREATE TABLE client_portfolios (
    client_id INT,
    portfolio_id INT,
    allocation_percentage DECIMAL(5,2),  -- NULL, if not owner
    role VARCHAR(50),                    -- e.g., 'owner', 'manager', 'viewer'
    joined_date DATE,
    PRIMARY KEY (client_id, portfolio_id),
    FOREIGN KEY (client_id) REFERENCES clients(client_id),
    FOREIGN KEY (portfolio_id) REFERENCES portfolios(portfolio_id)
);

-- Connection table for portfolios and investments
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

-- 3. Sample data (Insert into)
INSERT INTO clients (
    client_id, first_name, last_name, email, phone_number, registration_date, country, risk_tolerance, total_assets
) VALUES
(1, 'John', 'Doe', 'john.doe@email.com', '+1-555-1234', '2020-01-10', 'USA', 'high', 1000000.00),
(2, 'Jane', 'Smith', 'jane.smith@email.com', '+1-555-5678', '2019-05-20', 'UK', 'medium', 500000.00),
(3, 'Robert', 'Brown', 'robert.brown@email.com', '+44-555-9876', '2021-02-25', 'Canada', 'low', 200000.00),
(4, 'Emily', 'Davis', 'emily.davis@email.com', '+33-555-5432', '2020-08-30', 'France', 'high', 800000.00),
(5, 'William', 'Wilson', 'william.wilson@email.com', '+49-555-8765', '2021-11-05', 'Germany', 'medium', 350000.00),
(6, 'Olivia', 'Johnson', 'olivia.johnson@email.com', '+34-555-4321', '2022-03-15', 'Spain', 'medium', 600000.00),
(7, 'Michael', 'Taylor', 'michael.taylor@email.com', '+44-555-6666', '2021-06-10', 'Ireland', 'high', 1500000.00),
(8, 'Sophia', 'Martinez', 'sophia.martinez@email.com', '+1-555-2345', '2022-01-20', 'Mexico', 'low', 400000.00),
(9, 'James', 'Anderson', 'james.anderson@email.com', '+61-555-6789', '2021-09-11', 'Australia', 'high', 1200000.00),
(10, 'Isabella', 'Robinson', 'isabella.robinson@email.com', '+55-555-4321', '2023-02-01', 'Brazil', 'medium', 700000.00);

-- === Sample data for portfolios ===
INSERT INTO portfolios (
    portfolio_id, portfolio_name, manager_id, creation_date, total_value, risk_level, description
) VALUES
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

-- === Sample data for investments ===
INSERT INTO investments (
    investment_id, investment_type, name, ticker, market_price, category, purchase_date, risk_level
) VALUES
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

-- === Sample data for transactions ===
INSERT INTO transactions (
    transaction_id, investment_id, transaction_type, transaction_date, quantity, price_per_unit, total_value, fees
) VALUES
(1, 1, 'purchase', '2020-01-15', 100, 150.00, 15000.00, 50),
(2, 1, 'dividend', '2021-05-10', 100, 2.50, 250.00, 0),
(3, 2, 'purchase', '2021-03-10', 50, 650.00, 32500.00, 75),
(4, 2, 'sale', '2022-01-10', 20, 700.00, 14000.00, 25),
(5, 3, 'purchase', '2019-07-05', 75, 220.00, 16500.00, 100),
(6, 3, 'dividend', '2021-06-15', 75, 3.00, 225.00, 0),
(7, 4, 'purchase', '2021-05-20', 200, 101.25, 20250.00, 30),
(8, 4, 'interest', '2021-11-01', 200, 1.75, 350.00, 0),
(9, 5, 'purchase', '2022-01-30', 100, 98.50, 9850.00, 50),
(10, 5, 'sale', '2023-02-15', 50, 100.00, 5000.00, 20),
(11, 6, 'purchase', '2021-07-10', 1, 500000.00, 500000.00, 5000),
(12, 6, 'rental_income', '2021-12-15', 1, 5000.00, 5000.00, 0),
(13, 7, 'purchase', '2020-11-18', 1, 250000.00, 250000.00, 2500),
(14, 7, 'rental_income', '2021-09-01', 1, 3000.00, 3000.00, 0),
(15, 8, 'purchase', '2020-04-25', 200, 150.00, 30000.00, 100),
(16, 8, 'dividend', '2021-02-20', 200, 3.00, 600.00, 0),
(17, 9, 'purchase', '2021-08-30', 50, 1800.00, 90000.00, 200),
(18, 9, 'sale', '2022-07-05', 25, 1900.00, 47500.00, 100),
(19, 10, 'purchase', '2022-03-05', 100, 70.00, 7000.00, 50),
(20, 10, 'sale', '2023-04-01', 50, 75.00, 3750.00, 25);

-- === Sample data for returns ===
INSERT INTO returns (
    return_id, portfolio_id, investment_id, return_date, return_percentage, return_type, description
) VALUES
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

-- === INSERT INTO client_portfolios ===
INSERT INTO client_portfolios 
(client_id, portfolio_id, allocation_percentage, role, joined_date)
VALUES
-- 1. Growth Fund 1: original manager_id = 101 (nonexistent), replaced with real client (John Doe)
(1, 1, 100.00, 'owner', '2020-01-10'),

-- 2. Balanced Fund: original manager_id = 102 (nonexistent), assigned to client_id = 2 (Jane Smith)
(2, 2, 100.00, 'owner', '2019-05-20'),

-- 3. Conservative 1: original manager_id = 103 (nonexistent), assigned to client_id = 3 (Robert Brown)
(3, 3, 100.00, 'owner', '2021-02-25'),

-- 4. Real Estate 1: original manager_id = 101, John Doe can act as manager
(1, 4, NULL, 'manager', '2020-08-30'),

-- 5. Income Fund: original manager_id = 104 (nonexistent), split ownership between real clients
(5, 5, 60.00, 'owner', '2021-11-05'),
(6, 5, 40.00, 'owner', '2022-03-15'),

-- 6. Tech Growth 2: original manager_id = 105 (nonexistent), assigned to Michael Taylor
(7, 6, 100.00, 'owner', '2021-06-10'),

-- 7. Index Fund: original manager_id = 106 (nonexistent), assigned to Sophia Martinez as viewer
(8, 7, NULL, 'viewer', '2022-01-20'),

-- 8. Green Fund: original manager_id = 107 (nonexistent), assigned to James Anderson
(9, 8, 100.00, 'owner', '2021-09-11'),

-- 9. Bond Fund: original manager_id = 108 (nonexistent), assigned to Isabella Robinson
(10, 9, 100.00, 'owner', '2023-02-01'),

-- 10. Dividend Fund: original manager_id = 109 (nonexistent), assigned back to John Doe as manager
(1, 10, NULL, 'manager', '2020-01-10');

-- === INSERT INTO portfolio_investments ===
INSERT INTO portfolio_investments 
(portfolio_id, investment_id, quantity, purchase_price, purchase_date)
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
