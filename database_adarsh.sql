

-- 1. CLEANUP ( to remove old tables if they exist)
DROP TABLE IF EXISTS Orders CASCADE;
DROP TABLE IF EXISTS Products CASCADE;
DROP TABLE IF EXISTS Customers CASCADE;

-- 2. TABLES CREATION

-- Customers Table
CREATE TABLE Customers (
    customer_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    gender VARCHAR(10),
    age INT,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    city VARCHAR(50),
    state VARCHAR(50),
    registration_date DATE,
    customer_type VARCHAR(20)
);

-- Products Table
CREATE TABLE Products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    brand VARCHAR(50),
    unit_price NUMERIC(10, 2),
    stock_quantity INT,
    supplier_name VARCHAR(100),
    launch_date DATE,
    rating NUMERIC(2, 1),
    status VARCHAR(20)
);

-- Orders Table
CREATE TABLE Orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES Customers(customer_id) ON DELETE CASCADE,
    product_id INT REFERENCES Products(product_id) ON DELETE CASCADE,
    order_date DATE,
    quantity INT,
    discount_percent NUMERIC(5, 2),
    total_amount NUMERIC(10, 2),
    payment_method VARCHAR(20),
    order_status VARCHAR(20),
    salesperson VARCHAR(100)
);

-- 3. DATA INSERTION

-- Insert 20 Customers
INSERT INTO Customers (customer_name, gender, age, email, phone, city, state, registration_date, customer_type) VALUES
('Aarav Sharma', 'Male', 28, 'aarav@gmail.com', '9876543210', 'Hyderabad', 'Telangana', '2024-01-15', 'Regular'),
('Ananya Sen', 'Female', 24, 'ananya@gmail.com', '9876543211', 'Kolkata', 'West Bengal', '2024-02-10', 'Premium'),
('Rohan Verma', 'Male', 32, 'rohan@gmail.com', '9876543212', 'Delhi', 'Delhi', '2023-11-05', 'Regular'),
('Priya Nair', 'Female', 29, 'priya@gmail.com', '9876543213', 'Bangalore', 'Karnataka', '2024-03-20', 'VIP'),
('Amit Patel', 'Male', 35, 'amit@gmail.com', '9876543214', 'Ahmedabad', 'Gujarat', '2023-08-12', 'Regular'),
('Neha Gupta', 'Female', 22, 'neha@gmail.com', '9876543215', 'Hyderabad', 'Telangana', '2024-04-01', 'Regular'),
('Siddharth Malhotra', 'Male', 30, 'siddharth@gmail.com', '9876543216', 'Mumbai', 'Maharashtra', '2023-12-19', 'Premium'),
('Pooja Singh', 'Female', 27, 'pooja@gmail.com', '9876543217', 'Pune', 'Maharashtra', '2024-01-25', 'Regular'),
('Vikas Kumar', 'Male', 40, 'vikas@gmail.com', '9876543218', 'Jaipur', 'Rajasthan', '2023-05-14', 'Regular'),
('Kavya Joshi', 'Female', 26, 'kavya@gmail.com', '9876543219', 'Chennai', 'Tamil Nadu', '2024-02-28', 'VIP'),
('Karan Mehta', 'Male', 31, 'karan@gmail.com', '9876543220', 'Delhi', 'Delhi', '2023-10-10', 'Regular'),
('Diya Shah', 'Female', 23, 'diya@gmail.com', '9876543221', 'Ahmedabad', 'Gujarat', '2024-05-15', 'Regular'),
('Arjun Reddy', 'Male', 29, 'arjun@gmail.com', '9876543222', 'Hyderabad', 'Telangana', '2023-09-01', 'Premium'),
('Isha Rao', 'Female', 34, 'isha@gmail.com', '9876543223', 'Bangalore', 'Karnataka', '2024-03-05', 'Regular'),
('Manish Pandey', 'Male', 27, 'manish@gmail.com', '9876543224', 'Lucknow', 'Uttar Pradesh', '2023-07-22', 'Regular'),
('Ritu Deshmukh', 'Female', 38, 'ritu@gmail.com', '9876543225', 'Pune', 'Maharashtra', '2024-01-11', 'VIP'),
('Gaurav Das', 'Male', 25, 'gaurav@gmail.com', '9876543226', 'Kolkata', 'West Bengal', '2024-04-18', 'Regular'),
('Simran Kaur', 'Female', 33, 'simran@gmail.com', '9876543227', 'Chandigarh', 'Punjab', '2023-06-30', 'Premium'),
('Nikhil Saxena', 'Male', 21, 'nikhil@gmail.com', '9876543228', 'Noida', 'Uttar Pradesh', '2024-05-01', 'Regular'),
('Tanya Roy', 'Female', 28, 'tanya@gmail.com', '9876543229', 'Hyderabad', 'Telangana', '2023-12-01', 'Regular');

