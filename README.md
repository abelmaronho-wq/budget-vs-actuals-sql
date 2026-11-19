# Financial Performance & Budget Variance Analysis

**Power BI · MySQL · Excel · Financial Controlling | 2024–2025**

An end-to-end financial analytics portfolio project designed to investigate
budget deviations, identify their drivers and support management decisions.
The case uses synthetic transaction and budget data for four cost centres in Galicia (Spain).

## Executive summary

Operating profit in 2025 was **€375,144**, against a budget of **€467,523**,
resulting in an unfavourable variance of **€92,379 (−19.76%)**.
Purchasing overspend and weaker-than-budgeted sales were the main drivers.

| KPI (2025) | Actual | Budget | Variance |
|---|---:|---:|---:|
| Sales | €3,864,356.51 | €3,897,607.68 | −€33,251.17 |
| Purchases | €2,201,915.18 | €2,143,684.23 | +€58,230.95 cost |
| Gross profit | €1,662,441.33 | €1,753,923.45 | −€91,482.12 |
| Operating profit | €375,144.19 | €467,523.45 | −€92,379.26 |

### Key findings

- **Vigo:** purchasing expenses exceeded the budget by €52,840.91 (+9.26%),
  accounting for 90.74% of the net purchasing overspend. Review purchasing
  prices, volumes and supplier terms to identify the underlying causes.
- **Lugo:** operating profit was €42,225.71 below budget in 2025.
  Sales in September–December fell from €420,389.37 in 2024 to €384,927.64
  in 2025 (−8.44%). Customers 39, 5 and 32 registered the largest declines.
  Review customer retention and sales trends for these accounts.
- **A Coruña:** purchasing overspend reduced profit by €7,962.12 in 2025.
  The Power BI drillthrough enables month-by-month comparison with budget.

## Power BI report

[Download the interactive Power BI report](Budget_Actuals.pbix).
Open the file with Power BI Desktop to use the slicers and drillthrough.

| Report page | Business purpose |
|---|---|
| Profit Deviation | Operating profit, budget, variance (€ and %), and performance by cost centre. |
| Profit Variance by Account | Waterfall chart showing how revenue and expense accounts contribute to the operating profit variance, with city and year filters. |
| Account Detail | Drillthrough from a selected account to the monthly actual-versus-budget comparison and profit impact. |
| Financial Reference | Monthly sales and purchasing matrices with actuals, budgets and variances. |
| Tooltip | Contextual sales, costs, operating profit and margin when hovering over a city. |

Example workflow: select 2025 and Coruna on the waterfall, right-click
Purchases, and choose **Drill through → Account Detail**. The profit impact
is approximately −€7.96k. The monthly chart helps locate overspend periods.
Select one year and one city when using the detail page's context cards.

## Data and analytical approach

- **Actuals:** 4,032 transactions, dated at posting level, with account and cost-centre identifiers.
- **Budget:** 576 monthly budget records at cost-centre × account level.
- **Dimensions:** calendar, six accounts and four cost centres (Coruna, Santiago, Vigo and Lugo).
- **Model:** shared account, calendar and cost-centre dimensions allow both fact tables
  to be analysed at comparable levels without joining raw transactions to monthly budgets.
- **DAX:** measures for sales, purchasing, operating costs, gross and operating
  profit, budget variance and percentage variance. Explicit measures support
  consistent filtering and financial calculation.
- **Visual analysis:** KPI cards, conditional formatting, report-page tooltips,
  waterfall analysis, drillthrough, matrices and slicers.

### Financial definitions

| Measure | Definition |
|---|---|
| Gross profit | Sales − purchases |
| Operating profit | Sales − purchases − other operating expenses |
| Operating margin (%) | Operating profit ÷ sales |
| Budget variance | Actual − budget |
| Variance (%) | Variance ÷ budget |

In the profit waterfall, an increase in expenses is represented as a negative
impact on operating profit. In the purchasing reference matrix, a positive
variance means costs exceeded budget.

## SQL analysis (MySQL)

| Script | Purpose |
|---|---|
| [compras_vigo_mensual_2025.sql](compras_vigo_mensual_2025.sql) | Monthly actual versus budget purchasing in Vigo. |
| [presupuest_vigo_mensual_2025.sql](presupuest_vigo_mensual_2025.sql) | Monthly and annual purchasing budget for Vigo. |
| [analisis_compras_2025.sql](analisis_compras_2025.sql) | Purchasing variances across cost centres. |
| [margen_bruto.sql](margen_bruto.sql) | Gross and operating profit comparison by cost centre. |
| [ventas_lugo_comparativa.sql](ventas_lugo_comparativa.sql) | Customer-level year-over-year sales analysis and reconciliation to the city total. |

The queries use SQL aggregation, joins and common table expressions (CTEs)
to investigate and reconcile financial results at the relevant reporting grain.

## Excel analysis

[Excel workbook](Excel%20proyect.xlsx) includes three PivotTables for budget
versus actuals, gross profit and operating profit. Power Query handles
data preparation, and the Excel Data Model supports the financial measures.

## Reproducing the analysis

1. Download the files from [Data/](Data/).
2. For SQL, import `actuals.csv`, `budget.csv` and `cost_centres.csv` into
   MySQL 8 using table names `actuals`, `budget` and `cost_centres`.
   Run the relevant scripts in MySQL Workbench.
3. Open the Excel workbook, update the `RutaDatos` Power Query parameter
   to your local data folder, and refresh. Full refresh requires all ten source CSVs.
4. Open the PBIX in Power BI Desktop. If the source path differs, update
   the CSV paths in **Transform data → Data source settings** before refreshing.

**Validation:** source-level aggregations reconcile the 2025 KPIs and the
customer-level analysis. The data is synthetic and provided for demonstration.

## Resumen en español

Proyecto de control presupuestario y análisis financiero desarrollado con Power BI,
MySQL y Excel. Compara resultados reales con presupuesto por centro de coste,
cuenta y periodo, identifica las principales desviaciones y permite profundizar
en su evolución mensual mediante drillthrough. En 2025, el resultado operativo
fue de 375.144,19 €, un 19,76 % inferior al presupuesto. El mayor exceso de
compras se registró en Vigo, y Lugo concentró la mayor desviación negativa del
resultado operativo entre los cuatro centros.

**Author:** Abel Maroño Pazos · Economics · Financial Controlling · Microsoft Certified: Power BI Data Analyst Associate (PL-300)
