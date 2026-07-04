
-- Purpose: Identify top-performing products

SELECT
    stockcode,
    description,
    COUNT(*) AS "Times item purchased",
    SUM(unitprice * quantity) AS revenue,
    SUM(quantity) AS "Total quantity sold",
    ROUND(AVG(quantity * unitprice),2) AS "Avg order value"
    FROM online_retail_table

    WHERE 
        invoiceno NOT LIKE 'C%'
    AND unitprice > 0
    AND quantity > 0
    

GROUP BY stockcode,description
HAVING COUNT(*) <> 1
ORDER BY revenue desc
LIMIT 15;