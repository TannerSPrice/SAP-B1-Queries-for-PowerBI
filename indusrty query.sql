-- industry query that would list the type, name, description of the customer indusrty

SELECT T0."IndCode", T0."IndName", T0."IndDesc", T0."_IndustryMarkup" -- changed markup so previous company is not shown

FROM TEXAS_PB1."OOND" T0
