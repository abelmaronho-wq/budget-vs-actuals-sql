-- Compara las compras reales y presupuestadas de 2025 por centro de coste.
-- Calcula la desviación anual en euros y en porcentaje para cada centro.

SELECT * FROM cost_centres;

SELECT* FROM actuals;

SELECT * 
FROM(
    SELECT cost_centre_id, SUM(amount_eur) AS real_eur
FROM actuals
WHERE account_id = 600
AND posting_date >= '2025-01-01'
AND posting_date < '2026-01-01'
GROUP BY cost_centre_id) AS real_eur_by_centre;

SELECT * FROM budget;

SELECT * 
FROM(
    SELECT cost_centre_id, SUM(budget_eur) AS budget_eur
FROM budget
WHERE account_id = 600
AND month_start>='2025-01-01'
AND month_start<'2026-01-01'
GROUP BY cost_centre_id) AS budget_eur_by_centre;

SELECT 
real_eur_by_centre.cost_centre_id,
 real_eur,
 budget_eur,
 real_eur-budget_eur AS variance_eur,
 ROUND(((real_eur-budget_eur)/budget_eur)*100,2) AS Variance_pct
FROM (
    SELECT cost_centre_id, SUM(amount_eur) AS real_eur
FROM actuals
WHERE account_id = 600
AND posting_date >= '2025-01-01'
AND posting_date < '2026-01-01'
GROUP BY cost_centre_id) AS real_eur_by_centre
 LEFT JOIN (
    SELECT cost_centre_id, SUM(budget_eur) AS budget_eur
FROM budget
WHERE account_id = 600
AND month_start>='2025-01-01'
AND month_start<'2026-01-01'
GROUP BY cost_centre_id) AS budget_eur_by_centre
ON real_eur_by_centre.cost_centre_id = budget_eur_by_centre.cost_centre_id
ORDER BY Variance_eur DESC;




SELECT 
real_eur_by_centre.cost_centre_id,
 real_eur,
 budget_eur,
 real_eur-budget_eur AS variance_eur,
 ROUND(((real_eur-budget_eur)/budget_eur)*100,2) AS Variance_pct,
 cost_centres.cost_centre_name
FROM (
    SELECT cost_centre_id, SUM(amount_eur) AS real_eur
FROM actuals
WHERE account_id = 600
AND posting_date >= '2025-01-01'
AND posting_date < '2026-01-01'
GROUP BY cost_centre_id) AS real_eur_by_centre
 LEFT JOIN (
    SELECT cost_centre_id, SUM(budget_eur) AS budget_eur
FROM budget
WHERE account_id = 600
AND month_start>='2025-01-01'
AND month_start<'2026-01-01'
GROUP BY cost_centre_id) AS budget_eur_by_centre
ON real_eur_by_centre.cost_centre_id = budget_eur_by_centre.cost_centre_id
LEFT JOIN cost_centres
ON real_eur_by_centre.cost_centre_id=cost_centres.cost_centre_id
ORDER BY Variance_eur DESC;
