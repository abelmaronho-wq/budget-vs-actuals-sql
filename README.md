# Control presupuestario y análisis de ventas

## Español

Este proyecto analiza con MySQL dónde se desvió el gasto del presupuesto
en 2025 y qué clientes registraron las mayores caídas de ventas en Lugo.

### Qué encontré

* En Vigo, las compras superaron el presupuesto en 52.840,91 € (+9,26 %).
Fue el mayor exceso en euros entre los centros de coste analizados.
* En Lugo, las ventas de septiembre a diciembre bajaron de 420.389,37 €
en 2024 a 384.927,64 € en 2025. La caída fue de 35.461,73 € (−8,44 %).
Los clientes 39, 5 y 32 registraron las mayores caídas. La suma de las
variaciones de todos los clientes coincide con el total de Lugo.

### Consultas incluidas

Los cinco archivos SQL están en la raíz del repositorio
* compras\_vigo\_mensual\_2025.sql  
Compara las compras reales y presupuestadas de Vigo mes a mes.
* presupuest\_vigo\_mensual\_2025.sql  
Muestra el presupuesto de compras de Vigo por mes y para todo 2025.
* analisis\_compras\_2025.sql  
Compara las compras de 2025 con el presupuesto por centro de coste.
* margen\_bruto.sql  
Compara el margen bruto y el resultado operativo de 2025 con el
presupuesto de cada centro de coste.
* ventas\_lugo\_comparativa.sql  
Compara las ventas de Lugo por cliente y comprueba el total.

### Cómo ejecutar las consultas

Abre el esquema de MySQL que contiene las tablas actuals, budget y
cost\_centres. Abre el archivo SQL que quieras ejecutar. Si la consulta
empieza con WITH, selecciona desde WITH hasta el punto y coma final.

El análisis en Excel se añadirá en una fase posterior.

## English · Budget control and sales analysis

This MySQL project looks at where spending differed from budget in 2025
and which customers recorded the largest sales declines in Lugo.

### What I found

* In Vigo, purchases exceeded budget by €52,840.91 (+9.26%). This was
the largest overspend in euros among the cost centres analysed.
* In Lugo, September to December sales fell from €420,389.37 in 2024
to €384,927.64 in 2025, a decline of €35,461.73 (−8.44%). Customers
39, 5 and 32 recorded the largest declines. The changes across all
customers add up to the overall decline in Lugo.

### SQL scripts

All five scripts are in the sql/ folder.

* compras\_vigo\_mensual\_2025.sql  
Compares actual and budgeted purchases in Vigo month by month.
* presupuest\_vigo\_mensual\_2025.sql  
Shows Vigo's purchasing budget by month and for the full year 2025.
* analisis\_compras\_2025.sql  
Compares 2025 purchases against budget by cost centre.
* margen\_bruto.sql  
Compares 2025 gross profit and operating profit against budget
by cost centre.
* ventas\_lugo\_comparativa.sql  
Compares sales in Lugo by customer and checks the overall change.

### Running the queries

Open the MySQL schema that contains the actuals, budget and cost\_centres
tables. Open the SQL file you want to run. If a query starts with WITH,
select everything from WITH to the final semicolon.

The Excel analysis will be added in a later phase.

