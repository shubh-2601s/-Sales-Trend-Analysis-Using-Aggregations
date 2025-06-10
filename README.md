# Monthly Revenue and Order Volume Analysis

## Project Overview

This project demonstrates how to analyze monthly revenue and order volume from an online sales dataset using MySQL. It covers:

- Creating the database and populating it with sample sales data.
- Extracting year and month from order dates.
- Grouping sales data by year and month.
- Calculating total revenue and order volume per month.
- Sorting and filtering results based on date ranges.
- Limiting the output to focus on specific periods.

This analysis is essential for businesses to understand their monthly performance, track sales trends, and make informed decisions.

---

## Dataset

The dataset simulates an `online_sales` table with the following schema:

| Column Name | Data Type       | Description                    |
|-------------|-----------------|-------------------------------|
| order_id    | INT (Primary Key, Auto Increment) | Unique ID for each order        |
| order_date  | DATE            | Date when the order was placed |
| amount      | DECIMAL(10,2)   | Revenue amount for the order   |
| product_id  | INT             | ID of the product sold         |

The dataset includes 100 rows covering sales throughout the year 2024.

---

## Setup Instructions

### 1. Create Database and Table

Run the following SQL commands to create the database and the `online_sales` table:

```sql
CREATE DATABASE IF NOT EXISTS sales_db;
USE sales_db;

DROP TABLE IF EXISTS online_sales;

CREATE TABLE online_sales (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    product_id INT NOT NULL
);
````
![image](https://github.com/user-attachments/assets/1ae5d1be-0dd6-44cf-9757-0ab8b884d8ee)


### 2. Insert Sample Data

Insert 100 sample sales records spanning January to December 2024:
```sql
-- (Insert the 100 rows sample data here - see SQL script)
```

![image](https://github.com/user-attachments/assets/9819eed0-3ec2-4b6f-82ad-5fdb6a1fd402)


### 3. Run Analysis Queries

The key SQL queries use the following concepts:

* `EXTRACT()` to get year and month from the order date.
* `GROUP BY` to aggregate by year and month.
* `SUM()` to calculate total monthly revenue.
* `COUNT(DISTINCT order_id)` to count monthly order volume.
* `ORDER BY` to sort the results.
* `WHERE` and `LIMIT` to filter and limit the results as needed.

---

## Sample Queries

### Extract Year and Month


```sql
SELECT 
  EXTRACT(YEAR FROM order_date) AS year,
  EXTRACT(MONTH FROM order_date) AS month
FROM online_sales
LIMIT 10;
```
![image](https://github.com/user-attachments/assets/07040f16-33d6-408e-b440-463e76cedc71)


### Monthly Revenue and Order Volume

```sql
SELECT 
  EXTRACT(YEAR FROM order_date) AS year,
  EXTRACT(MONTH FROM order_date) AS month,
  SUM(amount) AS total_revenue,
  COUNT(DISTINCT order_id) AS order_volume
FROM online_sales
GROUP BY year, month
ORDER BY year ASC, month ASC;
```
![image](https://github.com/user-attachments/assets/bff5d272-1df9-43d3-9a32-60c97f859291)


### Filter Results for Specific Time Period

```sql
SELECT 
  EXTRACT(YEAR FROM order_date) AS year,
  EXTRACT(MONTH FROM order_date) AS month,
  SUM(amount) AS total_revenue,
  COUNT(DISTINCT order_id) AS order_volume
FROM online_sales
WHERE order_date BETWEEN '2024-01-01' AND '2024-06-30'
GROUP BY year, month
ORDER BY year ASC, month ASC;
```
![image](https://github.com/user-attachments/assets/7c14e2a6-d2f2-4184-8d69-aff79a0f96de)


### Limit Output to Latest 3 Months

```sql
SELECT 
  EXTRACT(YEAR FROM order_date) AS year,
  EXTRACT(MONTH FROM order_date) AS month,
  SUM(amount) AS total_revenue,
  COUNT(DISTINCT order_id) AS order_volume
FROM online_sales
GROUP BY year, month
ORDER BY year DESC, month DESC
LIMIT 3;
```
![Uploading image.png…]()

---

## Technologies Used

* MySQL 8.0+
* SQL (Structured Query Language)

---

## Author

**Shubham S**

Email: [10221shubham.s@gmail.com](mailto:10221shubham.s@gmail.com)

LinkedIn: [https://www.linkedin.com/in/shubham-s-14ba6a283/](https://www.linkedin.com/in/shubham-s-14ba6a283/)

GitHub: [https://github.com/shubh-2601s](https://github.com/shubh-2601s)

---

## License

This project is open source and available under the MIT License.

---

## Contact

Feel free to reach out if you have questions, suggestions, or want to collaborate!

---

*Thank you for checking out my project!*


---
