-- query to run all business partners within the SAP Database

SELECT T0."CardCode",
T0."CardName", 
T0."frozenFor", 
T0."FrozenComm", 
T0."BPType", -- different name to protect company name / pulls the business partner type
T2."SlpName",
T3."IndName", 
T4."GroupName",
T0."_TradeCode" AS "SNCET Industry", -- different name to protect company name / pull the trade code from customer / BP
T0."MainCustomer", -- different name to protect company name / would select main customer
T0."CreateDate",
T0."CardType",
T5."PrioDesc",
T0.(picklist) AS "Customer Information" -- added different name to protect data in the company
 
FROM (InsertServer)."OCRD" T0
LEFT JOIN (InsertServer)."OSLP" T2 ON T0."SlpCode" = T2."SlpCode" 
LEFT JOIN (InsertServer)."OOND" T3 ON T0."IndustryC" = T3."IndCode" 
LEFT JOIN (InsertServer)."OCRG" T4 ON T0."GroupCode" = T4."GroupCode" 
LEFT JOIN (InsertServer)."OBPP" T5 ON T0."Priority" = T5."PrioCode" -- joining the tier type of customer


 
WHERE T0."CardType" <> 'S'  -- displays customer type in SAP
