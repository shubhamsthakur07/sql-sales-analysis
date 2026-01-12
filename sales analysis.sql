1) For understanding structure and checking columns:
select *
from 
    sales 
limit 
    10;

2) Shows company's overall revenue:
select 
    sum(sales) as total_revenue
from 
    sales;
-- Show total revenue

3) Shows company's profitability:
select 
    sum(Profit) as total_profit
from
    sales;
-- Show total profit

4) Which segment contributes the most:
select segment,
    sum(sales) as segment_revenue
From 
    sales
Group by 
	segment
order by 
	segment_revenue desc;
-- shows which segment contributed the most

5) Checking segment-wise profitability:
select segment,
    sum(profit) as segment_profit
From 
    sales
Group by 
	segment
order by 
	segment_profit desc;
-- shows which category contributed the most

6) Which category contributes the most:
select category,
    sum(sales) as category_revenue
From 
    sales
Group by 
	category
order by 
	category_revenue desc;
-- shows which category contributed the most

7) Checking category-wise profitability:
select category,
    sum(profit) as category_profit
From 
    sales
Group by 
	category
order by 
	category_profit desc;
-- shows which category contributed the most

8) Checking Top 10 Cities in order of revenue generated:
select city,
    sum(sales) as city_revenue
From 
    sales
Group by 
	city
order by 
	city_revenue desc
LIMIT
	10;
-- shows top 10 cities contributing the most revenue

9) Understanding Pricing & customers ordering behaviour:
select 
    avg(sales) as average_order_value
From 
    sales;

10) Geographic performance analysis:
SELECT Region,
       SUM(Sales) AS region_revenue
FROM 
   sales
GROUP BY 
    Region
ORDER BY 
   region_revenue DESC;

11) Checking operational efficiencies:
SELECT *
FROM 
    sales
WHERE
    Profit < 0;

12) Revenue distribution:
SELECT 
  CASE 
    WHEN Sales >= avg(sales) THEN 'High Value'
    ELSE 'Low Value'
  END AS 
    order_type,
  COUNT(*) AS order_count,
  SUM(Sales) AS total_revenue
FROM 
    sales
GROUP BY 
    order_type;

13) Premium (above average) Transactions 
SELECT *
FROM 
    sales
WHERE 
    Sales > (
  SELECT AVG(Sales)
  FROM sales
)
GROUP BY 
	segment
ORDER BY 
	segment;