-- Query for sent orders to customers. Will display customer code, customer name, document number and date, document entry, items in the order and quantity, total for the sale, status of the order, slaes rep name and sales rep employee code.

SELECT T0."CardCode", T0."CardName", T0."DocDate", T0."DocNum", T0."DocEntry", T1."ItemCode", T3."lastName", T1."LineTotal", T1."LineStatus", T1."OpenQty", T1."Price", T1."Quantity", T2."SlpCode", T2."SlpName" 

FROM (InsertServer)."ORDR" T0 INNER JOIN (InsertServer)."RDR1" T1 ON T0."DocEntry" = T1."DocEntry" INNER JOIN (InsertServer)."OSLP" T2 ON T0."SlpCode" = T2."SlpCode" INNER JOIN (InsertServer)."OHEM" T3 ON T0."OwnerCode" = T3."empID"

WHERE T0."CANCELED" = 'N' -- show non canceled or complete orders. More for open orders

ORDER BY T0."DocDate" DESC -- I like to order by document date created / sent by descending order
