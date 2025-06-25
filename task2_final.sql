-- Reset the database
DROP DATABASE IF EXISTS ecommerce_db;
CREATE DATABASE ecommerce_db;
USE ecommerce_db;

-- Users Table
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Products Table
CREATE TABLE Products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    stock INT DEFAULT 0
);

-- Orders Table
CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status ENUM('Pending', 'Shipped', 'Delivered', 'Cancelled') DEFAULT 'Pending',
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- OrderItems Table
CREATE TABLE OrderItems (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Payments Table
CREATE TABLE Payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    amount DECIMAL(10, 2) NOT NULL,
    method ENUM('Credit Card', 'Debit Card', 'UPI', 'Cash on Delivery') NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

-- INSERTS
INSERT INTO Users (name, email, password) VALUES
('Aditya Kumar', 'aditya@example.com', 'pass123'),
('Rohit Mehra', 'rohit@example.com', 'rohit123'),
('Sana Shaikh', 'sana@example.com', 'sana456');

INSERT INTO Products (name, description, price, stock) VALUES
('Laptop', '14-inch slim laptop', 799.99, 10),
('Wireless Mouse', NULL, 25.00, 50),
('Keyboard', 'Mechanical RGB keyboard', 45.00, 30);

INSERT INTO Orders (user_id, status) VALUES
(1, 'Pending'),
(2, 'Shipped'),
(3, 'Delivered');

INSERT INTO OrderItems (order_id, product_id, quantity, price) VALUES
(1, 1, 1, 799.99),
(1, 2, 2, 50.00),
(2, 3, 1, 45.00);

INSERT INTO Payments (order_id, amount, method) VALUES
(1, 849.99, 'Credit Card'),
(2, 45.00, 'UPI'),
(3, 45.00, 'Cash on Delivery');

-- UPDATES
UPDATE Orders
SET status = 'Delivered'
WHERE order_id = 1;

UPDATE Users
SET password = 'newpass456'
WHERE email = 'rohit@example.com';

UPDATE Products
SET description = NULL
WHERE product_id = 3;

-- DELETE safely: Payment made via 'Cash on Delivery'
DELETE FROM Payments
WHERE payment_id IN (
    SELECT payment_id FROM (
        SELECT payment_id FROM Payments WHERE method = 'Cash on Delivery'
    ) AS temp
);

-- Simulate out-of-stock and delete product
UPDATE Products SET stock = 0 WHERE product_id = 2;
DELETE FROM Products
WHERE stock = 0;

-- SELECT NULL-handling
SELECT * FROM Products
WHERE description IS NULL;
