

-- 1. CLEANUP
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

-- 3. UNIQUE DATA INSERTION

-- Insert 20 Unique Customers
INSERT INTO Customers (customer_name, gender, age, email, phone, city, state, registration_date, customer_type) VALUES
('Vikramaditya Sen', 'Male', 31, 'vikram.sen@gmail.com', '9123456701', 'Bhubaneswar', 'Odisha', '2024-01-10', 'VIP'),
('Sneha Pillai', 'Female', 26, 'sneha.p@gmail.com', '9123456702', 'Kochi', 'Kerala', '2024-02-14', 'Regular'),
('Devendra Deshmukh', 'Male', 42, 'dev.deshmukh@gmail.com', '9123456703', 'Nagpur', 'Maharashtra', '2023-10-18', 'Premium'),
('Meera Bhatt', 'Female', 23, 'meera.bhatt@gmail.com', '9123456704', 'Vadodara', 'Gujarat', '2024-03-01', 'Regular'),
('Abhishek Tripathi', 'Male', 29, 'abhishek.t@gmail.com', '9123456705', 'Varanasi', 'Uttar Pradesh', '2023-09-25', 'Regular'),
('Tanvi Hegde', 'Female', 35, 'tanvi.h@gmail.com', '9123456706', 'Mangalore', 'Karnataka', '2024-01-22', 'VIP'),
('Pranav Kulkarni', 'Male', 27, 'pranav.k@gmail.com', '9123456707', 'Nashik', 'Maharashtra', '2023-11-12', 'Regular'),
('Shreya Chatterjee', 'Female', 30, 'shreya.c@gmail.com', '9123456708', 'Durgapur', 'West Bengal', '2024-04-05', 'Premium'),
('Harshvardhan Rathi', 'Male', 38, 'harsh.rathi@gmail.com', '9123456709', 'Indore', 'Madhya Pradesh', '2023-07-15', 'Regular'),
('Rhea Saxena', 'Female', 25, 'rhea.saxena@gmail.com', '9123456710', 'Dehradun', 'Uttarakhand', '2024-02-20', 'Regular'),
('Siddhesh Nambiar', 'Male', 33, 'siddhesh.n@gmail.com', '9123456711', 'Trivandrum', 'Kerala', '2023-12-05', 'VIP'),
('Kritika Mohanty', 'Female', 28, 'kritika.m@gmail.com', '9123456712', 'Cuttack', 'Odisha', '2024-03-18', 'Regular'),
('Nitin Chawla', 'Male', 45, 'nitin.chawla@gmail.com', '9123456713', 'Amritsar', 'Punjab', '2023-08-30', 'Premium'),
('Aishwarya Rao', 'Female', 22, 'aishwarya.rao@gmail.com', '9123456714', 'Mysore', 'Karnataka', '2024-05-10', 'Regular'),
('Chaitanya Joshi', 'Male', 36, 'chaitanya.j@gmail.com', '9123456715', 'Gwalior', 'Madhya Pradesh', '2023-06-14', 'Regular'),
('Bhavna Bisht', 'Female', 32, 'bhavna.b@gmail.com', '9123456716', 'Shimla', 'Himachal Pradesh', '2024-01-05', 'VIP'),
('Yashwant Choudhary', 'Male', 24, 'yash.choudhary@gmail.com', '9123456717', 'Jodhpur', 'Rajasthan', '2024-04-22', 'Regular'),
('Pallavi Dutta', 'Female', 27, 'pallavi.d@gmail.com', '9123456718', 'Guwahati', 'Assam', '2023-11-28', 'Premium'),
('Aakash Soni', 'Male', 39, 'aakash.soni@gmail.com', '9123456719', 'Ranchi', 'Jharkhand', '2023-05-19', 'Regular'),
('Garima Mishra', 'Female', 29, 'garima.m@gmail.com', '9123456720', 'Prayagraj', 'Uttar Pradesh', '2024-02-01', 'Regular');

