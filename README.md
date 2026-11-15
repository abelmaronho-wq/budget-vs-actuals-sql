Control presupuestario y análisis de ventas

Español

Este proyecto analiza con MySQL y Excel dónde se desvió el gasto del presupuesto
en 2025 y qué clientes registraron las mayores caídas de ventas en Lugo.

Qué encontré

En Vigo, las compras superaron el presupuesto en 52.840,91 € (+9,26 %).
Fue el mayor exceso en euros entre los centros de coste analizados.

En Lugo, las ventas de septiembre a diciembre bajaron de 420.389,37 €
en 2024 a 384.927,64 € en 2025. La caída fue de 35.461,73 € (−8,44 %).
Los clientes 39, 5 y 32 registraron las mayores caídas. La suma de las
variaciones de todos los clientes coincide con el total de Lugo.

Consultas incluidas

Los cinco scripts SQL están en la raíz del repositorio.

compras_vigo_mensual_2025.sql
Compara las compras reales y presupuestadas de Vigo mes a mes.

presupuest_vigo_mensual_2025.sql
Muestra el presupuesto de compras de Vigo por mes y para todo 2025.

analisis_compras_2025.sql
Compara las compras de 2025 con el presupuesto por centro de coste.

margen_bruto.sql
Compara el margen bruto y el resultado operativo de 2025 con el
presupuesto de cada centro de coste.

ventas_lugo_comparativa.sql
Compara las ventas de Lugo por cliente y comprueba el total.

Cómo ejecutar las consultas

Importa los CSV de Data/ en un esquema de MySQL usando los
nombres de tabla actuals, budget y cost_centres. Abre el archivo SQL que quieras ejecutar. Si la consulta
empieza con WITH, selecciona desde WITH hasta el punto y coma final.

Análisis en Excel

Excel proyect.xlsx incluye tres tablas dinámicas para comparar el
presupuesto con los resultados reales y analizar el margen bruto y el
margen operativo. El libro usa Power Query y el modelo de datos de Excel.

Para actualizar las consultas, ajusta el parámetro RutaDatos en
Power Query para que apunte a la carpeta local que contiene los CSV.
La actualización completa requiere los diez archivos de origen:
accounts.csv, actuals.csv, budget.csv, cost_centres.csv,
customers.csv, employees.csv, order_items.csv, orders.csv,
products.csv y territories.csv. La carpeta Data/ contiene los
tres CSV necesarios para el análisis SQL.

English · Budget control and sales analysis

This MySQL and Excel project looks at where spending differed from budget in 2025
and which customers recorded the largest sales declines in Lugo.

What I found

In Vigo, purchases exceeded budget by €52,840.91 (+9.26%). This was
the largest overspend in euros among the cost centres analysed.

In Lugo, September to December sales fell from €420,389.37 in 2024
to €384,927.64 in 2025, a decline of €35,461.73 (−8.44%). Customers
39, 5 and 32 recorded the largest declines. The changes across all
customers add up to the overall decline in Lugo.

SQL scripts

All five SQL scripts are in the repository root.

compras_vigo_mensual_2025.sql
Compares actual and budgeted purchases in Vigo month by month.

presupuest_vigo_mensual_2025.sql
Shows Vigo's purchasing budget by month and for the full year 2025.

analisis_compras_2025.sql
Compares 2025 purchases against budget by cost centre.

margen_bruto.sql
Compares 2025 gross profit and operating profit against budget
by cost centre.

ventas_lugo_comparativa.sql
Compares sales in Lugo by customer and checks the overall change.

Running the queries

Import the CSV files from Data/ into a MySQL schema as
actuals, budget and cost_centres. Open the SQL file you want to run. If a query starts with WITH,
select everything from WITH to the final semicolon.

Excel analysis

Excel proyect.xlsx includes three PivotTables covering budget versus
actuals, gross margin and operating margin. The workbook uses Power Query
and the Excel Data Model.

To refresh the queries, set the Power Query parameter RutaDatos to the
local folder containing the source CSV files. A full refresh requires all
ten files: accounts.csv, actuals.csv, budget.csv,
cost_centres.csv, customers.csv, employees.csv, order_items.csv,
orders.csv, products.csv and territories.csv. The Data/ folder
contains the three CSV files required for the SQL analysis.
