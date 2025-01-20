-- ESERCIZIO DI PRATICA 10/01
USE ADVENTUREWORKSDW;

-- ESERCIZIO 1
CREATE VIEW 
	Product
AS
SELECT
	ProductKey AS IdProdotto
    , p.Englishproductname AS NomeProdotto
    , cat.EnglishProductCategoryName AS Categoria
	, sub.EnglishProductSubcategoryName AS SottoCategoria
FROM
	dimproduct AS p
INNER JOIN
	dimproductsubcategory AS sub
ON
	P.PRODUCTSUBCATEGORYKEY = sub.PRODUCTSUBCATEGORYKEY
INNER JOIN
	dimproductcategory AS cat
ON
	sub.productcategorykey = cat.productcategorykey
;


-- ESERCIZIO 2
CREATE VIEW
	Reseller
AS
SELECT
	ResellerKey
	, ResellerName
    , city
    , EnglishCountryRegionName
FROM 
	dimreseller AS res
INNER JOIN
	dimgeography AS geo
ON
	res.GeographyKey = geo.GeographyKey
;



-- ESERCIZIO 3
CREATE VIEW 
	sales 
AS 
SELECT 
frs.SalesOrderNumber,
frs.SalesOrderLineNumber,
frs.OrderDate,
frs.ProductKey,
frs.ResellerKey,
frs.OrderQuantity,
frs.UnitPrice,
frs.TotalProductCost,
frs.SalesAmount,
case when TotalProductCost is null then frs.SalesAmount - frs.OrderQuantity *pr.StandardCost
        else SalesAmount - TotalProductCost end as Markup_corretto
FROM 
factresellersales AS frs
inner join 
dimproduct as pr 
on frs.ProductKey=pr.ProductKey
;