Retail-Sales-Analysis
🛍️ SQL Retail Sales Analysis Project

This project demonstrates SQL skills in data cleaning, data exploration, and business analysis using a simulated retail sales dataset.
It highlights how SQL queries can extract valuable business insights such as sales trends, customer behavior, and performance metrics.

📂 Database Overview

Database Name: sql_project_p1
Table Name: retail_sales

🧱 Table Schema
Column Name	Data Type	Description
transactions_id	INT (PK)	Unique ID for each transaction
sale_date	DATE	Date of the sale
sale_time	TIME	Time of the sale
customer_id	INT	Unique customer ID
gender	VARCHAR(15)	Gender of the customer
age	INT	Age of the customer
category	VARCHAR(15)	Product category
quantity	INT	Quantity sold
price_per_unit	FLOAT	Price per unit
cogs	FLOAT	Cost of goods sold
total_sale	FLOAT	Total sale amount
🧹 Data Cleaning

Checked for NULL or missing values.

Ensured column data types and values were consistent.

No missing or duplicate rows were found.

SELECT *
FROM retail_sales
WHERE transactions_id IS NULL
   OR sale_date IS NULL
   OR sale_time IS NULL
   OR customer_id IS NULL
   OR gender IS NULL
   OR age IS NULL
   OR category IS NULL
   OR quantity IS NULL
   OR price_per_unit IS NULL
   OR cogs IS NULL
   OR total_sale IS NULL;

📊 Data Exploration

This section helps understand the dataset, customer demographics, and product distribution.

1️⃣ Total Number of Sales
SELECT COUNT(*) AS total_sales 
FROM retail_sales;

2️⃣ Number of Unique Customers
SELECT COUNT(DISTINCT customer_id) AS unique_customers
FROM retail_sales;



