-- Compara el margen bruto y el resultado operativo de 2025 con el presupuesto
-- para cada centro de coste. El margen bruto se calcula como ventas menos compras.

SELECT * FROM actuals;

SELECT 
cost_centre_id,
 SUM(CASE WHEN account_id = 700 THEN amount_eur ELSE 0 END) AS sales_eur, 
 SUM(CASE WHEN account_id = 600 THEN amount_eur ELSE 0 END) AS purchases_eur,
SUM(CASE WHEN account_id = 700 THEN amount_eur ELSE 0 END)
- SUM(CASE WHEN account_id = 600 THEN amount_eur ELSE 0 END) AS gross_profit_eur
FROM actuals
WHERE account_id IN (600,700)
AND posting_date >= '2025-01-01'
AND posting_date < '2026-01-01'
GROUP BY cost_centre_id;


SELECT * FROM budget;


SELECT 
cost_centre_id,
 SUM(CASE WHEN account_id = 700 THEN budget_eur ELSE 0 END) AS toal_budget_eur, 
 SUM(CASE WHEN account_id = 600 THEN budget_eur ELSE 0 END) AS purchases_budget_eur,
SUM(CASE WHEN account_id = 700 THEN budget_eur ELSE 0 END)
- SUM(CASE WHEN account_id = 600 THEN budget_eur ELSE 0 END) AS gross_profit_budget_eur
FROM budget
WHERE account_id IN (600,700)
AND month_start >= '2025-01-01'
AND month_start < '2026-01-01'
GROUP BY cost_centre_id;


SELECT 
real_gross_margin.cost_centre_id,
gross_profit_eur,
gross_profit_budget_eur,
gross_profit_eur-gross_profit_budget_eur AS variance_eur
FROM(
    SELECT 
cost_centre_id,
 SUM(CASE WHEN account_id = 700 THEN amount_eur ELSE 0 END) AS sales_eur, 
 SUM(CASE WHEN account_id = 600 THEN amount_eur ELSE 0 END) AS purchases_eur,
SUM(CASE WHEN account_id = 700 THEN amount_eur ELSE 0 END)
- SUM(CASE WHEN account_id = 600 THEN amount_eur ELSE 0 END) AS gross_profit_eur
FROM actuals
WHERE account_id IN (600,700)
AND posting_date >= '2025-01-01'
AND posting_date < '2026-01-01'
GROUP BY cost_centre_id
) AS real_gross_margin
LEFT JOIN(
    SELECT 
cost_centre_id,
 SUM(CASE WHEN account_id = 700 THEN budget_eur ELSE 0 END) AS toal_budget_eur, 
 SUM(CASE WHEN account_id = 600 THEN budget_eur ELSE 0 END) AS purchases_budget_eur,
SUM(CASE WHEN account_id = 700 THEN budget_eur ELSE 0 END)
- SUM(CASE WHEN account_id = 600 THEN budget_eur ELSE 0 END) AS gross_profit_budget_eur
FROM budget
WHERE account_id IN (600,700)
AND month_start >= '2025-01-01'
AND month_start < '2026-01-01'
GROUP BY cost_centre_id
) AS budget_gross_margin
ON real_gross_margin.cost_centre_id = budget_gross_margin.cost_centre_id;



SELECT 
real_gross_margin.cost_centre_id,
cost_centre_name,
operating_margin_eur, 
operating_margin_budget_eur,
operating_margin_eur - operating_margin_budget_eur AS variance_eur
FROM(
    SELECT 
cost_centre_id,
 SUM(CASE WHEN account_id = 700 THEN amount_eur ELSE 0 END) AS sales_eur, 
 SUM(CASE WHEN account_id = 600 THEN amount_eur ELSE 0 END) AS purchases_eur,
 SUM(CASE WHEN account_id = 621 THEN amount_eur ELSE 0 END) AS rent_eur,
 SUM(CASE WHEN account_id = 627 THEN amount_eur ELSE 0 END) AS marketing_eur,
 SUM(CASE WHEN account_id = 628 THEN amount_eur ELSE 0 END) AS supply_eur,
 SUM(CASE WHEN account_id = 640 THEN amount_eur ELSE 0 END) AS Wages_eur,

SUM(CASE WHEN account_id = 700 THEN amount_eur ELSE 0 END)
- SUM(CASE WHEN account_id = 600 THEN amount_eur ELSE 0 END)
- SUM(CASE WHEN account_id = 621 THEN amount_eur ELSE 0 END) 
- SUM(CASE WHEN account_id = 627 THEN amount_eur ELSE 0 END)
- SUM(CASE WHEN account_id = 628 THEN amount_eur ELSE 0 END)
- SUM(CASE WHEN account_id = 640 THEN amount_eur ELSE 0 END) AS operating_margin_eur
FROM actuals
WHERE account_id IN (600,700,621,627,628,640)
AND posting_date >= '2025-01-01'
AND posting_date < '2026-01-01'
GROUP BY cost_centre_id
) AS real_gross_margin
LEFT JOIN(
    SELECT 
cost_centre_id,
 SUM(CASE WHEN account_id = 700 THEN budget_eur ELSE 0 END) AS toal_budget_eur, 
 SUM(CASE WHEN account_id = 600 THEN budget_eur ELSE 0 END) AS purchases_budget_eur,
SUM(CASE WHEN account_id = 700 THEN budget_eur ELSE 0 END)
- SUM(CASE WHEN account_id = 600 THEN budget_eur ELSE 0 END) 
- SUM(CASE WHEN account_id = 621 THEN budget_eur ELSE 0 END)
- SUM(CASE WHEN account_id = 627 THEN budget_eur ELSE 0 END)
- SUM(CASE WHEN account_id = 628 THEN budget_eur ELSE 0 END)
- SUM(CASE WHEN account_id = 640 THEN budget_eur ELSE 0 END) AS operating_margin_budget_eur
FROM budget
WHERE account_id IN (600, 700, 621, 627, 628, 640)
AND month_start >= '2025-01-01'
AND month_start < '2026-01-01'
GROUP BY cost_centre_id
) AS budget_gross_margin
ON real_gross_margin.cost_centre_id = budget_gross_margin.cost_centre_id
LEFT JOIN cost_centres
ON cost_centres.cost_centre_id = real_gross_margin.cost_centre_id
ORDER BY variance_eur DESC;