-- 1. Create database and select it
CREATE DATABASE IF NOT EXISTS sales_db;
USE sales_db;

-- 2. Drop table if it already exists
DROP TABLE IF EXISTS online_sales;

-- 3. Create online_sales table
CREATE TABLE online_sales (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    product_id INT NOT NULL
);

-- 4. Insert 100 rows (8-9 per month from Jan to Dec 2024)
INSERT INTO online_sales (order_date, amount, product_id) VALUES
-- January
('2024-01-05', 120.00, 101), ('2024-01-07', 160.00, 102), ('2024-01-09', 130.00, 103), ('2024-01-12', 150.00, 104),
('2024-01-15', 200.00, 105), ('2024-01-18', 110.00, 101), ('2024-01-20', 180.00, 102), ('2024-01-25', 190.00, 103),
-- February
('2024-02-02', 140.00, 104), ('2024-02-04', 135.00, 105), ('2024-02-06', 160.00, 101), ('2024-02-09', 170.00, 102),
('2024-02-13', 175.00, 103), ('2024-02-16', 180.00, 104), ('2024-02-19', 185.00, 105), ('2024-02-23', 190.00, 101),
-- March
('2024-03-01', 155.00, 102), ('2024-03-04', 145.00, 103), ('2024-03-07', 160.00, 104), ('2024-03-10', 175.00, 105),
('2024-03-13', 165.00, 101), ('2024-03-16', 140.00, 102), ('2024-03-20', 135.00, 103), ('2024-03-25', 150.00, 104),
-- April
('2024-04-02', 125.00, 105), ('2024-04-05', 135.00, 101), ('2024-04-08', 145.00, 102), ('2024-04-11', 155.00, 103),
('2024-04-14', 165.00, 104), ('2024-04-17', 175.00, 105), ('2024-04-20', 185.00, 101), ('2024-04-25', 195.00, 102),
-- May
('2024-05-01', 110.00, 103), ('2024-05-04', 120.00, 104), ('2024-05-07', 130.00, 105), ('2024-05-10', 140.00, 101),
('2024-05-13', 150.00, 102), ('2024-05-16', 160.00, 103), ('2024-05-19', 170.00, 104), ('2024-05-23', 180.00, 105),
-- June
('2024-06-02', 190.00, 101), ('2024-06-05', 200.00, 102), ('2024-06-08', 210.00, 103), ('2024-06-11', 220.00, 104),
('2024-06-14', 230.00, 105), ('2024-06-17', 240.00, 101), ('2024-06-20', 250.00, 102), ('2024-06-23', 260.00, 103),
-- July
('2024-07-03', 125.00, 104), ('2024-07-06', 135.00, 105), ('2024-07-09', 145.00, 101), ('2024-07-12', 155.00, 102),
('2024-07-15', 165.00, 103), ('2024-07-18', 175.00, 104), ('2024-07-21', 185.00, 105), ('2024-07-24', 195.00, 101),
-- August
('2024-08-01', 205.00, 102), ('2024-08-04', 215.00, 103), ('2024-08-07', 225.00, 104), ('2024-08-10', 235.00, 105),
('2024-08-13', 245.00, 101), ('2024-08-16', 255.00, 102), ('2024-08-19', 265.00, 103), ('2024-08-22', 275.00, 104),
-- September
('2024-09-03', 285.00, 105), ('2024-09-06', 295.00, 101), ('2024-09-09', 305.00, 102), ('2024-09-12', 315.00, 103),
('2024-09-15', 325.00, 104), ('2024-09-18', 335.00, 105), ('2024-09-21', 345.00, 101), ('2024-09-24', 355.00, 102),
-- October
('2024-10-01', 365.00, 103), ('2024-10-04', 375.00, 104), ('2024-10-07', 385.00, 105), ('2024-10-10', 395.00, 101),
('2024-10-13', 405.00, 102), ('2024-10-16', 415.00, 103), ('2024-10-19', 425.00, 104), ('2024-10-22', 435.00, 105),
-- November
('2024-11-03', 445.00, 101), ('2024-11-06', 455.00, 102), ('2024-11-09', 465.00, 103), ('2024-11-12', 475.00, 104),
('2024-11-15', 485.00, 105), ('2024-11-18', 495.00, 101), ('2024-11-21', 505.00, 102), ('2024-11-24', 515.00, 103),
-- December
('2024-12-01', 525.00, 104), ('2024-12-04', 535.00, 105), ('2024-12-07', 545.00, 101), ('2024-12-10', 555.00, 102),
('2024-12-13', 565.00, 103), ('2024-12-16', 575.00, 104), ('2024-12-19', 585.00, 105), ('2024-12-22', 595.00, 101);

SELECT 
  EXTRACT(YEAR FROM order_date) AS year,
  EXTRACT(MONTH FROM order_date) AS month
FROM online_sales
LIMIT 10;

SELECT 
  EXTRACT(YEAR FROM order_date) AS year,
  EXTRACT(MONTH FROM order_date) AS month,
  SUM(amount) AS total_revenue,
  COUNT(DISTINCT order_id) AS order_volume
FROM online_sales
GROUP BY year, month;

SELECT 
  EXTRACT(YEAR FROM order_date) AS year,
  EXTRACT(MONTH FROM order_date) AS month,
  SUM(amount) AS total_revenue,
  COUNT(DISTINCT order_id) AS order_volume
FROM online_sales
GROUP BY year, month
ORDER BY year ASC, month ASC;

SELECT 
  EXTRACT(YEAR FROM order_date) AS year,
  EXTRACT(MONTH FROM order_date) AS month,
  SUM(amount) AS total_revenue,
  COUNT(DISTINCT order_id) AS order_volume
FROM online_sales
WHERE order_date BETWEEN '2024-01-01' AND '2024-06-30'
GROUP BY year, month
ORDER BY year ASC, month ASC;

SELECT 
  EXTRACT(YEAR FROM order_date) AS year,
  EXTRACT(MONTH FROM order_date) AS month,
  SUM(amount) AS total_revenue,
  COUNT(DISTINCT order_id) AS order_volume
FROM online_sales
GROUP BY year, month
ORDER BY year DESC, month DESC
LIMIT 3;

SELECT 
  EXTRACT(YEAR FROM order_date) AS year,
  EXTRACT(MONTH FROM order_date) AS month,
  SUM(amount) AS total_revenue,
  COUNT(DISTINCT order_id) AS order_volume
FROM online_sales
GROUP BY year, month
ORDER BY year ASC, month ASC;

SELECT 
  EXTRACT(YEAR FROM order_date) AS year,
  EXTRACT(MONTH FROM order_date) AS month,
  SUM(amount) AS total_revenue,
  COUNT(DISTINCT order_id) AS order_volume
FROM online_sales
WHERE order_date BETWEEN '2024-01-01' AND '2024-06-30'
GROUP BY year, month
ORDER BY year ASC, month ASC;

SELECT 
  EXTRACT(YEAR FROM order_date) AS year,
  EXTRACT(MONTH FROM order_date) AS month,
  SUM(amount) AS total_revenue,
  COUNT(DISTINCT order_id) AS order_volume
FROM online_sales
GROUP BY year, month
ORDER BY year DESC, month DESC
LIMIT 3;
