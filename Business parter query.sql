-- this is a different type of business partner query that I used to determin which query I wanted to use for KPIs and dashboards for power bi

SELECT T0."Balance", T0."CardCode", T0."CardName", T0."IndustryC", T0."MailAddres", T0."MailCity", T0."MailCounty", T0."MailZipCod", T1."IndDesc", T1."IndName", T0."OrdersBal", T0."Priority", T0."U_SWK_BPType"

FROM (InserDatabaseConnection)."OCRD" T0  INNER JOIN (InserDatabaseConnection)."OOND" T1 ON T0."IndustryC" = T1."IndCode"
