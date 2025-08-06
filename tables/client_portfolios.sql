CREATE TABLE client_portfolios (
    client_id INT,
    portfolio_id INT,
    allocation_percentage DECIMAL(5,2),  -- 0–100%, NULL, ha nem tulajdonos
    role VARCHAR(50),                    -- e.g., 'owner', 'manager', 'viewer'
    joined_date DATE,
    PRIMARY KEY (client_id, portfolio_id),
    FOREIGN KEY (client_id) REFERENCES clients(client_id),
    FOREIGN KEY (portfolio_id) REFERENCES portfolios(portfolio_id)
);
-- Assume these portfolios (IDs: 1–10) already exist
-- and the listed client_id values exist in the clients table.

INSERT INTO client_portfolios (client_id, portfolio_id, allocation_percentage, role, joined_date)
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
