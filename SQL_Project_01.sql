# SQL Retail Sales Analysis

CREATE DATABASE sql_project_p1;
USE sql_project_p1;

# CREATE TABLE
DROP TABLE IF EXISTS retail_sales;
CREATE TABLE retail_sales
			(
            transactions_id	INT PRIMARY KEY,
            sale_date DATE,
            sale_time TIME,
            customer_id	INT,
            gender VARCHAR(15),
            age	INT,
            category VARCHAR(15),
            quantity	INT,
            price_per_unit	FLOAT,
            cogs FLOAT,
            total_sale FLOAT      
);

-- Data Cleaning

select * from retail_sales ;

SELECT COUNT(*) FROM retail_sales;

SELECT * 
FROM retail_sales
WHERE transactions_id IS NULL
		OR
		sale_date IS NULL
        OR
        sale_time IS NULL
        OR
        customer_id	IS NULL
        OR
        gender IS NULL
        OR 
        age	IS NULL
        OR
        category IS NULL
        OR
        quantity	IS NULL
        OR
        price_per_unit IS NULL
        OR
        cogs IS NULL
        OR 
        total_sale IS NULL;

-- Data Exploration

-- How many sales we have ?
SELECT COUNT(*) as total_sales FROM retail_sales;

-- How many unique customers do we have ?
SELECT COUNT(DISTINCT customer_id) FROM retail_sales;

-- How many category we have and which are they?
SELECT 
	ROW_NUMBER() OVER(ORDER BY Category), 
    Category 
FROM
	(SELECT DISTINCT category FROM retail_sales) as unique_category;
    
-- Data Anaylsis & Bussiness Problems and Answer.

-- Q1 Write a SQL query to retrieve all columns for sales made on "2022-11-05."

SELECT * 
FROM retail_sales
WHERE sale_date = '2022-11-05';

/* Q2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more
 than 4 in the month Nov-2022. */
 
SELECT * 
FROM retail_sales
WHERE category = 'Clothing'
AND DATE_FORMAT(sale_date, '%Y-%m') = '2022-11'
AND quantity >= 4;

-- Q3 Write a SQL query to calculate the toal sales(total_sales) for each category.

SELECT
	Category, 
    SUM(total_sale) as net_sales,
    COUNT(*) as total_orders
FROM retail_sales
GROUP BY Category;

-- Q4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.

SELECT 
	CEIL(AVG(age)) as AVG_AGE
FROM retail_sales
WHERE category = "Beauty";

-- Q5 Write a SQL query to find all transactions where the total_sale is greater than 1000.

SELECT *
FROM retail_sales
WHERE total_sale > 1000;

-- Q6 Write a SQL query to find all to total number of transactions  (transaction_id ) made by each gender in each category.

SELECT 
	gender, 
    category, 
    COUNT(*) total_trans
FROM retail_sales
GROUP BY 
	gender, 
    category;
    
-- Q7 Write a SQL query to calculate the average sale for each month. Find out the best selling month in each year.

SELECT 
	Year, 
    Month, 
    Avg_Sale
FROM (
	SELECT 
		YEAR(sale_date) as Year,
		MONTH(sale_date) as Month,
		AVG(total_sale) as Avg_Sale,
		RANK() OVER(PARTITION BY YEAR(sale_date) ORDER BY AVG(total_sale) DESC) as rn
	FROM retail_sales
	GROUP By 
		Year, 
		Month) as t
WHERE rn = 1;

-- Q8 Write a SQL query to find the top 5 customers based on the highest total sales.

SELECT 
	customer_id,
    SUM(total_sale) as total_sales
FROM retail_sales
GROUP By 1
ORDER BY 2 DESC
LIMIT 5;

-- Q9 Write a SQL query to find the number of unique customers who purchased items from each category.

SELECT
	category,
    COUNT(DISTINCT customer_id)
FROM retail_sales
GROUP BY category;

-- Q10 Write a SQL query to create each shift and number of orders (Example Morning <= 12, Afternoon Between 12 & 17, Evening > 17).

SELECT CASE
    WHEN HOUR(sale_time) < 12 THEN "Morning"
    WHEN HOUR(sale_time)  BETWEEN 12 AND 17 THEN "Afternoon"
    ELSE "Evening"
    END as Shift,
    COUNT(*) as total_orders
FROM retail_sales
GROUP BY Shift;
    








