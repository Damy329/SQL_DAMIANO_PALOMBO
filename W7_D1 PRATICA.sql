-- esercizio 1 trova la PK

SELECT 
*
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
-- WHERE TABLE_NAME = 'dimproduct'
 /* -- AND CONSTRAINT_NAME IN (
	SELECT CONSTRAINT_NAME
      FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
      WHERE TABLE_NAME = 'dimproduct'
        AND CONSTRAINT_TYPE = 'PRIMARY KEY')*/;
        
  SELECT
  productkey
  FROM
  dimproduct
  GROUP BY 
  productkey
  HAVING
  count(*)>1;
  
  
  -- esercizio 2
  SELECT
  concat(salesordernumber,SalesOrderLineNumber) as pk
  FROM
  factresellersales
  group by
  pk
  HAVING 
  count(*)>1;
  

    
  -- esercizio 3  
    
    WITH total_sales AS ( SELECT * FROM (
SELECT 'res' as channel,
frs.SalesOrderNumber,
frs.SalesOrderLineNumber,
frs.OrderDate,
frs.ProductKey,
frs.OrderQuantity,
frs.UnitPrice,
frs.TotalProductCost,
frs.SalesAmount
FROM factresellersales frs
UNION
SELECT 'int' as channel,
fis.SalesOrderNumber,
fis.SalesOrderLineNumber,
fis.OrderDate,
fis.ProductKey,
fis.OrderQuantity,
fis.UnitPrice,
fis.TotalProductCost,
fis.SalesAmount
FROM factinternetsales fis) as A
ORDER BY A.OrderDate)
SELECT
    OrderDate,
    channel,
    count(SalesOrderLineNumber) as lineeordine
    FROM
    total_sales
    GROUP BY 
    OrderDate, 
    channel
    HAVING 
    OrderDate >= '2020-01-01'
    order by Orderdate;
    
    -- ESERCIZIO 4
   SELECT
    p.EnglishProductName,
    SUM(f.SalesAmount) AS FATTURATOTOTALE,
    SUM(f.OrderQuantity) AS QUANTITATOTALE,
    SUM(f.SalesAmount)/ SUM(f.OrderQuantity) PREZZOMEDIO1,
    AVG(f.UnitPrice) as prezzomedio2
    
FROM
    factresellersales f
LEFT JOIN
    dimproduct p
ON
    f.ProductKey = p.ProductKey
GROUP BY
    p.EnglishProductName;

    
    -- ESERCIZIO 1 PAGINA 2 IMPOSTATO DA LUCA
    SELECT
EnglishProductCategoryName as NomeCategoria,
sum(SalesAmount) as fatturatototale, 
sum(OrderQuantity) as quantitatotale
FROM
	factresellersales f
INNER JOIN
	dimproduct p
ON
	f.ProductKey = p.ProductKey
INNER JOIN
	dimproductsubcategory s
ON
	p.ProductSubcategorykey = s.ProductSubcategoryKey
INNER JOIN
	dimproductcategory c
ON
	s.ProductCategoryKey = c.ProductCategoryKey
GROUP BY
	c.EnglishProductCategoryName;
    
    
    
    
    
    
    
    
    
    
  