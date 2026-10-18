select * from Superstore

SELECT COUNT(*) AS total_rows
FROM Superstore

SELECT TOP 10 *
FROM dbo.Superstore


SELECT
COUNT(*) AS total_rows,
COUNT(DISTINCT Row_ID) AS unique_row_ids
FROM Superstore


-- 1. Check duplicate Row_ID values
SELECT
Row_ID,
COUNT(*) AS id_count
FROM dbo.Superstore
GROUP BY Row_ID
HAVING COUNT(*) > 1


-- 2. Check missing values in key columns
SELECT
 SUM(CASE WHEN Row_ID IS NULL THEN 1 ELSE 0 END) AS missing_row_id,
 SUM(CASE WHEN Order_ID IS NULL THEN 1 ELSE 0 END) AS missing_order_id,
 SUM(CASE WHEN Order_Date IS NULL THEN 1 ELSE 0 END) AS missing_order_date,
 SUM(CASE WHEN Sales IS NULL THEN 1 ELSE 0 END) AS missing_sales,
 SUM(CASE WHEN Profit IS NULL THEN 1 ELSE 0 END) AS missing_profit
FROM Superstore


-- 3. Check invalid sales and quantity
SELECT
SUM(CASE WHEN Sales < 0 THEN 1 ELSE 0 END) AS negative_sales,
SUM(CASE WHEN Quantity <= 0 THEN 1 ELSE 0 END) AS invalid_quantity
FROM dbo.Superstore


-- 4. Check the date range
SELECT
MIN(Order_Date) AS first_order_date,
MAX(Order_Date) AS last_order_date
FROM dbo.Superstore

Section - 2

1)Overall business performance

SELECT
COUNT(*) AS total_rows,
COUNT(DISTINCT Order_ID) AS unique_orders,
SUM(Sales) AS total_sales,
SUM(Profit) AS total_profit,
AVG(Profit) AS avg_profit,
AVG(Discount) AS avg_discount
FROM Superstore

2)Loss-Making Transaction Analysis


SELECT
COUNT(*) AS total_transactions,
SUM(CASE WHEN Profit < 0 THEN 1 ELSE 0 END)
AS loss_making_transactions,
SUM(CASE WHEN Profit > 0 THEN 1 ELSE 0 END)
AS profitable_transactions,
SUM(CASE WHEN Profit = 0 THEN 1 ELSE 0 END)
AS zero_profit_transactions,
SUM(CASE WHEN Profit < 0 THEN Sales ELSE 0 END)
AS sales_from_loss_making_transactions,
SUM(CASE WHEN Profit < 0 THEN Profit ELSE 0 END)
AS total_loss_amount
FROM Superstore

3)Overall Profit Margin Analysis


SELECT
SUM(Sales) AS total_sales,
SUM(Profit) AS total_profit,
CAST(
SUM(Profit) * 100.0 / NULLIF(SUM(Sales), 0)
        AS DECIMAL(10,2)
 ) AS profit_margin_percentage
FROM Superstore

4)Sales and Profit by Year


SELECT
YEAR(Order_Date) AS order_year,
SUM(Sales) AS total_sales,
SUM(Profit) AS total_profit,
CAST(
      SUM(Profit) * 100.0 / NULLIF(SUM(Sales), 0)
      AS DECIMAL(10,2)
    ) AS profit_margin_percentage
FROM Superstore
GROUP BY YEAR(Order_Date)
ORDER BY order_year

5) Monthly Sales and Profit Trends

SELECT
YEAR(Order_Date) AS order_year,
MONTH(Order_Date) AS order_month,
SUM(Sales) AS total_sales,
SUM(Profit) AS total_profit,
CAST(
      SUM(Profit) * 100.0 / NULLIF(SUM(Sales), 0)
      AS DECIMAL(10,2)
    ) AS profit_margin_percentage
FROM Superstore
GROUP BY
YEAR(Order_Date),
MONTH(Order_Date)
ORDER BY
order_year,
order_month

SECTION 3 — CATEGORY AND SUBCATEGORY ANALYSIS

1) Profitability by Category


SELECT
 Category,
 COUNT(*) AS total_transactions,
 SUM(Sales) AS total_sales,
 SUM(Profit) AS total_profit,
 CAST(
      SUM(Profit) * 100.0 / NULLIF(SUM(Sales), 0)
     AS DECIMAL(10,2)
    ) AS profit_margin_percentage
FROM Superstore
GROUP BY Category
ORDER BY total_profit DESC

2) Profitability by Subcategory


SELECT
Category,
Sub_Category,
COUNT(*) AS total_transactions,
SUM(Sales) AS total_sales,
SUM(Profit) AS total_profit,
CAST(
      SUM(Profit) * 100.0 / NULLIF(SUM(Sales), 0)
        AS DECIMAL(10,2)
    ) AS profit_margin_percentage
