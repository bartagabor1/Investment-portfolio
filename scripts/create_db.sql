-- DATABASE CREATION (optional)
CREATE DATABASE IF NOT EXISTS investment_portfolio;
USE investment_portfolio;

-- TABLE: clients
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

-- (OPTIONAL) Indexes, additional constraints, or sample data