# Budget vs Actuals – Financial Analysis

Power BI | MySQL | Excel

I built this project to put my financial controlling and data analysis skills into practice. I wanted to understand why actual results differed from the budget, which cost centres were most affected and how those differences evolved over time.

The data is simulated and covers four cities in Galicia (A Coruña, Lugo, Santiago and Vigo) during 2024 and 2025.

## What I found

Operating profit was €92,379 below budget in 2025 (-19.76%). Higher purchasing costs and lower-than-expected sales explain most of the difference.

- Vigo accounted for 90.74% of the net purchasing overspend, with costs €52,841 above budget.
- Lugo's operating profit was €42,226 below budget. Sales fell by 8.44% year on year between September and December. I used SQL to identify the customers behind the largest declines.
- In A Coruña, purchases exceeded budget by €7,962. The monthly breakdown helps identify when the deviation occurred.

## Power BI

[Download the Power BI report](Budget_Actuals.pbix)

I created a data model with shared calendar, account and cost centre tables for actual and budget figures. Using DAX, I calculated sales, costs, gross profit, operating profit, margins and budget variances.

The report includes a profit overview by city, a waterfall chart to explain profit variances by account, a drillthrough page to compare monthly actuals against budget, and reference tables for sales and purchases. I also used slicers, tooltips and conditional formatting.

## SQL and Excel

I used MySQL to investigate the purchasing overspend in Vigo, compare sales by customer in Lugo and check financial results across cost centres. The queries use joins, aggregate functions and CTEs.

In [Excel](Excel%20proyect.xlsx), I used Power Query, the Data Model and PivotTables to analyse budget deviations, gross profit and operating profit.

## How to open the project

- Open the PBIX file in Power BI Desktop to explore the report.
- The [Data folder](Data/) contains the source CSV files. Update the source paths in Power BI or the `RutaDatos` parameter in Excel if you want to refresh the data.
- Import `actuals.csv`, `budget.csv` and `cost_centres.csv` into MySQL to run the SQL scripts.

---

Abel Maroño Pazos — Economics | Financial Controlling | Microsoft Certified: Power BI Data Analyst Associate (PL-300)
