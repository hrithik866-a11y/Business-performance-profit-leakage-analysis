# Business-performance-profit-leakage-analysis
End-to-end retail profitability analysis using Python, SQL Server, and Power BI to identify profit leakage, discount-related losses, and regional performance opportunities.

## Project Overview

This project analyzes the Global Superstore retail dataset to understand business performance, identify profit leakage, and investigate factors associated with low or negative profitability.

The analysis uses Python for data preparation and exploratory analysis, SQL Server for business-focused querying, and Power BI to build an interactive dashboard that communicates findings to business stakeholders.

## Business Problem

A retail business can generate high sales while still losing profit on specific products, subcategories, discount levels, or regions.

The objective of this project is to answer key business questions:

- How are sales and profits changing over time?
- Which product categories and subcategories contribute the most and least profit?
- How are discount levels associated with profitability?
- Which regions have weaker profit margins or greater losses?
- Which products and transactions should management investigate?
- What actions could help improve profitability?

## Tools and Technologies

- **Python:** pandas, NumPy, SciPy, Matplotlib
- **SQL:** SQL Server, SQL Server Management Studio (SSMS)
- **Business Intelligence:** Microsoft Power BI
- **Analysis:** Data quality checks, exploratory data analysis, descriptive statistics, aggregation, correlation analysis, KPI reporting, and data visualization
- **Version Control:** GitHub

## Dataset

The project uses the Global Superstore retail dataset, containing approximately 51,290 transaction rows and 27 columns.

Important fields include:

- Order Date and Ship Date
- Order ID and Customer ID
- Product Name, Category, and Subcategory
- Region and Market
- Sales, Profit, Discount, and Quantity

The dataset is used for retail performance analysis at transaction, product, subcategory, regional, and time levels.

## Project Workflow

### 1. Python — Data Preparation and Exploratory Analysis

- Inspected dataset structure, column data types, missing values, and duplicate rows.
- Converted order and shipping dates into datetime format.
- Calculated shipping duration in days.
- Examined descriptive statistics for sales, profit, discount, and quantity.
- Identified loss-making transactions and unusually high discounts.
- Compared profitability across discount groups, subcategories, regions, and products.
- Analyzed the relationship between discount and profit using Spearman rank correlation.
- Examined monthly and yearly sales and profit trends.

### 2. SQL Server — Business Analysis

Used SQL queries to analyze:

- Overall sales, profit, and profit margin
- Yearly and regional business performance
- Category and subcategory profitability
- Discount levels and loss-making transactions
- Least profitable products
- Regional losses within the Tables subcategory

### 3. Power BI — Interactive Dashboard

The dashboard is organized into three analytical pages:

**Executive Overview**
- Overall business KPIs
- Sales and profit trends
- Category performance
- Regional performance

**Profit Leakage**
- Loss-making transactions
- Discount-related profitability
- Underperforming subcategories
- Least profitable products

**Regional & Product Insights**
- Regional profit and margin comparisons
- Tables subcategory losses by region
- Product-level profitability analysis

## Key Findings

The analysis identified several areas for management investigation:

- **Overall performance:** Total sales were approximately 12.64 million, total profit approximately 1.47 million, and overall profit margin approximately 11.61%.
- **Discount-related losses:** Higher discount groups showed substantially weaker aggregate profitability in the analyzed data.
- **Subcategory performance:** Tables generated approximately 757,034 in sales but a total loss of approximately 64,083.
- **Category comparison:** Technology and Office Supplies showed higher overall profit margins than Furniture.
- **Regional performance:** Profitability varied across regions, indicating opportunities for more targeted regional analysis.
- **Time trends:** Annual sales and profit increased from 2011 through 2014, although profit margin varied between years.

*Note: These are descriptive findings from the dataset. Relationships between discounts and profit do not, by themselves, prove causation.*

## Business Recommendations

- Review discount policies for transactions and products with recurring losses.
- Investigate the Tables subcategory, including product- and region-level results.
- Monitor profit margin alongside sales rather than using sales alone to evaluate performance.
- Review high-value loss-making transactions before changing pricing or discount policies.
- Use regional and product-level dashboards to prioritize further investigation.

## Repository Structure

```text
business-performance-profit-leakage/
│
├── README.md
├── Business_Performance_Profit_Leakage_Intelligence.pbix
│
├── python/
│   └── superstore_analysis.ipynb
│
├── sql/
│   └── superstore_analysis.sql
│
└── screenshots/
    ├── 01_Executive_Overview.png
    ├── 02_Profit_Leakage.png
    └── 03_Regional_Product_Insights.png
```

## How to Explore This Project

1. Review the Power BI dashboard screenshots in the `screenshots` folder.
2. Open the Python notebook to explore data preparation and statistical analysis.
3. Review the SQL scripts for business analysis queries.
4. Open the Power BI file in Microsoft Power BI Desktop to explore the interactive report, if the file is available.

## Skills Demonstrated

Python, pandas, NumPy, exploratory data analysis, descriptive statistics, correlation analysis, SQL, aggregations, business KPI analysis, Power BI dashboards, data storytelling, and business recommendations.

## Project Objective

To demonstrate an end-to-end data analytics workflow that transforms retail transaction data into actionable insights for understanding profitability and identifying potential profit leakage.
