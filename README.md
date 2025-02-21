# Pizza Sales Analysis Project

Welcome to the **Pizza Sales Analysis** project! This project utilizes SQL for data extraction and manipulation, combined with Power BI for interactive data visualizations. The goal is to analyze pizza sales data and derive valuable insights for improving business strategies.

## Table of Contents

- [Project Overview](#project-overview)
- [Data Analysis with SQL](#data-analysis-with-sql)
- [Building Dashboards with Power BI](#building-dashboards-with-power-bi)
- [Key Insights](#key-insights)
- [Project Structure](#project-structure)
- [Tools & Technologies](#tools--technologies)
- [License](#license)

## Project Overview

The goal of this project is to gain insights into pizza sales using SQL for querying and Power BI for creating dynamic dashboards. We explore the following key metrics and dimensions:

- **Sales Trends**: Analyze sales data on daily, weekly, and monthly bases.
- **Pizza Category & Size**: Investigate sales performance by pizza category and size.
- **Best & Worst Selling Pizzas**: Identify the top-performing and least-selling pizzas.

## Data Analysis with SQL

SQL queries are used to analyze and summarize the sales data. Here are some examples of key SQL queries used:

```sql
-- Total Revenue Calculation
SELECT SUM(total_price) AS total_revenue FROM pizza_sales;

-- Average Order Value Calculation
SELECT SUM(total_price) / COUNT(DISTINCT order_id) AS avg_order_value FROM pizza_sales;

-- Total Number of Pizzas Sold
SELECT SUM(quantity) AS total_pizza_sold FROM pizza_sales;

-- Identifying the Top 5 Best-Selling Pizzas by Revenue
SELECT pizza_name, SUM(total_price) AS total_revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_revenue DESC
LIMIT 5;

-- Percentage of Sales by Pizza Category
SELECT pizza_category, 
    ROUND(SUM(total_price), 2) AS total_revenue,
    ROUND(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales), 2) AS pct
FROM pizza_sales
GROUP BY pizza_category;

```
# Building Dashboards with Power BI

Power BI is used to create interactive dashboards that help visualize pizza sales data. The following dashboards and insights are included:

- **Sales Trends Dashboard**: Visualize sales over daily, weekly, and monthly periods.
- **Pizza Category & Size Breakdown**: Analyze sales by pizza category and size.
- **Top & Bottom Selling Pizzas**: Identify best and worst-selling pizzas based on revenue and quantity sold.

## How to Open and Explore the Power BI Report

1. Open Power BI Desktop.
2. Open the Power BI report file `pizza_sales_report.pbix`.
3. Explore the various interactive dashboards:
   - Use the filters to drill down into specific time periods, pizza categories, or sizes.
   - Hover over visuals to view more detailed information.

## Key Insights

From the analysis, we gathered the following insights:

### Top Performers:
- **Revenue**: Thai Chicken Pizza had the highest revenue.
- **Quantity Sold**: Classic Deluxe Pizza was the most sold.
- **Orders**: Classic Deluxe Pizza also led in total orders.

### Underperformers:
- **Revenue**: Brie Carre Pizza had the lowest revenue.
- **Quantity Sold**: Brie Carre Pizza had the least number of pizzas sold.
- **Orders**: Brie Carre Pizza had the fewest orders placed.

### Sales Trends:
- Sales peak on **Fridays and Saturdays**.
- **12:00 PM - 1:00 PM** is the busiest hour of the day.
- The month of **July** generates the highest revenue, while **October** shows the lowest.

## Project Structure

Here’s the structure of the project directory:
├── LICENSE
├── README.md              <- README for using this project.
├── query                  <- SQL queries for data analysis.
│   ├── pizza_sales_db.sql <- Database creation script.
│   └── query.sql          <- Final SQL queries used for analysis.
├── reports                <- Final reports of this project.
│   ├── Pizza_Sales_Report.pdf <- Detailed report of the analysis.
│   └── query_report.pdf  <- Query results verification report.
├── src                    <- Source files for this project.
│   ├── data               <- Data used in the project.
│   └── pizza_sales_images <- Dashboard images.
├── data_dictionary.csv    <- Data dictionary for the dataset.


This structure provides a clear overview of the project and its contents, helping users understand how the project is organized.



