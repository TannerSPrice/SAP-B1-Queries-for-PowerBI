-- invoice query I wrote to extract data from invoices sent to customers. When used in power bi I was able to create visuals for the invoice documents, items and quantity sold, sales person name, date the invoice was created
-- along with carde code and card name which is the customer code and customer name.
-- This query represented an accurate number to represent invoice sales data that was already pre made, but I needed to write and actual code to get the correct number to show on power bi

SELECT
T0."CardCode",T0."CardName", T0."DocDate", T0."DocNum", T1."ItemCode", T3."lastName", T1."LineTotal", T1."LineStatus", T1."OpenQty", T1."Price", T1."Quantity", T2."SlpCode", T2."SlpName",
SUM(CASE WHEN T1."Quantity" = 0 THEN T1."PriceBefDi" * (100-T1."DiscPrcnt")/100 ELSE ROUND(T1."Quantity" * T1."PriceBefDi" * (100-T1."DiscPrcnt")/100 * (100-T0."DiscPrcnt")/100 ,2) END) AS "INVOCIES"

FROM (InsertDatabase)."OINV" T0 INNER JOIN (InsertDatabase)."INV1" T1 ON T0."DocEntry" = T1."DocEntry" INNER JOIN (InsertDatabase)."OSLP" T2 ON T0."SlpCode" = T2."SlpCode" INNER JOIN (InsertDatabase)."OHEM" T3 ON T0."OwnerCode" = T3."empID"

WHERE T0."CANCELED" = 'N' 

GROUP BY T0."CardCode",T0."CardName", T0."DocDate", T0."DocNum", T1."ItemCode", T3."lastName", T1."LineTotal", T1."LineStatus", T1."OpenQty", T1."Price", T1."Quantity", T2."SlpCode", T2."SlpName"
UNION

-- needed to do a forumula to get an accurate number based off a pre written calculation to reflect from the invoce sales data
SELECT
T0."CardCode",T0."CardName", T0."DocDate", T0."DocNum", T1."ItemCode", T3."lastName", T1."LineTotal", T1."LineStatus", T1."OpenQty", T1."Price", T1."Quantity", T2."SlpCode", T2."SlpName",
- SUM(CASE WHEN T1."Quantity" = 0 THEN T1."PriceBefDi" * (100-T1."DiscPrcnt")/100 ELSE ROUND(T1."Quantity" * T1."PriceBefDi" * (100-T1."DiscPrcnt")/100 * (100-T0."DiscPrcnt")/100 ,2) END) AS "INVOCIES"
    
FROM (InsertDatabase)."ORIN" T0 INNER JOIN (InsertDatabase)."RIN1" T1 ON T0."DocEntry" = T1."DocEntry" INNER JOIN TEXAS_PB1."OSLP" T2 ON T0."SlpCode" = T2."SlpCode" INNER JOIN (InsertDatabase)."OHEM" T3 ON T0."OwnerCode" = T3."empID"
    
WHERE T0."CANCELED" = 'N'

GROUP BY T0."CardCode",T0."CardName", T0."DocDate", T0."DocNum", T1."ItemCode", T3."lastName", T1."LineTotal", T1."LineStatus", T1."OpenQty", T1."Price", T1."Quantity", T2."SlpCode", T2."SlpName"
