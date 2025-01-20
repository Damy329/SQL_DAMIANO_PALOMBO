-- Esplora la tabelle dei prodotti (DimProduct)

SELECT 
    *
FROM
    DimProduct
;

 -- Interroga la tabella dei prodotti DimProduct) ed esponi in output i campi ProductKey, ProductAlternateKey, EnglishProductName, 
SELECT 
    ProductKey,
    ProductAlternateKey AS 'Modello',
    EnglishproductName AS 'Nome_Prodotto',
    Color AS 'Colore',
    StandardCost AS 'Costo_Standard',
    FinishedGoodsFlag AS 'ProdottiFiniti'
FROM
    DimProduct

-- Partendo dalla query scritta nel passaggio precedente, esponi in output i soli prodotti 
-- finiti cioè quelli per cui il campo FinishedGoodsFlag è uguale a 1.

SELECT
	ProductKey
, ProductAlternateKey AS "Modello"
, EnglishproductName AS "Nome_Prodotto"
, Color AS "Colore"
, StandardCost AS "Costo_Standard"
, FinishedGoodsFlag AS "ProdottiFiniti"

FROM 
	DimProduct

WHERE 
	FinishedGoodsFlag = 1
;

--  Scrivi una nuova query al fine di esporre in output i prodotti il cui codice modello (ProductAlternateKey) comincia con FR oppure BK.
--  Il result set deve contenere il codice prodotto (ProductKey), il modello, il nome del prodotto, il costo standard (StandardCost) e il prezzo di listino (ListPrice).

SELECT
	ProductKey
, ProductAlternateKey AS "Modello"
, EnglishproductName AS "Nome_Prodotto"
, Color AS "Colore"
, StandardCost AS "Costo_Standard"
, ListPrice AS "Prezzo_listino"

FROM 
	DimProduct
    
WHERE 
	ProductAlternateKey LIKE "FR%"
OR 
	ProductAlternateKey LIKE "BK%"
;

-- Arricchisci il risultato della query scritta nel passaggio precedente del Markup applicato dallʼazienda (ListPrice - StandardCost)

SELECT
	ProductKey
, ProductAlternateKey AS "Modello"
, EnglishproductName AS "Nome_Prodotto"
, Color AS "Colore"
, StandardCost AS "Costo_Standard"
, ListPrice AS "Prezzo_listino"
, ListPrice - StandardCost AS "Markup"

FROM 
	DimProduct
    
WHERE 
	ProductAlternateKey LIKE "FR%"
OR 
	ProductAlternateKey LIKE "BK%"
;

-- Scrivi unʼaltra query al fine di esporre lʼelenco dei prodotti finiti il cui prezzo di listino è compreso tra 1000 e 2000.

SELECT
	ProductKey
, ProductAlternateKey AS "Modello"
, EnglishproductName AS "Nome_prodotto"
, Color AS "Colore"
, StandardCost AS "Costo_Standard"
, ListPrice AS "Prezzo_listino"
, ListPrice - StandardCost AS "Markup"

FROM 
	DimProduct
    
WHERE 
	FinishedGoodsFlag = 1
AND 
	Listprice BETWEEN 1000 AND 2000
;

-- Esplora la tabella degli impiegati aziendali (DimEmployee)

SELECT
	*
FROM 
	dimemployee
;

-- Esponi, interrogando la tabella degli impiegati aziendali, lʼelenco dei soli agenti. 
-- Gli agenti sono i dipendenti per i quali il campo SalespersonFlag è uguale a 1.

SELECT
	EmployeeKey
    , FirstName
    , LastName
    , Title
    , EmailAddress
    , SalesPersonFlag
    , DepartmentName

FROM 
	dimemployee
    
WHERE 
	SalesPersonFlag = 1
    
AND (LastName LIKE "F%" OR FIRSTNAME LIKE "W%")
;


SELECT
	EmployeeKey
    , FirstName
    , LastName
    , Title
    , EmailAddress
    , SalesPersonFlag
    , DepartmentName

FROM 
	dimemployee
    
WHERE 
	SalesPersonFlag = 1 AND LastName LIKE "F%"
 OR 
	SalesPersonFlag = 1 AND Firstname LIKE "W%"
;

-- Interroga la tabella delle vendite (FactResellerSales). Esponi in output lʼelenco delle transazioni 
-- registrate a partire dal 1 gennaio 2020 dei soli codici prodotto: 597, 598, 477, 214. 
-- Calcola per ciascuna transazione il profitto (SalesAmount - TotalProductCost).

SELECT
	SalesOrderNumber
    , SalesOrderLineNumber
    , OrderDate
    , ProductKey
    , ResellerKey
    , OrderQuantity
    , UnitPrice
	, SalesAmount - TotalProductCost AS Markup

FROM 
	FactResellerSales
    
WHERE 
	ProductKey IN (597, 598, 477, 214)

AND
	OrderDate >= "2020-01-01"
;

select b.listprice
, b.StandardCost
, SalesAmount - TotalProductCost as Markup
, case     when TotalProductCost is null then a.SalesAmount - a.OrderQuantity *b.StandardCost
        else SalesAmount - TotalProductCost end as Markup_corretto
, a.*
from factresellersales as a
inner join dimproduct as b on a.ProductKey=b.ProductKey
where TotalProductCost is null;