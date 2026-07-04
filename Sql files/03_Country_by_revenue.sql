
-- Purpose: Analyze revenue by geographic location

SELECT country,
    COUNT(DISTINCT "customerid") as "num customers",
    COUNT(DISTINCT "invoiceno") as "num invoices",
    SUM(quantity * unitprice) AS revenue,
    ROUND(AVG(quantity * unitprice),2) AS "Avg order value",
    ROUND(AVG(quantity),2) AS "Avg quantity",
    COUNT(*) as "total line items"
    
    FROM online_retail_table

    WHERE 
        invoiceno NOT LIKE 'C%'
    AND unitprice > 0
    AND quantity > 0

GROUP BY country
ORDER BY revenue desc;