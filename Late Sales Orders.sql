-- query ran to display orders that were running behind / not meeting the target date. Used as KPI / dashboard in both power bi and SAP B1 for sales reps and letting managers know who is behind

SELECT CONCAT(T2."firstName",CONCAT(' ',T2."lastName")) as "Cust Serv", T0."DocNum", T0."CardCode", T1."ItemCode", T1."Dscription", T1."Quantity", T1."OpenQty", T3."OnHand", T1."TargetDate", add_days(current_date,0) -- target has been redacted from original for company saftey

FROM (InsertServer)."ORDR" T0 INNER JOIN (InsertServer)."RDR1" T1 ON T0."DocEntry" = T1."DocEntry" INNER JOIN (InsertServer)."OHEM" T2 ON T0."OwnerCode" = T2."empID" INNER JOIN (InsertServer)."OITM" T3 ON T1."ItemCode" = T3."ItemCode"

WHERE T1."_TargetDate" < add_days(current_date,0) and T1."OpenQty" > 0 -- Target date has been edited for company saftey
