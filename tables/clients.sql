CREATE TABLE clients (
    client_id INT PRIMARY KEY,                    -- Unique identifier for each client
    first_name VARCHAR(100),                      -- Client's first name
    last_name VARCHAR(100),                       -- Client's last name
    email VARCHAR(255),                           -- Client's email address
    phone_number VARCHAR(20),                     -- Client's phone number
    registration_date DATE,                       -- Date when the client registered or became a part of the system
    country VARCHAR(100),                         -- Client's country of residence
    risk_tolerance VARCHAR(50),                   -- Client's risk tolerance (low, medium, high)
    total_assets DECIMAL(15, 2)                   -- Total assets or investments held by the client
);
INSERT INTO clients (client_id, first_name, last_name, email, phone_number, registration_date, country, risk_tolerance, total_assets)
VALUES
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
