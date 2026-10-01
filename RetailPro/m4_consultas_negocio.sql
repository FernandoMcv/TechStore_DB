-- Motor utilizado: SQL Server
-- Archivo: m4_consultas_negocio.sql

USE Ventas_Tech_DB;
GO

-- ======================================================================
-- Consulta 1 — Resumen ejecutivo mensual
-- Nota: En SQL Server se usa MONTH() en lugar de EXTRACT(MONTH FROM ...)
-- ======================================================================
SELECT 
    MONTH(fecha_venta) AS Mes,
    SUM(cantidad * precio_unitario) AS Total_Facturado,
    COUNT(id_venta) AS Cantidad_Pedidos,
    SUM(cantidad * precio_unitario) / COUNT(id_venta) AS Ticket_Promedio
FROM ventas
GROUP BY MONTH(fecha_venta);

-- ======================================================================
-- Consulta 2 — Ranking de productos (Top 5)
-- Nota: En SQL Server se usa TOP 5 en el SELECT en lugar de LIMIT 5 al final
-- ======================================================================
SELECT TOP 5
    id_producto,
    SUM(cantidad) AS Unidades_Vendidas,
    SUM(cantidad * precio_unitario) AS Total_Generado
FROM ventas
GROUP BY id_producto
ORDER BY Total_Generado DESC;

-- ======================================================================
-- Consulta 3 — Clientes recurrentes
-- ======================================================================
SELECT 
    id_cliente,
    COUNT(*) AS Cantidad_Pedidos,
    SUM(cantidad * precio_unitario) AS Total_Gastado
FROM ventas
GROUP BY id_cliente
HAVING COUNT(*) > 1;

-- ======================================================================
-- Consulta 4 — Meses por encima/por debajo del promedio
-- ======================================================================
SELECT 
    MONTH(fecha_venta) AS Mes,
    SUM(cantidad * precio_unitario) AS Total_Facturado,
    CASE 
        WHEN SUM(cantidad * precio_unitario) > (
            SELECT SUM(cantidad * precio_unitario) / COUNT(DISTINCT MONTH(fecha_venta)) FROM ventas
        ) THEN 'Por encima'
        WHEN SUM(cantidad * precio_unitario) < (
            SELECT SUM(cantidad * precio_unitario) / COUNT(DISTINCT MONTH(fecha_venta)) FROM ventas
        ) THEN 'Por debajo'
        ELSE 'Igual al promedio'
    END AS Comparacion_Promedio
FROM ventas
GROUP BY MONTH(fecha_venta);

-- ======================================================================
-- BLOQUE DE CIERRE: Hallazgos concretos
-- ======================================================================
-- 1. El producto 1 concentra casi el 56% de la facturación total del mes ($3,600 de $6,444), a pesar de tener solo 3 unidades vendidas frente a las 13 unidades del producto 2.
-- 2. El 100% de la base de clientes (5 de 5) resultó ser recurrente, realizando exactamente 2 pedidos cada uno. Además, los clientes 1 y 5 lideran ampliamente el volumen gastado ($2,640 y $2,100).
-- 3. Dado que todas las ventas ocurrieron en marzo (Mes 3), el mes facturó $6,444 y la consulta 4 lo etiqueta como 'Igual al promedio', indicando que falta data histórica para medir meses atípicos.
