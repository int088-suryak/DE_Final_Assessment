
---

# PySpark Azure SQL Ingestion Framework

## 🔧 Overview

This framework enables Full Load (FL), Incremental Load (IL), and Hash-based Change Detection with Hard Delete detection from **Azure SQL** to **Delta Tables in a Lakehouse (Databricks)** using PySpark. It adds metadata and operational logging, supporting robust data movement and monitoring.

---

## 📁 Features

* 🔄 **Full Load** with metadata columns
* ⏱️ **Incremental Load** with datetime field
* 🧠 **Hash-Based Change Detection** for inserts and updates
* ❌ **Hard Delete Detection** for physically deleted records
* 🔐 Encodes `VARBINARY` fields using Base64
* 📄 Centralized logging of each data movement job

---

## 🌐 Data Source URL

Data is ingested from **Azure SQL Database** using the **JDBC** URL format:

```text
jdbc:sqlserver://<hostname>:<port>;database=<db_name>;encrypt=true;trustServerCertificate=true
```

The credentials are securely passed using Spark configuration or secrets.

---
## 🔐 Required Credentials
## Azure SQL Credentials
These are needed to connect to the source database using JDBC.

## Key	Description
* source_user	Username to authenticate to the Azure SQL database
* source_password	Password for the given username
* source_host	Azure SQL Server hostname (e.g., yourserver.database.windows.net)
* source_port	Typically 1433
* source_database	Name of the database to connect to

## 📦 Prerequisites

* Apache Spark with Delta Lake
* Databricks (preferred) or Spark environment
* Azure SQL DB with access credentials
* Microsoft JDBC driver (loaded via Spark config or cluster)

---

## 📊 Data Points for Ingestion

The ingestion framework is built to work with **any structured table** in Azure SQL. It supports:

* All scalar SQL types (INT, BIGINT, VARCHAR, DATETIME, etc.)
* **Binary columns** (`VARBINARY`) → converted to Base64 string
* Optional filtering for **Incremental Load** using a datetime column
* Composite primary keys using `|` separator

---

## 🛠️ Supported Tools

| Tool                      | Purpose                                    |
| -----------------         | ------------------------------------------ |
| ✅**Python(PySpark)**    | Core processing engine                     |
| ✅**Azure SQL**          | Source system for structured data          |
| ✅**Delta Lake**         | Destination table format with ACID support |
| ✅**Databricks**         | Primary execution environment              |

---

## 🎯 Supported Destinations

This framework writes data to:

# Lakehouse
* **✅Databricks Lakehouse** using **Delta Tables**

---


## 🧾 Logging Table Schema

All load operations are tracked in:
**`catalog.raw.connector_sql.vp_monitor_hard_delete_log`**

| Column Name    | Description                       |
| -------------- | --------------------------------- |
| source\_type   | Type of source (e.g., SQL Server) |
| source\_name   | Friendly name of source           |
| source\_schema | Schema name in Azure SQL          |
| source\_table  | Table name in Azure SQL           |
| sink\_schema   | Lakehouse schema                  |
| sink\_table    | Lakehouse table                   |
| load\_type     | FL / IL / Hash                    |
| row\_count     | No. of rows ingested              |
| status         | `Success` or `Fail`               |
| message        | Descriptive message               |
| log\_date      | Timestamp of the log entry        |

---

## ⚠️ Limitations

* ❌ Does **not support nested or JSON fields** in SQL Server.
* ❌ Requires pre-created target schemas/tables in Lakehouse.
* 🛑 Assumes **no changes in schema structure** during loads.
* ⚠️ Composite keys must be passed using `|`-delimited string.
* ⚠️ Performance is limited by network latency and JDBC read speeds.
* 🧪 Not intended for real-time streaming or micro-batch ingestion.
* 💾 **Only Delta tables** are supported for sink output.

---