-- Insert 10 Unique Products
INSERT INTO Products (product_name, category, brand, unit_price, stock_quantity, supplier_name, launch_date, rating, status) VALUES
('UltraTab Pro 11', 'Electronics', 'NovaTech', 42000.00, 25, 'ApexDistributors', '2023-02-15', 4.6, 'Active'),
('Noise-Canceling Headphones', 'Electronics', 'SoundWave', 8500.00, 45, 'ApexDistributors', '2023-04-10', 4.8, 'Active'),
('Ergonomic Mesh Chair', 'Furniture', 'ComfortPlus', 11500.00, 20, 'UrbanSpaces', '2023-01-20', 4.4, 'Active'),
('Mechanical Gaming Keyboard', 'Electronics', 'CyberGamer', 4800.00, 60, 'NexusLogistics', '2023-06-01', 4.3, 'Active'),
('Air Fryer 4L', 'Home Appliances', 'ChefChoice', 6200.00, 18, 'KitchenWorld', '2022-12-05', 4.5, 'Active'),
('Water Purifier UV', 'Home Appliances', 'AquaPure', 13500.00, 15, 'KitchenWorld', '2023-03-22', 4.1, 'Active'),
('Leather Office Bag', 'Fashion', 'ArtisanCraft', 3400.00, 35, 'StyleVibe', '2023-05-18', 4.7, 'Active'),
('Fitness Tracking Band', 'Electronics', 'FitLife', 2499.00, 80, 'NexusLogistics', '2023-07-11', 4.0, 'Active'),
('Convection Microwave 23L', 'Home Appliances', 'ChefChoice', 9800.00, 12, 'KitchenWorld', '2022-10-15', 4.2, 'Inactive'),
('Standing Desk Converter', 'Furniture', 'ComfortPlus', 15900.00, 10, 'UrbanSpaces', '2023-08-05', 4.6, 'Active');

