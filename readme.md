# AdventureWorks Sales, Customer & Product Analysis
## Project Overview

This project provides an end-to-end analysis of the AdventureWorks dataset, a fictional manufacturing company that sells bicycles and related accessories through online and reseller channels.
The goal of this analysis is to help management understand sales performance, customer behavior, product profitability, and regional business trends.

The project uses SQL for exploration, Power BI for modeling and visualization, and structured documentation to highlight insights supported by evidence.
 
## Project Goals

This analysis focuses on four main objectives:

1. Explore and analyze all key AdventureWorks tables (Sales, Products, Customers, Territories, Resellers).

2. Identify five (5) high-quality, business-relevant insights, each backed by data.

3. Support insights with:

- SQL queries

- Visualizations (Power BI charts and KPIs)

- Clear explanations and reasoning

4. Deliver a presentation-ready analytical report designed for executive consumption.


## Dataset Description

The AdventureWorks dataset includes several relational tables such as:

- Sales.SalesOrderHeader – order details, revenue, status, dates

- Sales.SalesOrderDetail – line items, quantity, unit price

- Production.Product & ProductCategory – product attributes

- Sales.Customer – customer attributes

- Sales.SalesTerritory – regional information

- DateTable – used for creating a proper date hierarchy

This project uses a combination of these tables to build a clean, analysis-ready model.

## Key Insights Discovered

Below are some insights uncovered in this analysis (actual figures may vary depending on filters and time ranges):

- Revenue is dominated by a small set of product categories, especially Bikes, which also contribute over ~56% of total orders.

- The U.S. territory is the strongest performer, with the highest order volume and revenue.

- Top ten customers contribute less significantly in percentage to total revenue, revealing potential for more customer acquisition.


Each insight is supported with SQL queries, DAX measures, and visual evidence.

## Tools & Technologies Used
Tools
1. SQL Server - Data extraction, cleaning, joins, and exploration
2. Power BI - Data modeling, relationships, DAX calculations, dashboard creation
3. DAX Measures	- Building KPIs such as Revenue, Profit, AOV, Returning Customers
4. GitHub - Version control and documentation


## Project Structure

```
|- raw_data/
|   |- HumanResources_Employee.csv
|   |- Person_Person.csv
|   |- Production_Product.csv
|   |- Sales_Customer.csv
|   |- Sales_SalesOrderDetail.csv
|   |- Sales_SalesOrderHeader.csv
|   |- Sales_SalesTerritory.csv
|
|- report/
|   |- Olajide_Abdullateef_Analytics_Dashboard_report.pdf
|   |- Olajide_Abdullateef_Analytics_Hackaton_Powerbi_Report.pbix
|   |- Olajide_Abdullateef_Analytics_Hackaton_Project_Report.pdf
|
|- scrits/
|   |- queries.sql
|   |- read_data.py
|
|- visuals/
|  
|- README.md

```


## How to Use This Repository

1. Clone the repository:

git clone https://github.com/TheOlajide/The-Analytics-Hackaton-2025.git


2. Open the SQL scripts to explore or run queries against your AdventureWorks database.

3. Open the .pbix file in Power BI Desktop to view or customize the dashboard.



## Dashboard Preview
- [AdventureWorks_Dashboard](report/Olajide_Abdullateef_Analytics_Dashboard_report.pdf)

- [AdventureWorks_Visuals](visuals)

- Click [here](https://app.powerbi.com/view?r=eyJrIjoiM2ZmZDI1NzEtNGZiYi00OWU4LTkxOWQtYzc2NGMwMThkZjBjIiwidCI6ImU0ZjcyZThjLTZiZjUtNGZmZS1iZjFlLWY4YWY0MzM1MDNiMyIsImMiOjh9) to interact with live dashboard.


## Contact

For questions/feedback or collaboration, reach out:

- Email: olajideabdullateef@gmail.com

- LinkedIn: www.linkedin.com/in/olajideabdullateef