FROM Superstore
GROUP BY
Category,
Sub_Category
ORDER BY total_profit


SELECT
    Sub_Category,
    COUNT(*) AS total_transactions,
    SUM(Sales) AS total_sales,
    SUM(Profit) AS total_profit
FROM Superstore
WHERE Sub_Category = 'Tables'
GROUP BY Sub_Category

3) Loss-Making Subcategories


SELECT
 Category,
 Sub_Category,
 COUNT(*) AS total_transactions,
 SUM(Sales) AS total_sales,
 SUM(Profit) AS total_profit
FROM Superstore
GROUP BY
Category,
Sub_Category
HAVING SUM(Profit) < 0
ORDER BY total_profit ASC

Section 4 — Discount and Profit Leakage Analysis

1) Profitability by Discount Level

SELECT
CASE
WHEN Discount = 0 THEN 'No Discount'
WHEN Discount <= 0.20 THEN 'Low (0-20%)'
WHEN Discount <= 0.50 THEN 'Medium (20-50%)'
ELSE 'High (50%+)'
END AS discount_group,
COUNT(*) AS total_transactions,
SUM(Sales) AS total_sales,
SUM(Profit) AS total_profit,
CAST(AVG(Profit) AS DECIMAL(10,2)) AS avg_profit,
SUM(CASE WHEN Profit < 0 THEN 1 ELSE 0 END)
AS loss_making_transactions
FROM Superstore
GROUP BY
CASE
        WHEN Discount = 0 THEN 'No Discount'
        WHEN Discount <= 0.20 THEN 'Low (0-20%)'
        WHEN Discount <= 0.50 THEN 'Medium (20-50%)'
        ELSE 'High (50%+)'
END
ORDER BY
MIN(Discount)

2) Discount Impact on the Tables Subcategory


SELECT
Discount,
COUNT(*) AS total_transactions,
SUM(Sales) AS total_sales,
SUM(Profit) AS total_profit,
CAST(AVG(Profit) AS DECIMAL(10,2)) AS avg_profit,
SUM(CASE WHEN Profit < 0 THEN 1 ELSE 0 END)
 loss_making_transactions
FROM Superstore
WHERE Sub_Category = 'Tables'
GROUP BY Discount
ORDER BY Discount

SECTION 5 — REGIONAL PERFORMANCE

1) Sales and Profit by Region


SELECT
Region,
COUNT(*) AS total_transactions,
SUM(Sales) AS total_sales,
SUM(Profit) AS total_profit,
CAST(
     SUM(Profit) * 100.0 / NULLIF(SUM(Sales), 0)
     AS DECIMAL(10,2)
    )  profit_margin_percentage,
SUM(CASE WHEN Profit < 0 THEN 1 ELSE 0 END)
loss_making_transactions
FROM Superstore
GROUP BY Region
ORDER BY total_profit 

2) Tables Profitability by Region


SELECT
Region,
COUNT(*) AS total_transactions,
SUM(Sales) AS total_sales,
SUM(Profit) AS total_profit,
CAST(AVG(Profit) AS DECIMAL(10,2)) AS avg_profit,
 SUM(CASE WHEN Profit < 0 THEN 1 ELSE 0 END)
 loss_making_transactions
FROM dbo.Superstore
WHERE Sub_Category = 'Tables'
GROUP BY Region
ORDER BY total_profit 

SECTION 6 — PRODUCT-LEVEL PROFIT LEAKAGE

 1)Top loss Making Products
 
 
SELECT top 5
 Product_Name,
 Sub_Category,
  COUNT(*) AS total_transactions,
  SUM(Sales) AS total_sales,
  SUM(Profit) AS total_profit,
  CAST(AVG(Discount) * 100 AS DECIMAL(10,2))
   avg_discount_percentage
FROM dbo.Superstore
WHERE Profit < 0
GROUP BY
 Product_Name,
 Sub_Category
ORDER BY total_profit

SECTION 7 — Business Summary

 1)Overall Business Health

 
SELECT
 COUNT(*) AS total_transactions,
 SUM(Sales) AS total_sales,
 SUM(Profit) AS total_profit,
 CAST(
    SUM(Profit) * 100.0 / NULLIF(SUM(Sales), 0)
     AS DECIMAL(10,2)
  ) AS overall_profit_margin_percentage,
    SUM(CASE WHEN Profit < 0 THEN 1 ELSE 0 END)
        AS loss_making_transactions,
    SUM(CASE WHEN Profit = 0 THEN 1 ELSE 0 END)
        AS zero_profit_transactions,
    SUM(CASE WHEN Discount >= 0.30 THEN 1 ELSE 0 END)
        AS transactions_with_30_percent_or_higher_discount
FROM Superstore







