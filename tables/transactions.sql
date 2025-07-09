CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY,               -- Unique identifier for each transaction
    investment_id INT,                            -- Foreign key referencing the investments table
    transaction_type VARCHAR(50),                 -- Type of transaction (e.g., purchase, sale, dividend, etc.)
    transaction_date DATE,                        -- Date when the transaction occurred
    quantity INT,                                 -- Number of units involved in the transaction
    price_per_unit DECIMAL(15, 2),                -- Price per unit of the investment at the time of transaction
    total_value DECIMAL(15, 2),                   -- Total value of the transaction (quantity * price_per_unit)
    fees DECIMAL(15, 2),                          -- Fees associated with the transaction
    FOREIGN KEY (investment_id) REFERENCES investments(investment_id) -- Foreign key constraint for investment_id
);
INSERT INTO transactions (transaction_id, investment_id, transaction_type, transaction_date, quantity, price_per_unit, total_value, fees)
VALUES
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