-- Insert 50 Unique Orders
INSERT INTO Orders (customer_id, product_id, order_date, quantity, discount_percent, total_amount, payment_method, order_status, salesperson) VALUES
(1, 1, '2024-02-02', 1, 8.00, 38640.00, 'Credit Card', 'Delivered', 'Vikrant Mehta'),
(2, 2, '2024-02-06', 1, 0.00, 8500.00, 'UPI', 'Delivered', 'Sujata Sen'),
(3, 3, '2024-02-11', 2, 5.00, 21850.00, 'Net Banking', 'Delivered', 'Vikrant Mehta'),
(4, 8, '2024-02-14', 1, 0.00, 2499.00, 'UPI', 'Delivered', 'Deepak Joshi'),
(5, 5, '2024-02-17', 1, 10.00, 5580.00, 'Debit Card', 'Delivered', 'Sujata Sen'),
(6, 4, '2024-02-21', 2, 0.00, 9600.00, 'Credit Card', 'Cancelled', 'Vikrant Mehta'),
(7, 7, '2024-02-24', 1, 5.00, 3230.00, 'Cash on Delivery', 'Delivered', 'Deepak Joshi'),
(8, 6, '2024-02-27', 1, 12.00, 11880.00, 'UPI', 'Delivered', 'Sujata Sen'),
(9, 10, '2024-03-02', 1, 0.00, 15900.00, 'Credit Card', 'Delivered', 'Vikrant Mehta'),
(10, 2, '2024-03-05', 2, 5.00, 16150.00, 'UPI', 'Delivered', 'Deepak Joshi'),
(11, 1, '2024-03-08', 1, 10.00, 37800.00, 'Net Banking', 'Delivered', 'Sujata Sen'),
(12, 4, '2024-03-11', 1, 0.00, 4800.00, 'UPI', 'Delivered', 'Vikrant Mehta'),
(13, 3, '2024-03-14', 1, 0.00, 11500.00, 'Credit Card', 'Pending', 'Deepak Joshi'),
(14, 5, '2024-03-16', 2, 8.00, 11408.00, 'Debit Card', 'Delivered', 'Sujata Sen'),
(15, 7, '2024-03-19', 3, 10.00, 9180.00, 'UPI', 'Delivered', 'Vikrant Mehta'),
(16, 8, '2024-03-22', 2, 0.00, 4998.00, 'Cash on Delivery', 'Delivered', 'Deepak Joshi'),
(17, 6, '2024-03-25', 1, 5.00, 12825.00, 'UPI', 'Delivered', 'Sujata Sen'),
(18, 9, '2024-03-28', 1, 0.00, 9800.00, 'Credit Card', 'Cancelled', 'Vikrant Mehta'),
(19, 2, '2024-04-01', 1, 0.00, 8500.00, 'UPI', 'Delivered', 'Deepak Joshi'),
(20, 10, '2024-04-04', 1, 10.00, 14310.00, 'Net Banking', 'Delivered', 'Sujata Sen'),
(1, 4, '2024-04-07', 2, 5.00, 9120.00, 'Credit Card', 'Delivered', 'Vikrant Mehta'),
(3, 8, '2024-04-10', 1, 0.00, 2499.00, 'UPI', 'Delivered', 'Deepak Joshi'),
(5, 1, '2024-04-12', 1, 5.00, 39900.00, 'Debit Card', 'Delivered', 'Sujata Sen'),
(7, 3, '2024-04-15', 1, 0.00, 11500.00, 'Cash on Delivery', 'Delivered', 'Vikrant Mehta'),
(9, 5, '2024-04-18', 2, 10.00, 11160.00, 'UPI', 'Delivered', 'Deepak Joshi'),
(11, 7, '2024-04-21', 1, 0.00, 3400.00, 'Credit Card', 'Delivered', 'Sujata Sen'),
(13, 2, '2024-04-24', 2, 5.00, 16150.00, 'Net Banking', 'Delivered', 'Vikrant Mehta'),
(15, 6, '2024-04-27', 1, 0.00, 13500.00, 'UPI', 'Delivered', 'Deepak Joshi'),
(17, 8, '2024-04-30', 4, 15.00, 8496.60, 'Debit Card', 'Delivered', 'Sujata Sen'),
(19, 4, '2024-05-02', 1, 0.00, 4800.00, 'UPI', 'Delivered', 'Vikrant Mehta'),
(2, 10, '2024-05-05', 1, 5.00, 15105.00, 'Credit Card', 'Delivered', 'Deepak Joshi'),
(4, 3, '2024-05-08', 1, 0.00, 11500.00, 'Cash on Delivery', 'Cancelled', 'Sujata Sen'),
(6, 1, '2024-05-11', 1, 10.00, 37800.00, 'UPI', 'Delivered', 'Vikrant Mehta'),
(8, 5, '2024-05-14', 1, 0.00, 6200.00, 'Debit Card', 'Delivered', 'Deepak Joshi'),
(10, 7, '2024-05-17', 2, 5.00, 6460.00, 'UPI', 'Delivered', 'Sujata Sen'),
(12, 2, '2024-05-20', 1, 0.00, 8500.00, 'Credit Card', 'Delivered', 'Vikrant Mehta'),
(14, 8, '2024-05-23', 3, 10.00, 6747.30, 'UPI', 'Delivered', 'Deepak Joshi'),
(16, 6, '2024-05-26', 1, 5.00, 12825.00, 'Net Banking', 'Delivered', 'Sujata Sen'),
(18, 4, '2024-05-29', 2, 0.00, 9600.00, 'Cash on Delivery', 'Delivered', 'Vikrant Mehta'),
(20, 3, '2024-06-01', 1, 10.00, 10350.00, 'Credit Card', 'Delivered', 'Deepak Joshi'),
(1, 6, '2024-06-04', 1, 0.00, 13500.00, 'UPI', 'Delivered', 'Sujata Sen'),
(3, 10, '2024-06-07', 1, 8.00, 14628.00, 'Credit Card', 'Delivered', 'Vikrant Mehta'),
(5, 7, '2024-06-10', 1, 0.00, 3400.00, 'Debit Card', 'Delivered', 'Deepak Joshi'),
(7, 2, '2024-06-13', 1, 5.00, 8075.00, 'UPI', 'Delivered', 'Sujata Sen'),
(9, 1, '2024-06-16', 1, 12.00, 36960.00, 'Net Banking', 'Delivered', 'Vikrant Mehta'),
(11, 5, '2024-06-19', 2, 0.00, 12400.00, 'Cash on Delivery', 'Delivered', 'Deepak Joshi'),
(13, 8, '2024-06-22', 2, 5.00, 4748.10, 'UPI', 'Delivered', 'Sujata Sen'),
(15, 4, '2024-06-25', 1, 0.00, 4800.00, 'Credit Card', 'Delivered', 'Vikrant Mehta'),
(17, 3, '2024-06-28', 1, 5.00, 10925.00, 'UPI', 'Delivered', 'Deepak Joshi'),
(19, 7, '2024-07-01', 2, 10.00, 6120.00, 'Debit Card', 'Delivered', 'Sujata Sen');
