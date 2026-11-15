-- Compara las compras reales y presupuestadas de Vigo mes a mes en 2025.
-- Calcula la desviación mensual en euros y en porcentaje.


USE retail_finance;

SELECT * FROM cost_centres;

SELECT cost_centre_name 
FROM cost_centres;

SELECT cost_centre_name, cost_centre_id
FROM cost_centres
WHERE cost_centre_name = "Vigo";

SELECT * FROM actuals;

SELECT posting_date, amount_eur, account_id
FROM actuals
WHERE cost_centre_id=3;

SELECT posting_date, amount_eur, account_id
FROM actuals
WHERE cost_centre_id=3 AND account_id=600 
AND posting_date >= '2025-01-01'
AND posting_date < '2026-01-01';


SELECT SUM(amount_eur)
FROM actuals
WHERE cost_centre_id=3 AND account_id=600 
AND posting_date >= '2025-01-01'
AND posting_date < '2026-01-01';





SELECT MONTH(posting_date), SUM(amount_eur)
FROM actuals
WHERE cost_centre_id=3 AND account_id=600 
AND posting_date >= '2025-01-01'
AND posting_date < '2026-01-01'
GROUP BY MONTH(posting_date);


SELECT 
Purchase_month,
actual_purchases_eur,
Budget_eur
FROM (
 SELECT MONTH(posting_date) AS Purchase_month,
  SUM(amount_eur) AS actual_purchases_eur
FROM actuals
WHERE cost_centre_id=3 AND account_id=600 
AND posting_date >= '2025-01-01'
AND posting_date < '2026-01-01'
GROUP BY MONTH(posting_date)   
) AS Real_mensual
LEFT JOIN (
    SELECT MONTH(month_start) AS Budget_month, 
    SUM(budget_eur) AS Budget_eur
    FROM budget
    WHERE account_id =600 AND 
    cost_centre_id =3
    AND month_start >= '2025-01-01'
    AND month_start < '2026-01-01'
    GROUP BY MONTH(month_start) 
) AS Budget_mensual
ON Real_mensual.Purchase_month = Budget_mensual.Budget_month;


SELECT 
Purchase_month,
actual_purchases_eur,
Budget_eur,
actual_purchases_eur-Budget_eur AS variance_eur
FROM (
 SELECT MONTH(posting_date) AS Purchase_month,
  SUM(amount_eur) AS actual_purchases_eur
FROM actuals
WHERE cost_centre_id=3 AND account_id=600 
AND posting_date >= '2025-01-01'
AND posting_date < '2026-01-01'
GROUP BY MONTH(posting_date)   
) AS Real_mensual
LEFT JOIN (
    SELECT MONTH(month_start) AS Budget_month, 
    SUM(budget_eur) AS Budget_eur
    FROM budget
    WHERE account_id =600 AND 
    cost_centre_id =3
    AND month_start >= '2025-01-01'
    AND month_start < '2026-01-01'
    GROUP BY MONTH(month_start) 
) AS Budget_mensual
ON Real_mensual.Purchase_month = Budget_mensual.Budget_month
ORDER BY variance_eur DESC;


SELECT 
Purchase_month,
actual_purchases_eur,
Budget_eur,
actual_purchases_eur-Budget_eur AS variance_eur,
ROUND(((actual_purchases_eur-Budget_eur)/Budget_eur)*100,2) AS variance_pct
FROM (
 SELECT MONTH(posting_date) AS Purchase_month,
  SUM(amount_eur) AS actual_purchases_eur
FROM actuals
WHERE cost_centre_id=3 AND account_id=600 
AND posting_date >= '2025-01-01'
AND posting_date < '2026-01-01'
GROUP BY MONTH(posting_date)   
) AS Real_mensual
LEFT JOIN (
    SELECT MONTH(month_start) AS Budget_month, 
    SUM(budget_eur) AS Budget_eur
    FROM budget
    WHERE account_id =600 AND 
    cost_centre_id =3
    AND month_start >= '2025-01-01'
    AND month_start < '2026-01-01'
    GROUP BY MONTH(month_start) 
) AS Budget_mensual
ON Real_mensual.Purchase_month = Budget_mensual.Budget_month
ORDER BY variance_eur DESC;