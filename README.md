# Online Retail SQL Analysis 🛍️

## Project Overview

Analyzed **500,000+** e-commerce transactions spanning **2010-2011** to identify revenue drivers, 
top-performing products, customer segmentation patterns, and seasonal trends. 
This project demonstrates end-to-end SQL analysis: data exploration → cleaning → transformation → insights.

**Dataset:** Online Retail Data (UCI Machine Learning Repository)  
**Tools:** PostgreSQL, VS Code, SQL  
**Analysis Date:** 2024

---

## 🎯 Key Business Questions & Findings

### 1. **Which Countries Drive Revenue?**
Top 5 Countries by Revenue:

- United Kingdom: $9.0M (85% of total)
- Netherlands: $285K (2.7%)
- EIRE (Ireland): $283K (2.7%)
- Germany: $228K (2.1%)
- France: $209K (2.0%)


**Business Insight:** UK market heavily dominates, but represents concentration risk.
International expansion in Europe could diversify revenue.

📊 *See: [top_countries_revenue.csv](project%20CSV%20files/Country%20by%20revenue.csv)

---

### 2. **What Are the Top-Performing Products?**
Top 5 Products by Revenue:

- DOTCOM POSTAGE: $206,248
- REGENCY CAKESTAND 3 TIER: $174,484
- WHITE HANGING HEART T-LIGHT HOLDER: $104,340
- PARTY BUNTING: $99,504
- JUMBO BAG RED RETROSPOT: $94,340


**Business Insight:** Bundle CAKESTAND with premium postage + lights. Discontinue low-margin commodities.
Upsell services. Expected impact: +$500K revenue, -50% operational complexity.

📊 *See: [top_products_revenue.csv](project%20CSV%20files/Top%20products%20by%20revenue.csv)

---

### 3. **What's the Monthly Revenue Trend?**
- Peak Revenue Month: November 2011 ($1.46M)
- Lowest Revenue Month: February 2010 ($433K)
- Average Monthly Revenue: $749K
- Seasonal Pattern: Strong Q4 (holiday season), weak Q1

**Business Insight:** Clear seasonality detected. 
Q4 (Oct-Dec) represents 35% of annual revenue. 
Plan inventory and marketing accordingly.

📊 *See: [monthly_revenue_trend.csv](project%20CSV%20files/Monthly%20revenue%20trend.csv)

---

### 4. **Customer Segmentation (RFM Analysis)**
High-Value Customers ($1,661+ lifetime):

Count: 1,087 customers (25%)
Revenue: $7.05M (79% of total)
Avg Order Value: $6,487

Medium-Value ($307-$1,661):

Count: 2,172 customers (50%)
Revenue: $1.66M (18.7% of total)
Avg Order Value: $766

Low-Value (<$307):

Count: 1,087 customers (25%)
Revenue: $195K (2.2% of total)
Avg Order Value: $179


**Business Insight:** Top 25% of customers generate 79% of revenue. 
Focus retention efforts on high-value segment.

📊 *See: [customer_segments.csv](project%20CSV%20files/Customer%20segment.csv)

---

## 📊 Data Quality & Cleaning

### Issues Found & Resolutions

| Issue | Count | Resolution | Rationale |
|-------|-------|-----------|-----------|
| Null Customer IDs | 135,080 | Excluded from customer analysis | Likely bulk orders |
| Zero Unit Prices | 2,519 | Excluded from revenue | Promotions/samples |
| Negative Quantities | 10,624 | Excluded from metrics | Returns/refunds |
| Cancelled Orders | 9,288 | Excluded | Data quality |

### Dataset Summary
Original Records:        541,909
Records Removed:         143,525 (26.5%)
Clean Records Used:      397,884
Date Range:              Dec 2010 - Dec 2011
Countries:               38
Unique Products:         4,070
Unique Customers:        4,372

---

## 🔧 SQL Skills Demonstrated

- ✅ **Data Exploration:** COUNT, DISTINCT, date ranges, data profiling
- ✅ **Data Cleaning:** NULL checks, negative value detection, pattern matching (LIKE)
- ✅ **Aggregation:** SUM, AVG, COUNT with GROUP BY
- ✅ **Date Functions:** DATE_TRUNC, EXTRACT for time-series analysis
- ✅ **Segmentation:** CASE statements for customer classification
- ✅ **Calculations:** Revenue = Quantity × UnitPrice, percentage calculations
- ✅ **Filtering:** WHERE clauses, AND/OR logic
- ✅ **Ordering & Limiting:** ORDER BY, LIMIT for top-N analysis

---

## 📁 Files & Documentation

### SQL Queries
- [01_data_exploration.sql](Sql%20files/01_Data_exploration.sql) - Initial dataset investigation
- [02_data_quality.sql](Sql%20files/02_Data_Quality_Summary.sql) - Data quality assessment & cleaning decisions
- [03_revenue_by_country.sql](Sql%20files/03_Country_by_revenue.sql) - Geographic revenue analysis
- [04_revenue_by_product.sql](Sql%20files/04_Top_products_by_revenue.sql) - Product performance ranking
- [05_monthly_revenue_trend.sql](Sql%20files/05_Month_revenue_trend.sql) - Time-series revenue analysis
- [06_customer_segmentation.sql](Sql%20files/06_Customer_segment.sql) - RFM customer classification