-- Insert 10 Products
INSERT INTO Products (product_name, category, brand, unit_price, stock_quantity, supplier_name, launch_date, rating, status) VALUES
('Smartphone X', 'Electronics', 'TechCorp', 25000.00, 50, 'SupplyCo', '2023-01-10', 4.5, 'Active'),
('Wireless Earbuds', 'Electronics', 'AudioPro', 2999.00, 100, 'SoundSupplier', '2023-03-15', 4.2, 'Active'),
('Running Shoes', 'Fashion', 'FitGear', 1500.00, 30, 'ApparelHub', '2023-02-20', 4.0, 'Active'),
('Designer Jacket', 'Fashion', 'StylePro', 4500.00, 15, 'ApparelHub', '2023-05-12', 4.7, 'Active'),
('Smart Watch', 'Electronics', 'TechCorp', 5000.00, 8, 'SupplyCo', '2023-04-01', 3.9, 'Active'),
('Coffee Maker', 'Home Appliances', 'BrewMaster', 800.00, 25, 'HomeGoods', '2022-11-10', 4.1, 'Inactive'),
('Gaming Laptop', 'Electronics', 'CyberGamer', 75000.00, 12, 'SupplyCo', '2023-06-25', 4.8, 'Active'),
('Backpack', 'Fashion', 'Traveler', 900.00, 60, 'BagHouse', '2023-01-05', 4.3, 'Active'),
('Blender', 'Home Appliances', 'KitchenPro', 1200.00, 18, 'HomeGoods', '2023-07-10', 3.8, 'Active'),
('Desk Lamp', 'Home Appliances', 'LumiLite', 650.00, 40, 'LumiCorp', '2023-08-01', 4.0, 'Active');

