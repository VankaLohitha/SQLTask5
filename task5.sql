-- Task 5: SQL Joins (Inner, Left, Right, Full)
-- Objective: Learn to combine data from multiple tables

-- 1. Create tables
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Customers;

CREATE TABLE Customers (
  customer_id INT PRIMARY KEY,
  name VARCHAR(100),
  city VARCHAR(100)
);

CREATE TABLE Orders (
  order_id INT PRIMARY KEY,
  customer_id INT,
  product VARCHAR(100),
  amount DECIMAL(10,2),
  FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- 2. Insert sample data
INSERT INTO Customers VALUES 
(1, 'Alice', 'Hyderabad'),
(2, 'Bob', 'Delhi'),
(3, 'Charlie', 'Mumbai');

INSERT INTO Orders VALUES
(101, 1, 'Laptop', 50000),
(102, 2, 'Mobile', 15000),
(103, 1, 'Headphones', 2000),
(104, 4, 'Tablet', 12000); -- order with customer_id 4 (no match)

-- 3. INNER JOIN
-- Returns only matching rows (Customers who placed orders)
SELECT c.name, c.city, o.product, o.amount
FROM Customers c
INNER JOIN Orders o ON c.customer_id = o.customer_id;

-- 4. LEFT JOIN
-- Returns all customers, with orders if they exist
SELECT c.name, c.city, o.product, o.amount
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id;

-- 5. RIGHT JOIN
-- Returns all orders, even if customer does not exist
SELECT c.name, c.city, o.product, o.amount
FROM Customers c
RIGHT JOIN Orders o ON c.customer_id = o.customer_id;

-- 6. FULL OUTER JOIN
-- MySQL workaround (UNION of LEFT and RIGHT joins)
SELECT c.name, c.city, o.product, o.amount
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
UNION
SELECT c.name, c.city, o.product, o.amount
FROM Customers c
RIGHT JOIN Orders o ON c.customer_id = o.customer_id;
