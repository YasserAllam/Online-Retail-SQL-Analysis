SELECT *
FROM online_retail_table;


----------------------- Exploring data------------
SELECT COUNT(*),
    COUNT(DISTINCT invoiceno) AS Total_Invoice,
    COUNT(DISTINCT stockcode) AS Total_Items,
    COUNT(DISTINCT customerid) AS Total_Customers,
    COUNT(DISTINCT country) AS Total_Countries,
    MIN(invoicedate) AS Date_Start,
    MAX(invoicedate) AS Date_End
FROM online_retail_table;


-- Check for data quality issues
SELECT SUM(
        CASE
            WHEN customerid IS NULL Then 1
            ELSE 0
        END
    ) AS No_Customer_ID_Number,
    SUM(
        CASE
            WHEN unitprice = 0 Then 1
            ELSE 0
        END
    ),
    SUM(
        CASE
            WHEN invoiceno LIKE 'C%' THEN 1
            ELSE 0
        END
    ) as cancellations,
    SUM(
        CASE
            WHEN "quantity" < 0 THEN 1
        END
    ) as negative_quantities
FROM online_retail_table;



------------ Exploring Null Customer IDs 
SELECT COUNT(*) AS Customer_ID_NULL,
    SUM(unitprice * quantity) AS CID_null_revenue,
    COUNT(DISTINCT invoiceno) AS invoices_with_nulls
FROM online_retail_table
WHERE customerid IS NULL;

-- What % of revenue the Nulls gets
SELECT SUM(
        CASE
            WHEN customerid IS NULL THEN (unitprice * quantity)
            ELSE 0
        END
    ) AS Revenue_Of_Nulls,
    SUM(unitprice * quantity) AS Total_revenue,
    ROUND(
        SUM(
            CASE
                WHEN customerid IS NULL THEN (unitprice * quantity)
                ELSE 0
            END
        ) / SUM(unitprice * quantity),
        2
    ) AS percentage_
FROM online_retail_table
WHERE "invoiceno" NOT LIKE 'C%';

----------------------------------------
------------- Exploring Zero unit prices

SELECT COUNT(*) as zero_price_count,
    COUNT(DISTINCT "stockcode") as products_with_zero_price,
    COUNT(DISTINCT "description") as descriptions,
    SUM("quantity") as total_quantity
FROM online_retail_table
WHERE "unitprice" = 0;

-- See examples
SELECT description,
    invoiceno,
    quantity
FROM online_retail_table
WHERE "unitprice" = 0;


------------------- Checking a transaction that has a two invoices one canceled and the other not -----------------

SELECT
    stockcode,
    description,
    unitprice,
    quantity,
    customerid,
    invoiceno,
    CASE WHEN invoiceno LIKE 'C%' THEN  RIGHT(invoiceno, Length(invoiceno) - 1) ELSE invoiceno END
   
FROM online_retail_table
WHERE stockcode = '23843';
