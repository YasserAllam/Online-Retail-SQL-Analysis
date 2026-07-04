SELECT *
FROM online_retail_table


SELECT COUNT(*),
    COUNT(DISTINCT invoiceno) AS Total_Invoice,
    COUNT(DISTINCT stockcode) AS Total_Items,
    COUNT(DISTINCT customerid) AS Total_Customers,
    COUNT(DISTINCT country) AS Total_Countries,
    MIN(invoicedate) AS Date_Start,
    MAX(invoicedate) AS Date_End
FROM online_retail_table;

--------------------- Country by revenue ---------------------

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


------------------------ Top products by revenue ---------------------

SELECT
    stockcode,
    description,
    COUNT(*) AS Times_item_purchased,
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


---------------------- Month revenue trend ------------------

SELECT   DATE_TRUNC('month', "invoicedate")::DATE as month,
    COUNT(DISTINCT invoiceno) as num_invoices,
    COUNT(DISTINCT customerid) as num_customers,
    SUM(quantity) as total_units,
    ROUND(SUM(quantity * unitprice), 2) as monthly_revenue,
    ROUND(AVG(quantity * unitprice), 2) as avg_order_value

    FROM online_retail_table
    GROUP BY DATE_TRUNC('month', "invoicedate")
    ORDER BY monthly_revenue desc;
        

------------------------- Customer segment ------------------------

SELECT 
    customerid,
    country,
    SUM(unitprice * quantity) as monetary_value,
    CASE 
        WHEN SUM(unitprice * quantity) > 20000 THEN 'High value customer'
        WHEN SUM(unitprice * quantity) > 10000 THEN 'medium value customer'
        ELSE 'Low value customer' 
        END AS customer_segment,
    MAX(invoicedate) AS last_purchase_date,
    COUNT(DISTINCT invoiceno) AS frequency
FROM online_retail_table
WHERE 
    invoiceno NOT LIKE 'C%' 
    AND customerid IS NOT NULL
    AND unitprice > 0
    AND quantity > 0
GROUP BY customerid, country

ORDER BY monetary_value desc;


SELECT 
    stockcode,
    description,
    COUNT(invoiceno) AS Return_Count,
    SUM(ABS("quantity")) as units_returned,
    ROUND(AVG("unitprice"), 2) as avg_price,
    ROUND(SUM(ABS("quantity") * "unitprice"), 2) as total_return_value
FROM online_retail_table
WHERE "invoiceno" LIKE 'c%'  
    OR "quantity" < 0         
GROUP BY "stockcode", "description"
HAVING COUNT(*) > 5         -- Only products with multiple returns
ORDER BY return_count DESC;


SELECT 
COUNT(invoiceno)
FROM online_retail_table
WHERE
    unitprice = 0;