-- Insert 50 Orders
INSERT INTO Orders (customer_id, product_id, order_date, quantity, discount_percent, total_amount, payment_method, order_status, salesperson) VALUES
(1, 1, '2024-02-01', 1, 5.00, 23750.00, 'Credit Card', 'Delivered', 'Rahul Sharma'),
(2, 3, '2024-02-05', 2, 0.00, 3000.00, 'UPI', 'Delivered', 'Priya Singh'),
(3, 7, '2024-02-10', 1, 10.00, 67500.00, 'Net Banking', 'Delivered', 'Rahul Sharma'),
(4, 2, '2024-02-12', 3, 5.00, 8547.15, 'UPI', 'Delivered', 'Ankit Verma'),
(5, 5, '2024-02-15', 1, 0.00, 5000.00, 'Debit Card', 'Cancelled', 'Priya Singh'),
(6, 4, '2024-02-18', 2, 10.00, 8100.00, 'Credit Card', 'Delivered', 'Rahul Sharma'),
(7, 8, '2024-02-20', 1, 0.00, 900.00, 'Cash on Delivery', 'Delivered', 'Ankit Verma'),
(8, 9, '2024-02-22', 4, 15.00, 4080.00, 'UPI', 'Delivered', 'Priya Singh'),
(9, 9, '2024-02-25', 2, 0.00, 2400.00, 'Debit Card', 'Delivered', 'Rahul Sharma'),
(10, 1, '2024-02-28', 1, 0.00, 25000.00, 'UPI', 'Cancelled', 'Ankit Verma'),
(1, 2, '2024-03-01', 2, 5.00, 5698.10, 'Credit Card', 'Delivered', 'Rahul Sharma'),
(12, 3, '2024-03-03', 1, 0.00, 1500.00, 'UPI', 'Delivered', 'Priya Singh'),
(13, 1, '2024-03-05', 1, 10.00, 22500.00, 'Credit Card', 'Delivered', 'Ankit Verma'),
(14, 5, '2024-03-08', 2, 5.00, 9500.00, 'Net Banking', 'Delivered', 'Priya Singh'),
(15, 7, '2024-03-10', 1, 0.00, 75000.00, 'Credit Card', 'Pending', 'Rahul Sharma'),
(16, 4, '2024-03-12', 1, 0.00, 4500.00, 'UPI', 'Delivered', 'Ankit Verma'),
(17, 8, '2024-03-15', 3, 10.00, 2430.00, 'Cash on Delivery', 'Delivered', 'Priya Singh'),
(18, 2, '2024-03-18', 1, 0.00, 2999.00, 'UPI', 'Delivered', 'Rahul Sharma'),
(1, 4, '2024-03-20', 2, 5.00, 8550.00, 'Debit Card', 'Delivered', 'Ankit Verma'),
(2, 9, '2024-03-22', 1, 0.00, 1200.00, 'UPI', 'Cancelled', 'Priya Singh'),
(2, 1, '2024-03-25', 1, 5.00, 23750.00, 'Credit Card', 'Delivered', 'Rahul Sharma'),
(3, 5, '2024-03-28', 1, 0.00, 5000.00, 'UPI', 'Delivered', 'Ankit Verma'),
(4, 3, '2024-04-01', 2, 10.00, 2700.00, 'Net Banking', 'Delivered', 'Priya Singh'),
(5, 8, '2024-04-03', 1, 0.00, 900.00, 'Cash on Delivery', 'Delivered', 'Rahul Sharma'),
(6, 7, '2024-04-05', 1, 5.00, 71250.00, 'Credit Card', 'Delivered', 'Ankit Verma'),
(7, 2, '2024-04-08', 2, 0.00, 5998.00, 'UPI', 'Delivered', 'Priya Singh'),
(8, 4, '2024-04-10', 1, 10.00, 4050.00, 'Debit Card', 'Delivered', 'Rahul Sharma'),
(9, 3, '2024-04-12', 3, 0.00, 4500.00, 'UPI', 'Delivered', 'Ankit Verma'),
(10, 9, '2024-04-15', 1, 5.00, 1140.00, 'Cash on Delivery', 'Delivered', 'Priya Singh'),
(11, 8, '2024-04-18', 4, 10.00, 3240.00, 'UPI', 'Delivered', 'Rahul Sharma'),
(12, 1, '2024-04-20', 1, 0.00, 25000.00, 'Credit Card', 'Delivered', 'Ankit Verma'),
(13, 5, '2024-04-22', 2, 5.00, 9500.00, 'Net Banking', 'Delivered', 'Priya Singh'),
(14, 3, '2024-04-25', 1, 0.00, 1500.00, 'UPI', 'Delivered', 'Rahul Sharma'),
(15, 2, '2024-04-28', 3, 10.00, 8097.30, 'Debit Card', 'Delivered', 'Ankit Verma'),
(16, 8, '2024-05-01', 2, 0.00, 1800.00, 'UPI', 'Cancelled', 'Priya Singh'),
(17, 7, '2024-05-03', 1, 5.00, 71250.00, 'Credit Card', 'Delivered', 'Rahul Sharma'),
(18, 4, '2024-05-05', 1, 0.00, 4500.00, 'Net Banking', 'Delivered', 'Ankit Verma'),
(3, 9, '2024-05-08', 2, 10.00, 2160.00, 'UPI', 'Delivered', 'Priya Singh'),
(4, 5, '2024-05-10', 1, 0.00, 5000.00, 'Cash on Delivery', 'Delivered', 'Rahul Sharma'),
(1, 5, '2024-05-12', 1, 5.00, 4750.00, 'Credit Card', 'Delivered', 'Ankit Verma'),
(3, 2, '2024-05-15', 2, 0.00, 5998.00, 'UPI', 'Delivered', 'Priya Singh'),
(5, 1, '2024-05-18', 1, 10.00, 22500.00, 'Debit Card', 'Delivered', 'Rahul Sharma'),
(7, 3, '2024-05-20', 3, 5.00, 4275.00, 'UPI', 'Delivered', 'Ankit Verma'),
(9, 7, '2024-05-22', 1, 0.00, 75000.00, 'Credit Card', 'Delivered', 'Priya Singh'),
(11, 4, '2024-05-25', 2, 10.00, 8100.00, 'Net Banking', 'Delivered', 'Rahul Sharma'),
(13, 8, '2024-05-28', 1, 0.00, 900.00, 'Cash on Delivery', 'Delivered', 'Ankit Verma'),
(15, 2, '2024-05-30', 2, 5.00, 5698.10, 'UPI', 'Delivered', 'Priya Singh'),
(17, 9, '2024-06-02', 1, 0.00, 1200.00, 'Debit Card', 'Delivered', 'Rahul Sharma'),
(18, 3, '2024-06-05', 2, 10.00, 2700.00, 'UPI', 'Delivered', 'Ankit Verma'),
(2, 5, '2024-06-08', 1, 0.00, 5000.00, 'Credit Card', 'Delivered', 'Priya Singh');
