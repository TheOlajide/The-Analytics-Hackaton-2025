

 SELECT
  *
 FROM
  Sales.SalesOrderHeader
 -----------------------------
 --What month has the peak revenue and order?
SELECT
  DATEPART(YEAR, OrderDate) AS year,
  DATEPART(MONTH, OrderDate) AS month,
  SUM(SubTotal) AS Total_Sales,
  COUNT( SalesOrderID) AS Total_Orders
FROM
 Sales.SalesOrderHeader
GROUP BY
 DATEPART(YEAR, OrderDate),
 DATEPART(MONTH, OrderDate)
ORDER BY
  year,Total_Sales DESC




--What are the top ten customers by revenue?
SELECT top 10
 CustomerID,
 Round(SUM(LineTotal),0) AS revenue
FROM
 Sales.SalesOrderDetail
JOIN
 Sales.SalesOrderHeader
ON
 SalesOrderDetail.SalesOrderID =
 SalesOrderHeader.SalesOrderID
GROUP BY
 CustomerID
ORDER BY
 revenue DESC;

-- What are the top 5 salesperson by Orders Received
SELECT TOP 5
 COALESCE
 (CAST(SalesPersonID AS VARCHAR(25)),'unknown')
    AS SalesPerson,
 Count (SalesOrderID) AS Orders_Received
FROM
 Sales.SalesOrderHeader
GROUP BY
 SalesPersonID
ORDER BY
 Orders_Received DESC

--what are the top 5 products by orders
SELECT TOP 5
 Name AS Product_name,
 COUNT(SalesOrderID) AS Orders,
 ROUND(SUM(LineTotal),0) AS revenue
FROM
 Sales.SalesOrderDetail
JOIN
 Production.product
ON
 SalesOrderDetail.ProductID =
 Product.ProductID
GROUP BY
 Name
ORDER BY
 Orders DESC

-- What are the Orders and Sales volume by Continent
EXEC
sp_rename
'Sales.SalesTerritory.Group', 'Continent', 'COLUMN';
SELECT
 SalesTerritory.Continent,
 COUNT(SalesOrderID) AS orders,
 ROUND(SUM(SubTotal),0) AS revenue
FROM
 Sales.SalesTerritory
JOIN
 Sales.SalesOrderHeader
ON
 SalesTerritory.TerritoryID = 
 SalesOrderHeader.TerritoryID
GROUP BY
 Continent
ORDER BY
 orders DESC

-- What are the Orders and Sales volume by Continent
SELECT
 CASE
  WHEN CountryRegionCode = 'DE' THEN 'Germany'
  WHEN CountryRegionCode = 'FR' THEN 'France'
  WHEN CountryRegionCode = 'GB' THEN 'United Kingdom'
  WHEN CountryRegionCode = 'CA' THEN 'Canada'
  WHEN CountryRegionCode = 'AU' THEN 'Australia'
  WHEN CountryRegionCode = 'US' THEN 'United States' END AS Country,
 COUNT(SalesOrderID) AS orders,
 ROUND(SUM(SubTotal),0) AS sales
FROM
 Sales.SalesTerritory
JOIN
 Sales.SalesOrderHeader
ON
 SalesTerritory.TerritoryID = 
 SalesOrderHeader.TerritoryID
GROUP BY
CASE
  WHEN CountryRegionCode = 'DE' THEN 'Germany'
  WHEN CountryRegionCode = 'FR' THEN 'France'
  WHEN CountryRegionCode = 'GB' THEN 'United Kingdom'
  WHEN CountryRegionCode = 'CA' THEN 'Canada'
  WHEN CountryRegionCode = 'AU' THEN 'Australia'
  WHEN CountryRegionCode = 'US' THEN 'United States' END
ORDER BY
 orders DESC

-- What US regions drive sales and Orders?

SELECT
 Name AS US_Regions,
 COUNT(SalesOrderID) AS orders,
 ROUND(SUM(SubTotal),0) AS sales
FROM
 Sales.SalesTerritory
JOIN
 Sales.SalesOrderHeader
ON
 SalesTerritory.TerritoryID = 
 SalesOrderHeader.TerritoryID
WHERE
 CountryRegionCode = 'US'
GROUP BY
 Name
ORDER BY
 orders DESC