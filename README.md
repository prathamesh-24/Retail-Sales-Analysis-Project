# Retail-Sales-Analysis

# 🛍️ SQL Retail Sales Analysis Project

This project demonstrates SQL skills in **data cleaning**, **data exploration**, and **business analysis** using a simulated retail sales dataset.  
It highlights how SQL queries can extract valuable business insights such as sales trends, customer behavior, and performance metrics.

---

## 📂 Database Overview

**Database Name:** `sql_project_p1`  
**Table Name:** `retail_sales`

## 🧱 Table Schema

| Column Name      | Data Type   | Description |
|------------------|-------------|--------------|
| transactions_id  | INT (PK)    | Unique ID for each transaction |
| sale_date        | DATE        | Date of the sale |
| sale_time        | TIME        | Time of the sale |
| customer_id      | INT         | Unique customer ID |
| gender           | VARCHAR(15) | Gender of the customer |
| age              | INT         | Age of the customer |
| category         | VARCHAR(15) | Product category |
| quantity         | INT         | Quantity sold |
| price_per_unit   | FLOAT       | Price per unit item |
| cogs             | FLOAT       | Cost of goods sold |
| total_sale       | FLOAT       | Total sale amount |

---

## 🧹 Data Cleaning

- Checked for **missing or NULL values** in all columns.  
- Verified **data integrity** and **column consistency**.  
- No missing or duplicate entries were found.

```sql
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
   OR total_sale IS NULL; ```

## 📊 Data Exploration

The goal of this section is to understand the dataset and get an overview of the data distribution, customer behavior, and product variety.  
Below are some SQL queries used to explore and summarize the dataset.

---

## 🧾 1️⃣ Total Number of Sales
To get the total number of sales transactions in the dataset:

```sql
SELECT COUNT(*) AS total_sales 
FROM retail_sales; ```

## 🧾 :two: Total Number of Sales
To find how many distinct customers made purchases:

```sql
SELECT COUNT(DISTINCT customer_id) AS unique_customers
FROM retail_sales; ```



