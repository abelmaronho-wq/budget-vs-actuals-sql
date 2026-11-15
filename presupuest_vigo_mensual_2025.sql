-- Compara las compras reales y presupuestadas de Vigo mes a mes en 2025.
-- Calcula la desviación mensual en euros y en porcentaje.

SELECT * FROM budget;

SELECT SUM(budget_eur)
FROM budget
WHERE account_id =600 AND 
cost_centre_id =3
AND month_start >= '2025-01-01'
AND month_start < '2026-01-01';

SELECT MONTH(month_start), SUM(budget_eur)
FROM budget
WHERE account_id =600 AND 
cost_centre_id =3
AND month_start >= '2025-01-01'
AND month_start < '2026-01-01'
GROUP BY MONTH(month_start);


SELECT * 
FROM(
    SELECT MONTH(month_start) AS Budget_month, 
    SUM(budget_eur) AS Budget_eur
    FROM budget
    WHERE account_id =600 AND 
    cost_centre_id =3
    AND month_start >= '2025-01-01'
    AND month_start < '2026-01-01'
    GROUP BY MONTH(month_start) 
) AS Budget_mensual;