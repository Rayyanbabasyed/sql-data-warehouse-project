
# 🏗️ SQL Data Warehouse Project | End-to-End Data Engineering

<p align="center">
  <img src="https://img.shields.io/badge/SQL_Server-CC2927?style=for-the-badge&logo=microsoftsqlserver&logoColor=white"/>
  <img src="https://img.shields.io/badge/Data_Warehouse-2E8B57?style=for-the-badge"/>
  <img src="https://img.shields.io/badge/ETL_Pipeline-0078D4?style=for-the-badge"/>
  <img src="https://img.shields.io/badge/Medallion_Architecture-Gold?style=for-the-badge"/>
  <img src="https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github"/>
</p>

<p align="center">
  <b>Building a Modern Data Warehouse Using SQL Server</b>
</p>

---

## 📌 1. Project Overview

This project focuses on building a modern **SQL Server Data Warehouse** by integrating customer, product, and sales data from two different source systems: CRM and ERP.

The project follows the **Medallion Architecture (Bronze, Silver, and Gold)** to organize raw data, clean and transform information, and prepare business-ready datasets for analytical reporting.

The main objective is to develop an end-to-end data engineering solution using SQL Server and T-SQL.

---

## 🎯 2. Project Objectives

- Build a structured Data Warehouse using SQL Server.
- Integrate data from CRM and ERP source systems.
- Implement Bronze, Silver, and Gold layers.
- Perform data cleaning and standardization.
- Handle duplicate and inconsistent records.
- Create business-ready analytical tables.
- Maintain data quality through SQL validation queries.
- Develop reusable ETL stored procedures.

---

## 🏗️ 3. Data Architecture

This project follows the **Medallion Architecture**.

### 🥉 Bronze Layer – Raw Data

The Bronze Layer stores raw data directly from the source CSV files.

**Source Systems:**
- CRM System
- ERP System

**Tables:**

| CRM Tables | ERP Tables |
|---|---|
| crm_cust_info | erp_cust_az12 |
| crm_prd_info | erp_loc_a101 |
| crm_sales_details | erp_px_cat_g1v2 |

**Operations:**
- Load CSV files into SQL Server.
- Create raw staging tables.
- Use BULK INSERT for data ingestion.
- Implement stored procedures for loading.
- Preserve source data for further processing.

### 🥈 Silver Layer – Data Cleaning & Transformation

The Silver Layer transforms raw data into clean, standardized, and reliable datasets.

**Operations:**
- Remove duplicate records.
- Handle NULL values.
- Remove unwanted spaces using TRIM().
- Standardize categorical values.
- Validate date formats.
- Clean customer and product information.
- Integrate CRM and ERP datasets.
- Apply data quality rules.

### 🥇 Gold Layer – Business-Ready Data

The Gold Layer contains transformed data prepared for analytical reporting.

**Operations:**
- Create business-friendly tables.
- Develop dimension and fact tables.
- Implement data modeling.
- Prepare datasets for reporting and analysis.
- Build analytical views.

---

## 🔄 4. ETL Workflow

The project follows an end-to-end ETL process:

1. **Extract:** Collect data from CRM and ERP CSV files.
2. **Load:** Import raw data into Bronze tables.
3. **Transform:** Clean and standardize data in Silver tables.
4. **Integrate:** Combine CRM and ERP datasets.
5. **Model:** Build analytical tables in the Gold Layer.
6. **Validate:** Perform data quality checks.

---

## 📂 5. Project Folder Structure

```text
SQL-Data-Warehouse-Project/
│
├── 📁 01_datasets/
│   │
│   ├── 📁 source_crm/
│   │   ├── crm_cust_info.csv
│   │   ├── crm_prd_info.csv
│   │   └── crm_sales_details.csv
│   │
│   └── 📁 source_erp/
│       ├── erp_cust_az12.csv
│       ├── erp_loc_a101.csv
│       └── erp_px_cat_g1v2.csv
│
├── 📁 02_docs/
│   ├── Bronze_Layer_Documentation.pdf
│   ├── Silver_Layer_Documentation.pdf
│   └── Gold_Layer_Documentation.pdf
│
├── 📁 03_scripts/
│   │
│   ├── init_database.sql
│   │
│   ├── 📁 bronze/
│   │   ├── ddl_bronze.sql
│   │   └── proc_load_bronze.sql
│   │
│   ├── 📁 silver/
│   │   ├── ddl_silver.sql
│   │   └── proc_load_silver.sql
│   │
│   └── 📁 gold/
│       └── ddl_gold.sql
│
└── 📁 04_tests/
    ├── quality_checks_silver.sql
    └── quality_checks_gold.sql
```

