Select * 

FROM pizza_sales

SELECT SUM(total_price) AS Total_rev 
FROM pizza_sales

SELECT SUM(total_price)/COUNT(DISTINCT order_id) 
FROM pizza_sales

SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,3))/CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,3))AS DECIMAL(10,3))
FROM pizza_sales
--MONTHLY TREND
SELECT DATENAME(MONTH,order_date) AS order_day, count(distinct order_id) AS orders
FROM pizza_sales
GROUP BY DATENAME(MONTH,order_date)

--HOURLY TREND
SELECT DATEPART(HOUR , order_time) AS order_hours,COUNT (DISTINCT order_id)
FROM pizza_sales
GROUP BY DATEPART(HOUR , order_time)
ORDER BY DATEPART(HOUR , order_time) IN ASC



SELECT pizza_category, SUM(total_price)*100/(SELECT  SUM(total_price)from pizza_sales)
FROM pizza_sales
GROUP BY pizza_category



SELECT pizza_category,Sum(quantity) AS total_sold, SUM(total_price)*100/
(SELECT sum(total_price) from pizza_sales WHERE MONTH(order_date)=1) AS PCT
from pizza_sales 
where month(order_date) = 1
group by pizza_category


select top 5 pizza_name,cast(sum(total_price)*100/(select sum(total_price) from pizza_sales )  as decimal(10,3)
from pizza_sales
group by pizza_name
order by pizza_name desc
