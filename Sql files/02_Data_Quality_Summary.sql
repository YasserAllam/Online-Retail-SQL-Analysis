
-- Purpose: Identify data quality issues
-- Overall data quality assessment


-- DATA QUALITY SUMMARY
SELECT 'Total Records' as metric,
    COUNT(*) as value
FROM online_retail_table

UNION ALL

SELECT 'Null Customer IDs',
    COUNT(
        CASE
            WHEN "customerid" IS NULL THEN 1
        END
    )
FROM online_retail_table

UNION ALL

SELECT 'Zero Unit Prices',
    COUNT(
        CASE
            WHEN "unitprice" = 0 THEN 1
        END
    )
FROM online_retail_table

UNION ALL

SELECT 'Negative Quantities',
    COUNT(
        CASE
            WHEN "quantity" < 0 THEN 1
        END
    )
FROM online_retail_table

UNION ALL

SELECT 'Cancelled Invoices (c prefix)',
    COUNT(
        CASE
            WHEN "invoiceno" LIKE 'C%' THEN 1
        END
    )
FROM online_retail_table

UNION ALL

SELECT 'Clean Records (after filtering with null customer ids)',
    COUNT(*)
FROM online_retail_table
WHERE "invoiceno" NOT LIKE 'c%'
    AND "unitprice" > 0
    AND "quantity" > 0
    
UNION ALL

SELECT 'Clean Records (after filtering)',
    COUNT(*)
FROM online_retail_table
WHERE "invoiceno" NOT LIKE 'c%'
    AND "customerid" IS NOT NULL
    AND "unitprice" > 0
    AND "quantity" > 0
ORDER BY value desc;