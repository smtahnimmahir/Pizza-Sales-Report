USE [Pizza DB];

select * from pizza_sales


-- Total Revenue Order
SELECT sum(total_price) As Total_revenue from pizza_sales

-- Average order value
SELECT sum(total_price) / COUNT(DISTINCT order_id) as Avg_Order_Value from pizza_sales

--Total Pizza Sold

SELECT sum(quantity) AS  Total_Pizza_Sold from pizza_sales

-- Total Order
SELECT COUNT(DISTINCT order_id) AS Total_orders from pizza_sales

-- Average Pizzas per Order
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) AS Avg_Pizzas_per_order from pizza_sales

-- Daily Trend for Total Orders

SELECT DATENAME(DW, order_date) AS order_day, 
       COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales
GROUP BY DATENAME(DW, order_date)

-- C. Hourly Trend for Orders
SELECT DATEPART(HOUR, order_time) AS order_hours, 
       COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY DATEPART(HOUR, order_time)
ORDER BY DATEPART(HOUR, order_time);


-- Monthly Trend for Total Orders

SELECT DATENAME(MONTH, order_date) AS Month_Name, 
       COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales
GROUP BY DATENAME(MONTH, order_date)
ORDER BY Total_Orders DESC

-- Percentage of all catagory pizza sales

SELECT pizza_category,sum(total_price) AS Total_Sales, sum(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales) AS Percentage_Of_Sales
FROM pizza_sales
GROUP BY pizza_category

-- Percentage of all catagory pizza sales By filterring , 1 Means January

SELECT pizza_category,sum(total_price) AS Total_Sales, sum(total_price) * 100 / 
(SELECT SUM(total_price) FROM pizza_sales WHERE MONTH(order_date) =1  ) AS Percentage_Of_Sales
FROM pizza_sales
WHERE MONTH(order_date) =1 
GROUP BY pizza_category

-- Percentage of all catagory pizza sales based on pizza size

SELECT pizza_size, CAST(sum(total_price) AS DECIMAL(10,2)) AS Total_Sales, CAST(sum(total_price) * 100  /
(SELECT SUM(total_price) FROM pizza_sales) AS DECIMAL(10,2)) AS Percentage_Of_Sales
FROM pizza_sales
GROUP BY pizza_size
ORDER BY Percentage_Of_Sales DESC

-- Top 5 Pizzas by Revenue & ORDER
SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Order,  SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC


-- Lowest 5 Pizzas by Revenue & Order
SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Order, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC

-- Top 5 Pizzas Sold in Augest
SELECT TOP 5 pizza_name,  SUM(quantity) AS Total_Pizzas_Sold
FROM pizza_sales
WHERE MONTH(order_date) = 8
GROUP BY pizza_name
ORDER BY Total_Pizzas_Sold ASC





 

 -- NOTE: If you want to apply the Month, Quarter, Week filters to the above queries you can use WHERE clause. Follow some of the below examples.

-- Example 1: Filter by Month
SELECT DATENAME(DW, order_date) AS order_day, 
       COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
WHERE MONTH(order_date) = 1  -- Here, MONTH(order_date) = 1 indicates that the output is for the month of January.
GROUP BY DATENAME(DW, order_date);

-- Example 2: Filter by Quarter
SELECT DATENAME(DW, order_date) AS order_day, 
       COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
WHERE DATEPART(QUARTER, order_date) = 1  -- Here, DATEPART(QUARTER, order_date) = 1 indicates that the output is for the Quarter 1.
GROUP BY DATENAME(DW, order_date);
