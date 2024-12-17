USE Adventureworksdw;
SELECT *
FROM dimproduct;
SELECT  ProductKey, ProductAlternateKey, EnglishProductName AS Product_name, Color, StandardCost, FinishedGoodsFlag AS present_in_stock
FROM dimproduct;
SELECT   ProductKey, ProductAlternateKey, EnglishProductName, Color, StandardCost, FinishedGoodsFlag
FROM dimproduct
WHERE  FinishedGoodsFlag=1;
SELECT ProductKey, ProductAlternateKey, EnglishProductName, StandardCost, ListPrice
FROM dimproduct
WHERE ProductAlternateKey LIKE 'FR%' OR 'BK%';
SELECT ProductKey, ProductAlternateKey, EnglishProductName, StandardCost, ListPrice, ListPrice - StandardCost AS Markup
FROM  dimproduct;
SELECT ProductKey, ProductAlternateKey, EnglishProductName, StandardCost, ListPrice, FinishedGoodsFlag
FROM dimproduct
WHERE FinishedGoodsFlag=1 AND ListPrice BETWEEN 1000 AND 2000;
SELECT *
FROM DimEmployee;
SELECT EmployeeKey
FROM DimEmployee
WHERE SalespersonFlag=1;
SELECT *
FROM FactResellerSales;
SELECT Productkey, SalesOrderNumber, SalesOrderLineNumber, orderdate, UnitPrice, totalproductcost, salesAmount, SalesAmount - TotalProductCost AS Profit
FROM FactResellerSales
WHERE Productkey IN (597, 598, 477, 214) AND Orderdate >= '2020-01-01'; 
