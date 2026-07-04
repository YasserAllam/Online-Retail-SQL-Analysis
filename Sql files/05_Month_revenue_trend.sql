
-- Purpose: Analyze seasonal revenue patterns

SELECT   DATE_TRUNC('month', invoicedate)::DATE as month,
     ROUND(SUM(quantity * unitprice), 2) as monthly_revenue,
     SUM(quantity) as total_units,
    ROUND(AVG(quantity * unitprice), 2) as avg_order_value,
    COUNT(DISTINCT invoiceno) as num_invoices,
    COUNT(DISTINCT customerid) as num_customers
    
    FROM online_retail_table
    GROUP BY DATE_TRUNC('month', "invoicedate")
    ORDER BY monthly_revenue desc;



With Average_monthly_rev AS (
     SELECT  
          DATE_TRUNC('Month', invoicedate )::DATE as monthly,
          SUM(quantity * unitprice) AS monthly_revenue

          FROM online_retail_table
          GROUP BY DATE_TRUNC('Month', invoicedate )::DATE
)
SELECT ROUND(AVG(monthly_revenue))
FROM Average_monthly_rev;