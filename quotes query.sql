-- query used to track show all quotes listed within the database similar to invoices and orders queries just for quotes made by inside sales and sales managers

SELECT T0."CardCode", T0."CardName", T0."DocDate", T0."DocNum", T0."DocEntry", T1."ItemCode", T3."lastName", T1."LineTotal", T1."LineStatus", T1."OpenQty", T1."Price", T1."Quantity", T2."SlpCode", T2."SlpName" 

FROM (InsertServer)."OQUT" T0  INNER JOIN (InsertServer)."QUT1" T1 ON T0."DocEntry" = T1."DocEntry" INNER JOIN (InsertServer)."OSLP" T2 ON T0."SlpCode" = T2."SlpCode" INNER JOIN (InsertServer)."OHEM" T3 ON T0."OwnerCode" = T3."empID"

WHERE T0."CANCELED" = 'N'

ORDER BY T0."DocDate" DESC