### Results (CSV Exports)
All SQL query results exported as CSV files for reproducibility:
- [data_quality_summary.csv](project%20CSV%20files/Data%20Quality%20Summary.csv)
- [top_countries_revenue.csv](project%20CSV%20files/Country%20by%20revenue.csv)
- [top_products_revenue.csv](project%20CSV%20files/Top%20products%20by%20revenue.csv)
- [monthly_revenue_trend.csv](project%20CSV%20files/Monthly%20revenue%20trend.csv)
- [customer_segments.csv](project%20CSV%20files/Customer%20segment.csv)

---

## 🚀 How to Use This Project

### 1. **Review the SQL Queries**
Start with the SQL files to understand the analysis methodology. Each query is commented and structured for clarity.

### 2. **Check the Results**
CSV files in [/Results/](project%20CSV%20files) show actual query outputs for quick reference.

### 3. **Read the Analysis Summary**
See [ANALYSIS_SUMMARY.md](Analysis_Summary.txt) for deeper business insights and recommendations.

---

## 💡 Business Recommendations

Based on this analysis:

1. **Geographic Expansion**
   - UK dominance (85% revenue) creates risk
   - Target Germany, France, Netherlands with localized campaigns
   - Potential: +15% revenue from EU market penetration

2. **Product Strategy**
- Top 20 products generate 50% of revenue. Focus marketing on CAKESTAND (hero product) with $174K revenue and proven 2,017 repeat purchases.
- Bundle CAKESTAND with premium postage services ($292 avg order) and lights to increase average order value from $26 to $35+.
- Discontinue bottom 50% of 4,000+ SKUs (generating only 5% of revenue) to reduce operational complexity while maintaining profitability.

3. **Seasonal Planning**
- Q4 dominance: November generates $1.46M (14% of annual revenue), October $1.07M—peak months are 2x higher than average.
- Q1 weakness: January-April average only $500K/month. Plan promotions/sales in these months to smooth revenue and reduce seasonal swings.
- Peak season repeat purchases: November has 3,462 invoices from 1,711 customers (2x invoices per customer). Implement loyalty/subscription program to replicate this behavior year-round.

4. **Customer Retention**
- High-value concentration drives profitability: 1,087 customers (25% of customer base) generate $7.05M (79% of revenue) with average lifetime value of $6,487. These customers purchase 10.4 times on average. Losing a single high-value customer costs $6,500+ in annual revenue—implement VIP retention programs immediately.
- Frequency paradox reveals different buyer types: High-value customers average 10.4 purchases vs. low-value customers at only 1.3 purchases. Yet both segments have customers with extreme variations (some high-value customers have only 1-2 purchases while others have 200+). Create tiered loyalty programs: reward high-frequency buyers with points, offer one-time high-spenders personalized premium service.
- Low-value customer conversion is critical leverage: 1,087 low-value customers (25% of base) spend only $179 lifetime. Converting just 10% to medium-value tier ($766 average) would add $587K annual revenue. Implement re-engagement campaigns targeting inactive low-value customers with exclusive bundles and personalized recommendations.

5. **Data Improvements**
   - Track return reasons (9K+ returns detected)
   - Validate pricing data (2.5K zero-price items)

---

## 📈 Project Metrics

| Metric | Value |
|--------|-------|
| Total Transactions Analyzed | 541,409 |
| Clean Transactions | 397,884 |
| Countries Covered | 38 |
| Products Analyzed | 4,062 |
| Customers Segmented | 9,540 |
| Revenue Analyzed | $10.4M |
| Date Range | 12 months |

---

## 🛠️ Tools & Technologies

- **Database:** PostgreSQL 17
- **Query Editor:** VS Code with PostgreSQL extension
- **Query Language:** SQL
- **Data Format:** CSV export

---

## 📚 Learning Outcomes

Through this project, I practiced:
- Writing complex SQL queries for business analysis
- Data quality assessment and cleaning decisions
- Time-series and segmentation analysis
- Translating SQL results into business insights
- Documentation and reproducibility

---

## 🔍 Further Analysis Ideas

Future enhancements could include:
- Return rate analysis by product
- Customer churn prediction
- Price elasticity analysis
- Cohort analysis by signup date
- Product affinity analysis (what products buy together)

---

## 📝 Notes

- All analyses exclude cancelled orders (invoices starting with 'c')
- Null customer IDs excluded from customer-level analysis but included in revenue totals
- Returns (negative quantities) handled separately to avoid skewing metrics
- All monetary values in GBP (£)

---

## ✨ Author

**Yasser Allam**  
Data Analyst | SQL | Power BI | Excel  
📧 yassseer225@gmail.com  
🔗 [Portfolio](https://yasser-allam.netlify.app)  
🔗 [LinkedIn](https://www.linkedin.com/in/yasser-allam-4b02ab331/)

---

## 📄 License

This project uses publicly available dataset for educational purposes.