*Note: Update the filenames above if your actual repository uses different names.*

---

## 🛠️ 6. Technologies Used

| Technology | Purpose |
|---|---|
| Microsoft SQL Server | Database Management |
| SQL Server Management Studio (SSMS) | SQL Development |
| T-SQL | Data Transformation |
| BULK INSERT | CSV Data Loading |
| Stored Procedures | ETL Automation |
| Git | Version Control |
| GitHub | Project Hosting |

---

## ⚙️ 7. Project Execution

### Step 1: Database Initialization

Execute the database initialization script.

```sql
-- Initialize the Data Warehouse
-- Execute init_database.sql
```

### Step 2: Create Bronze Tables

Execute the Bronze DDL script.

```sql
-- Execute ddl_bronze.sql
```

### Step 3: Load Bronze Data

Execute the Bronze loading procedure to import CRM and ERP CSV files.

```sql
-- Execute proc_load_bronze.sql
```

### Step 4: Create Silver Tables

Execute the Silver DDL script.

```sql
-- Execute ddl_silver.sql
```

### Step 5: Clean and Transform Data

Execute the Silver loading procedure.

```sql
-- Execute proc_load_silver.sql
```

### Step 6: Create Gold Tables

Execute the Gold DDL script.

```sql
-- Execute ddl_gold.sql
```

### Step 7: Validate Data Quality

Run SQL validation queries to check data consistency and accuracy.

```sql
-- Execute Silver and Gold quality checks
```

---

## 📊 8. Key Learning Outcomes

Through this project, I gained practical experience in:

- Understanding Data Warehouse Architecture.
- Working with CRM and ERP source systems.
- Implementing Medallion Architecture.
- Writing SQL queries.
- Creating stored procedures.
- Performing ETL operations.
- Data cleaning and transformation.
- Data integration and modeling.
- Implementing data quality checks.
- Managing projects using GitHub.

---

## 📚 9. Project Documentation

Detailed documentation is maintained separately for each layer.

| Layer | Documentation |
|---|---|
| 🥉 Bronze Layer | Bronze Layer Documentation |
| 🥈 Silver Layer | Silver Layer Documentation |
| 🥇 Gold Layer | Gold Layer Documentation |

📂 All documentation files are available in the `02_docs` folder.

---

## 🚀 10. Future Enhancements

- Connect the Data Warehouse with Power BI.
- Create interactive business dashboards.
- Develop advanced SQL analytical queries.
- Automate ETL execution.
- Implement additional data quality checks.

---

## 👨‍💻 11. About Me

### Syed Rayyan Baba

🎓 Data Science Student | Aspiring Data Analyst

📊 Passionate about Data Analytics, Data Engineering, and Machine Learning.

**Technical Skills:**

- SQL
- Python
- Excel
- Power BI
- Data Analytics
- Machine Learning

### 🌐 Connect With Me

<p>
  <a href="https://github.com/Rayyanbabasyed">
    <img src="https://img.shields.io/badge/GitHub-My_Profile-181717?style=for-the-badge&logo=github&logoColor=white"/>
  </a>
</p>

<p>
  <a href="https://www.linkedin.com/in/rayyanbaba-syed/">
    <img src="https://img.shields.io/badge/LinkedIn-Connect_With_Me-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white"/>
  </a>
</p>

---

<p align="center">
  ⭐ If you find this project useful, please give this repository a star!
</p>

<p align="center">
  <b>🚀 Built with dedication, SQL, and continuous learning.</b>
</p>
