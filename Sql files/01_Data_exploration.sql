-- Purpose: Initial dataset investigation

-- Check basic dataset structure
SELECT COUNT(*),
    COUNT(DISTINCT invoiceno) AS Total_Invoice,
    COUNT(DISTINCT stockcode) AS Total_Items,
    COUNT(DISTINCT customerid) AS Total_Customers,
    COUNT(DISTINCT country) AS Total_Countries,
    MIN(invoicedate) AS Date_Start,
    MAX(invoicedate) AS Date_End
FROM online_retail_table;