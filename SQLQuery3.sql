use superstore;

SELECT * FROM pizza_sales;

SELECT SUM(total_price) AS total_revenu FROM pizza_sales;

SELECT SUM(total_price)/ COUNT(DISTINCT order_id) AS avg_order_value FROM pizza_sales;

SELECT SUM(quantity) AS total_pizza_sold FROM pizza_sales;

SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales;

SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))
AS Avg_Pizzas_per_order
FROM pizza_sales;

SELECT DATENAME(DW, order_date) as order_day, COUNT(DISTINCT order_id) AS
total_orders
FROM pizza_sales
GROUP BY DATENAME(DW, order_date);

SELECT DATENAME(MONTH, order_date) as month_name, COUNT(DISTINCT order_id) AS
total_orders
FROM pizza_sales
GROUP BY DATENAME(MONTH, order_date)
ORDER BY total_orders DESC;

SELECT pizza_category,CAST(SUM(total_price) AS DECIMAL(10,2)) AS total_revenue,
CAST (SUM(total_price)*100 / (SELECT SUM(total_price) FROM pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_category;

SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size


SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM pizza_sales
WHERE MONTH(order_date) = 2
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC

SELECT TOP 5 pizza_name, sum(total_price) AS total_Revenue
from pizza_sales
GROUP BY pizza_name
ORDER BY total_Revenue DESC;

SELECT TOP 5 pizza_name, sum(total_price) AS total_Revenue
from pizza_sales
GROUP BY pizza_name
ORDER BY total_Revenue ASC;

SELECT TOP 5 pizza_name, sum(quantity) AS total_quantity
from pizza_sales
GROUP BY pizza_name
ORDER BY total_quantity DESC;

SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) AS total_order
from pizza_sales
GROUP BY pizza_name
ORDER BY total_order DESC;

