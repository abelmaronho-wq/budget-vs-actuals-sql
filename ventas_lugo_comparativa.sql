-- Compara las ventas de Lugo de septiembre a diciembre de 2024 y 2025.
-- Calcula la variación total y por cliente, y comprueba que ambas cuadran.

SELECT * FROM actuals;

SELECT YEAR(posting_date),
SUM(amount_eur), 
cost_centre_id
FROM actuals
WHERE account_id = 700
AND cost_centre_id = 4
AND( 
(posting_date >= '2024-09-01' AND posting_date < '2025-01-01')
OR 
(posting_date >= '2025-09-01' AND posting_date < '2026-01-01')
)
GROUP BY YEAR(posting_date);

WITH ventas_lugo AS (SELECT
YEAR(posting_date),
SUM(amount_eur), 
cost_centre_id
FROM actuals
WHERE account_id = 700
AND cost_centre_id = 4
AND( 
(posting_date >= '2024-09-01' AND posting_date < '2025-01-01')
OR 
(posting_date >= '2025-09-01' AND posting_date < '2026-01-01')
)
GROUP BY YEAR(posting_date)
)
SELECT * FROM ventas_lugo;

WITH ventas_lugo AS (
    SELECT
        YEAR(posting_date) AS sales_year,
        SUM(amount_eur) AS sales_eur
    FROM actuals
    WHERE account_id = 700
      AND cost_centre_id = 4
      AND (
          (posting_date >= '2024-09-01' AND posting_date < '2025-01-01')
          OR
          (posting_date >= '2025-09-01' AND posting_date < '2026-01-01')
      )
    GROUP BY YEAR(posting_date)
),
ventas_por_anio AS (
    SELECT
        SUM(CASE WHEN sales_year = 2024 THEN sales_eur ELSE 0 END) AS sales_2024_eur,
        SUM(CASE WHEN sales_year = 2025 THEN sales_eur ELSE 0 END) AS sales_2025_eur
    FROM ventas_lugo
)
SELECT
    sales_2024_eur,
    sales_2025_eur,
    sales_2025_eur - sales_2024_eur AS change_eur,
    ROUND(
        100 * (sales_2025_eur - sales_2024_eur) / NULLIF(sales_2024_eur, 0),
        2
    ) AS change_pct
FROM ventas_por_anio;


WITH ventas_lugo AS (SELECT
YEAR(posting_date),
SUM(amount_eur), 
cost_centre_id
FROM actuals
WHERE account_id = 700
AND cost_centre_id = 4
AND( 
(posting_date >= '2024-09-01' AND posting_date < '2025-01-01')
OR 
(posting_date >= '2025-09-01' AND posting_date < '2026-01-01')
)
GROUP BY YEAR(posting_date)
)
SELECT * FROM ventas_lugo;

WITH ventas_lugo AS (
    SELECT
        customer_id,
        YEAR(posting_date) AS sales_year,
        SUM(amount_eur) AS sales_eur
    FROM actuals
    WHERE account_id = 700
      AND cost_centre_id = 4
      AND (
          (posting_date >= '2024-09-01' AND posting_date < '2025-01-01')
          OR
          (posting_date >= '2025-09-01' AND posting_date < '2026-01-01')
      )
    GROUP BY customer_id, YEAR(posting_date)
)
SELECT
    customer_id,
    sales_year,
    sales_eur
FROM ventas_lugo
ORDER BY customer_id, sales_year;


WITH ventas_lugo AS (
    SELECT
        customer_id,
        YEAR(posting_date) AS sales_year,
        SUM(amount_eur) AS sales_eur
    FROM actuals
    WHERE account_id = 700
      AND cost_centre_id = 4
      AND (
          (posting_date >= '2024-09-01' AND posting_date < '2025-01-01')
          OR
          (posting_date >= '2025-09-01' AND posting_date < '2026-01-01')
      )
    GROUP BY customer_id, YEAR(posting_date)
)
SELECT
    customer_id,
    SUM(CASE WHEN sales_year = 2024 THEN sales_eur ELSE 0 END) AS sales_2024_eur,
    SUM(CASE WHEN sales_year = 2025 THEN sales_eur ELSE 0 END) AS sales_2025_eur
FROM ventas_lugo
GROUP BY customer_id
ORDER BY customer_id;


WITH ventas_lugo AS (
    SELECT
        customer_id,
        YEAR(posting_date) AS sales_year,
        SUM(amount_eur) AS sales_eur
    FROM actuals
    WHERE account_id = 700
      AND cost_centre_id = 4
      AND (
          (posting_date >= '2024-09-01' AND posting_date < '2025-01-01')
          OR
          (posting_date >= '2025-09-01' AND posting_date < '2026-01-01')
      )
    GROUP BY customer_id, YEAR(posting_date)
)
SELECT
    customer_id,
    SUM(CASE WHEN sales_year = 2024 THEN sales_eur ELSE 0 END) AS sales_2024_eur,
    SUM(CASE WHEN sales_year = 2025 THEN sales_eur ELSE 0 END) AS sales_2025_eur,
    SUM(CASE WHEN sales_year = 2025 THEN sales_eur ELSE 0 END)
        - SUM(CASE WHEN sales_year = 2024 THEN sales_eur ELSE 0 END) AS change_eur
FROM ventas_lugo
GROUP BY customer_id
ORDER BY change_eur ASC, customer_id;

WITH ventas_lugo AS (
    SELECT
        customer_id,
        YEAR(posting_date) AS sales_year,
        SUM(amount_eur) AS sales_eur
    FROM actuals
    WHERE account_id = 700
      AND cost_centre_id = 4
      AND (
          (posting_date >= '2024-09-01' AND posting_date < '2025-01-01')
          OR
          (posting_date >= '2025-09-01' AND posting_date < '2026-01-01')
      )
    GROUP BY customer_id, YEAR(posting_date)
),
cambios_por_cliente AS (
    SELECT
        customer_id,
        SUM(CASE WHEN sales_year = 2025 THEN sales_eur ELSE 0 END)
          - SUM(CASE WHEN sales_year = 2024 THEN sales_eur ELSE 0 END) AS change_eur
    FROM ventas_lugo
    GROUP BY customer_id
)
SELECT SUM(change_eur) AS total_change_eur
FROM cambios_por_cliente;