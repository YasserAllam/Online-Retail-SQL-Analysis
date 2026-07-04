-- Purpose: RFM Analysis - Customer segmentation
-- R = Recency, F = Frequency, M = Monetary
SELECT customerid,
    country,
    SUM(unitprice * quantity) as monetary_value,
    MAX(invoicedate) AS last_purchase_date,
    COUNT(DISTINCT invoiceno) AS frequency,
    CASE
        WHEN SUM(unitprice * quantity) > 1661.26 THEN 'High value'
        WHEN SUM(unitprice * quantity) > 307.46 THEN 'medium value'
        ELSE 'Low value'
    END AS customer_segment,
    ROUND(
        (
            SUM(quantity * unitprice) / COUNT(DISTINCT invoiceno)
        )::NUMERIC,
        2
    ) as avg_transaction_value
FROM online_retail_table
WHERE invoiceno NOT LIKE 'C%'
    AND customerid IS NOT NULL
    AND unitprice > 0
    AND quantity > 0
GROUP BY customerid,
    country
ORDER BY monetary_value desc;