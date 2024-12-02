# Evaluating Adidas Sales Performance: 2020-2021 Trends and Insights

## Table of Contents
- [Project Background](#project-background)
- [Objectives](#objectives)
- [Data Structure and Overview](#data-structure-and-overview)
- [Insights Deep Dive](#insights-deep-dive)
  - [Overall Performance and Patterns](#overall-performance-and-patterns)
  - [Product Performance](#product-performance)
  - [Retailer Performance](#retailer-performance)
  - [Regional and State Performance](#regional-and-state-performance)
  - [Sales Channel Performance](#sales-channel-performance)
- [Recommendations](#recommendations)
  - [Address Declines in the Last Quarter of the Year](#address-declines-in-the-last-quarter-of-the-year)
  - [Redefine Product Strategy for Women’s Athletic Footwear](#redefine-product-strategy-for-womens-athletic-footwear)
  - [Leverage Stable Product Performance](#leverage-stable-product-performance)
  - [Make Walmart Great Again](#make-walmart-great-again)
  - [Address Midwest Underperformance](#address-midwest-underperformance)
  - [Strengthen Online Channels](#strengthen-online-channels)
  - [Optimize Other Sales Channels](#optimize-other-sales-channels)

## Project Background
Adidas, a German athletic apparel and footwear corporation operating globally, aims to improve its sales performance in the United States. They intend to maximize their sales from the US because it represents an epicenter in the global athletic apparel and footwear market and a critical growth area for the company.

## Objectives
In this project, I partnered with the Adidas global sales team to analyze the company’s sales data for 2020 and 2021 to achieve the following objectives:
- **Identify the top contributors (products, regions, and sales methods) to sales revenue and operating profit:** This will allow Adidas to allocate resources to high-performing contributors to maximize profitability and strengthen its market share.
- **Identify permanent changes in consumption habits caused by the pandemic:** Understanding these changes will enable Adidas to adapt its sales strategies and product offerings to align with evolving customer needs and preferences.
- **Pinpoint the least contributors to sales and operating profits, suggesting reasons for their poor performance and recommending strategies for improvement:** By addressing underperforming dimensions, Adidas can optimize its product portfolio and inventory management to increase profitability.

## Project Deliverables  
This project provides three key deliverables:  
**Clean Sales Dataset**  
A refined dataset containing cleaned, structured, and validated sales data for 2020 and 2021. This will ensure accuracy and consistency of the data used for the analysis. The clean dataset can be found here.

**Relational Database**  
A structured database designed to store, query, and manage sales data effectively. This database supports complex queries and serves as the backend for the project. The query to build this database can be found here.

**Interactive Visualization Dashboard**  
A dynamic Power BI dashboard showcasing insights such as sales trends, product performance comparisons, and regional and retailer contributions. It features drill-down capabilities, KPI metrics, and an intuitive design for stakeholders to explore data and make informed decisions. Here's the dashboard:
<iframe title="Adidas Sales" width="1140" height="541.25" src="https://app.powerbi.com/reportEmbed?reportId=8aa5dbb5-0902-497c-bcaf-b4d7906ac412&autoAuth=true&ctid=5fe78ac1-1afe-4009-aa04-a71efb4a5042" frameborder="0" allowFullScreen="true"></iframe>

These deliverables collectively enable robust analysis and visualization of Adidas' sales performance, supporting strategic planning and decision-making.

## Data Structure and Overview

The original data was in an Excel file comprising 9,642 rows and 12 columns. After cleaning and normalizing the data using Excel, I created a database for easy data storage and retrieval during the project.
The entity relationship diagram (ERD) of the database is as follows:

![ERD Diagram](https://github.com/W-seidu/Adidas-Sales-Performance-2020-2021/blob/main/Adidas_ERD.png)

## Database Schema Overview
This database schema represents a sales data model for Adidas, consisting of five interconnected tables. Each table plays a role in organizing and linking different aspects of the data for analysis:

### Sales Table
This is the central table of the database, containing transaction-level details about sales. Key columns:
- **sale_id**: A unique identifier for each sale (primary key).
- **retailer_id**: Foreign key linking the sale to the specific retailer in the Retailers table.
- **location_id**: Foreign key linking the sale to the location where it occurred, stored in the Location table.
- **product_id**: Foreign key linking the sale to the product sold, stored in the Product table.
- **invoice_date**: Date when the sale transaction occurred.
- **price_per_unit**: The price of one unit of the product sold.
- **units_sold**: The number of product units sold in the transaction.
- **total_sales**: The total revenue generated from the sale (calculated as `price_per_unit × units_sold`).
- **operating_profit**: The profit generated after subtracting costs associated with the sale.
- **operating_margin**: Profit margin for the sale, represented as a percentage or decimal.
- **sales_method**: The method of sale, such as Online, In-store, or Outlet.

This table captures granular sales information, enabling analysis of revenue, profitability, and sales trends.

### Retailers Table
This table contains details about the retailers involved in selling Adidas products. Key columns:
- **retailer_id**: Unique identifier for each retailer (primary key).
- **retailer_name**: The name of the retailer (e.g., Walmart, Foot Locker).

The `retailer_id` column links this table to the Sales table, allowing the analysis of sales performance by retailer.

### Location Table
This table stores information about the geographical locations where sales occurred. Key columns:
- **location_id**: Unique identifier for each location (primary key).
- **state**: The U.S. state where the location is situated (e.g., Florida, Alabama).
- **city**: The city where the location is situated (e.g., Orlando, Birmingham).
- **region_id**: Foreign key linking to the Region table, specifying the broader region (e.g., Southeast, Midwest).

The `location_id` column connects to the Sales table, facilitating geographic analysis of sales.

### Region Table
This table categorizes locations by region. Key columns:
- **region_id**: Unique identifier for each region (primary key).
- **region**: Name of the region (e.g., Southeast, Northeast).

The `region_id` column links to the Location table (which in turn links to the Sales table), allowing regional analysis of sales performance.

### Product Table
This table holds information about the products sold by Adidas. Key columns:
- **product_id**: Unique identifier for each product (primary key).
- **product**: Name or description of the product (e.g., Women's Apparel, Men's Street Footwear).
- **product_category**: The category the product belongs to (e.g., Footwear, Apparel).

The `product_id` column connects to the Sales table, supporting product-level analysis of revenue and profit.

## Inights Deep Dive
### a. Overall Performance and Patterns
- As expected, sales skyrocketed after the pandemic, landing at $96 million (460,000 units) in December 2021. This 300% jump from the previous sales of $24 million in 2020 signals an excellent post-pandemic recovery.
- Operating profits followed a similar pattern, with a 322% increase, taking them from $9 million in 2020 to $38 million in 2021.
- Sales fell consistently in the second quarter of 2020. This fall is not unusual, as these were the hardest-hitting months of the pandemic, characterized by lockdowns, restricted movement, and temporary closures of physical stores. Consumer spending patterns shifted significantly during this time, with many prioritizing essential goods over discretionary purchases like footwear and apparel.
<div align="center">
    <img src="https://github.com/W-seidu/Adidas-Sales-Performance-2020-2021/blob/main/Q2_decline.png" alt="Q2 decline" width="600" height="300">
</div>

### b. Product Performance
- Men’s street footwear was the highest-performing product in both 2020 and 2021. This product made $23 million in sales (494,000 units), representing a 24% contribution to 2021 total sales. It also earned a profit of $9 million, contributing 24% to total operating profit in the same year.
- Women’s athletic footwear was the least-performing product in both 2020 and 2021. This product made $11 million in sales (64,000 units), contributing 11% to total sales revenue in 2021. It also earned a profit of $4 million, again, contributing 11% to total operating profits.
- Using the two previous insights, one may be tempted to think that male products perform well and female products perform poorly. This is not the case. If we divided all products primarily into male and female products, in 2021, male products made $65 million, contributing 54% to total sales, while female products contributed made $55 million, contributing 46% to sales in the same year. 
<div align="center">
  <img src="https://github.com/W-seidu/Adidas-Sales-Performance-2020-2021/blob/main/Male_vs_Female_Sales.png" alt="Male vs. female products" width="600" height="400">
</div>

- Using the same sub-division mentioned earlier, Women’s apparel had the highest sales revenue and operating profit among all female products, and was second highest in these metrics among all products, in both 2020 and 2021.
- In 2021, Women’s apparel made a total sales of $19 million, contributing 20% to total sales. It also had an operating profit of $8 million, contributing 21% to total operating profits.
- The fact that men’s street footwear, women’s apparel, and women’s athletic footwear maintained the same position in 2020 and 2021 signals stability in consumer purchase behavior. The products ranking in 2020 and 2021 looks like this: 

<div align="center">
  <img src="https://github.com/W-seidu/Adidas-Sales-Performance-2020-2021/blob/main/2020_Products_Ranking.png" alt="2020 Ranking" width="550" height="250">
  <p><small>2020 Products Ranking by sales</small></p>
</div>

<div align="center">
  <img src="https://github.com/W-seidu/Adidas-Sales-Performance-2020-2021/blob/main/2021_Products_Ranking.png" alt="2021 Ranking" width="550" height="250">
  <p><small>2021 Products Ranking by sales</small></p>
</div>

  As seen in the table above, all products maintain the same position in both years. Although this stability demonstrates product loyalty and resilience to external factors (COVID-19 in 2020), it also shows that much attention has not been given to lower-ranking products.

### c. Retailer Performance
- Foot Locker, the second-highest-selling retailer in 2020, was the highest-selling retailer in 2021. They made $23 million in sales, contributing 24% to total sales revenue. Sports Direct had the highest operating profit in the same year, raking in a whopping $10 million profit, contributing 26% to the overall profit for the year.
- Foot Locker’s consistency in delivering excellent sales performance is no surprise. After all, the US is its biggest market and where it has its strongest store presence.
- On the other hand, Walmart performed very poorly in 2021. It had the lowest sales and operating profit for the year, making $6 million in sales and $2 million in operating profits. These low figures contributed 6% to total sales and 5% to operating profits.
- The fact that Walmart contributed 21% to total sales and 22% to operating profit in 2020 despite the pandemic signals a possible issue. More on this will be in the recommendations section.
![Retailers table](https://github.com/W-seidu/Adidas-Sales-Performance-2020-2021/blob/main/Retailers_table.png)
You can interact with this table to get more information in the [dashboard](https://app.powerbi.com/links/z4HM5RVSqM?ctid=5fe78ac1-1afe-4009-aa04-a71efb4a5042&pbi_source=linkShare&bookmarkGuid=21cf58a2-c2df-411d-8320-6b326e881ab2).

### d. Regional (and States) Performance
- The western region accounts for the largest portion of total sales and profits out of the five regions, contributing 27% to total sales revenue and 26% to operating profit in 2021. This is similar to its performance in 2020, where it had the highest sales volume, revenue, and operating profit.
- The Midwest region contributed the least to sales, contributing 17% to total sales revenue and 18% to operating profit in 2021. This region also had the lowest performance in terms of total sales and operating profit in 2020.
- This poor performance is not due to a lack of retail presence in the region. The Midwest has more retail presence than the South and Southeast regions. It is also not due to low population, as the Midwest has a much higher population than the Northeast, which had the second-highest sales in 2021. The Midwest requires more attention for these reasons.

<div align="center">
  <img src="https://github.com/W-seidu/Adidas-Sales-Performance-2020-2021/blob/main/2020_regional_performance.png" alt="2020 Ranking" width="550" height="250">
  <p><small>2020 Regional Ranking by Sales and Operating Profits</small></p>
</div>

<div align="center">
  <img src="https://github.com/W-seidu/Adidas-Sales-Performance-2020-2021/blob/main/2021_Regional_Performance.png" alt="2021 Ranking" width="550" height="250">
  <p><small>2021 Regional Ranking by Sales and Operating Profits</small></p>
</div>

### e. Sales Channel Performance
- In 2021, most sales came from online channels, with online sales making $40 million, constituting 42% of total sales. Additionally, online sales earned $17 million profit, contributing 45% to total operating profit.
- Conversely, the stores' channel had the lowest sales in 2021, making $26 million. This method saw a sharp decline in contribution to total sales post-pandemic. It went from a 38% contribution to sales in 2020 to contributing 28% in 2021. This decline shows shifting consumer habits to online purchasing.
- Outlet sales have shown resilience by being in at least second place when ranking sales channels according to total sales. In 2020, Outlet sales were the highest contributor to sales, making $10 million and contributing 42% to total sales. In 2021, it was the second-highest contributor, making $11 million and contributing 29% to total sales. This resilience shows that customers will always seek affordability and discount purchasing offered by outlets, even as their habits shift toward online shopping.

## Recommendations
Drawing from the insights in the previous section, we came up with the following recommendations:

### a. Redefine Product Strategy for Women’s Athletic Footwear
The recurring poor performance of Women’s athletic footwear signals a possible lack of attention to the marketing of the product. The product is niched in two respects. First, it is a female product, and second, it is an athletic product. We therefore recommend marketing it as a niche product by following these strategies:
- Launch surveys or focus groups using female athletes as respondents to understand consumer dissatisfaction or lack of interest in the product.
- Using the research result, reassess the product design and marketing of Women’s Athletic Footwear to align better with female preferences (e.g., comfort, style, or anything the research pinpoints).
- Introduce influencer-led campaigns targeting female athletes or fitness enthusiasts to boost product visibility.

### b. Leverage Stable Product Performance
Men’s street footwear and women’s apparel have consistently delivered excellent sales and operating profit performance. Most times, keeping the flag flying is better than reinventing the wheel. Therefore, we recommend leveraging these products by adopting these strategies:
- Invest in non-disruptive innovation to maintain consumer interest in these products (e.g., incorporating eco-friendly materials in design and packaging). “Non-disruptive” in this context means innovations that enhance or augment the value of existing offerings rather than replacing them.
- Develop activewear lines tailored for different fitness trends (e.g., yoga, running, gym workouts) to appeal to diverse consumer needs. This development will be particularly effective for women’s apparel.

### c. Make Walmart Great Again
Walmart was the lowest-grossing Adidas retailer in 2021. Therefore, we need to make them great again. Don’t mind us. Of course, we know that Walmart is already great. They made over $500 billion in sales in 2021, making them the highest-grossing retailer in the US that year. The question is, why did they fail to sustain that performance in selling Adidas products? And how do we fix that? We suggest a partnership with Walmart to:
- Evaluate their product placement strategies for Adidas products.
- Launch joint campaigns focusing on seasonal promotions (e.g., back-to-school, Black Friday, holiday deals) and featuring Adidas products prominently in circulars and online ads.
- Leverage and optimize its online platform to capture its large e-commerce audience to compensate for weaker in-store performance.

**Note:** For this partnership to work, we should emphasize a mutually beneficial relationship that provides value to both parties.

### d. Address Midwest Underperformance
The Midwest region has been the lowest contributor to sales despite having a good retail presence and a relatively young population. The following strategies can help in improving sales performance in the Midwest:
- Launch targeted marketing campaigns tailored to Midwestern consumers, highlighting affordability and value.
- Leverage loyalty programs or regional discounts to incentivize purchases in the region.

### e. Strengthen Online Channels
With online sales leading the way, continue investing in:
- User-friendly website and app enhancements. Investing in enhancing user experience on online channels is the key here.
- Targeted digital marketing campaigns through social media and search engines.
- Personalization tools for recommending products based on browsing history or preferences.

### f. Optimize Other Sales Channels
- To address the decline in in-store sales, transform stores into "experience hubs" where customers can try on products, customize designs, and experience the brand.
- Use data analytics to identify low-performing stores for potential closure and redirect investments into high-potential outlets.
- Scale outlet presence and introduce additional discount events to maintain consumer interest in outlets.
