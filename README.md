# RetailPro 🛒📊

## 📖 Descripción del Proyecto
**RetailPro** es un proyecto integral de análisis de datos enfocado en el sector minorista (retail). Este repositorio documenta el flujo completo de datos de extremo a extremo: desde la creación de la base de datos relacional en SQL Server, pasando por procesos de extracción y consulta, hasta el modelado y visualización de datos en Power BI mediante un Esquema Estrella y el uso de funciones DAX.

El objetivo principal de este proyecto es transformar datos transaccionales crudos en insights de negocio accionables para la toma de decisiones.

## 🛠️ Tecnologías y Herramientas Utilizadas
*   **Base de Datos:** Microsoft SQL Server
*   **Lenguaje de Consultas:** T-SQL (Scripts de creación y consultas de negocio)
*   **Visualización de Datos:** Power BI Desktop
*   **Modelado de Datos:** Esquema Estrella (Star Schema)
*   **Cálculos Analíticos:** DAX (Data Analysis Expressions)

## 📁 Estructura del Repositorio

```text
RetailPro/
├── ventas_tech_db.sql                 # Script unificado para crear tablas y poblar la base de datos
├── m4_consultas_negocio.sql           # Consultas de negocio (Insights comerciales)
├── m5_consultas_joins.sql             # Consultas avanzadas usando INNER y LEFT JOINs
├── Castro_Fernando_Checkpoint2.pbix   # Archivo de Power BI con el modelo y visualizaciones
└── README.md
```

## 🚀 Cómo ejecutar los scripts y reproducir el proyecto

Para probar este proyecto en tu entorno local, sigue estos pasos:

### 1. Preparar la Base de Datos (SQL Server)
1.  Clona este repositorio en tu máquina local.
2.  Abre **SQL Server Management Studio (SSMS)** y conéctate a tu servidor local.
3.  Abre y ejecuta el script `ventas_tech_db.sql`. **Importante:** Este script se encarga de crear la base de datos, estructurar las tablas e insertar todos los datos de prueba simultáneamente.
4.  *(Opcional)* Abre y ejecuta los scripts `m4_consultas_negocio.sql` o `m5_consultas_joins.sql` para ver los análisis de datos y relaciones en acción.

### 2. Conectar y Visualizar en Power BI
1.  Abre el archivo `Castro_Fernando_Checkpoint2.pbix` usando **Power BI Desktop**.
2.  Es posible que debas actualizar las credenciales de origen de datos para que apunten a tu servidor SQL Server local (Inicio > Transformar datos > Configuración de origen de datos).
3.  Haz clic en **Actualizar** para cargar los datos desde tu SQL Server local.
4.  ¡Explora el modelo de datos (Esquema Estrella) y los dashboards interactivos!

## 📈 Principales Medidas DAX Implementadas

El proyecto incluye una librería de medidas (KPIs) desarrolladas en DAX:
*   `Total Ventas`: Suma base de la facturación.
*   `Ventas Online`: Cálculo filtrado por canal usando la función CALCULATE.
*   `Ventas YTD`: Acumulado de ventas en lo que va del año.
*   `Ventas LY`: Recuperación de las ventas del mismo periodo del año anterior.
*   `% Crecimiento Anual`: Variación porcentual usando VAR y DIVIDE de forma segura.

---
*Creado por Fernando Castro como entrega final del proyecto.*
