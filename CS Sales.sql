-- SQL code for pulling data from SAP Server to use in PowerBI, I wrote this for Customer Service Sales. So I can write create a visual for their sales inputs. Such as invoices, item inputs, document creation and using their sales person code to show the numbers
SELECT T0."CardCode", T0."CardName", T1."ItemCode", T1."Quantity", T1."LineTotal", T0."DocNum", T0."DocDate", T3."SlpName", T1."Project" 

FROM (InsertServer/database)."OINV" T0 INNER JOIN (InsertServer/database)."INV1" T1 ON T0."DocEntry" = T1."DocEntry" INNER JOIN (InsertServer/database)."OITM" T2 ON T1."ItemCode" = T2."ItemCode" INNER JOIN (InsertServer/database)."OSLP" T3 ON T0."SlpCode" = T3."SlpCode"

WHERE T2."QryGroup59" = 'Y' and T2."QryGroup54" = 'N' OR T1."Project" = 'CS Item' 
