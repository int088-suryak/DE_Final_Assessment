# 📡 Business Central Data Ingestion Connector

## 📘 Overview

This connector extracts data from Microsoft Business Central via API, processes it, and stores it in Azure Synapse. The connector handles API authentication, data preprocessing, and manages the data pipeline to ensure consistent data storage and availability for analytics.

## ✅ Prerequisites

Before using this connector, ensure the following requirements are met:

### 🔐 Required Credentials:

* **Client ID**: Your Azure AD application client ID
* **Client Secret**: Client secret for Azure AD authentication (stored in Azure Key Vault)
* **Company ID**: Your Microsoft Business Central company ID
* **Company Name**: The name of your Business Central company environment
* **OAuth Token**: Access token with the appropriate scope for the Business Central API

### ⚙️ Environment Setup:

* **Python Version**: Python 3.8+
* **PySpark Version**: Latest stable version
* **ODBC Driver**: ODBC Driver 18 for SQL Server
* **Azure Services**:

  * Azure Key Vault configured with necessary secrets
  * Azure Synapse access
  * Azure Storage Blob for storing extracted data

## 📥 Data Points for Ingestion

The connector can extract data from any Business Central endpoints configured in the source mapping file. The endpoints are defined in an Excel file located at:
`<your_mapping_file_path>/example_Source.xlsx`

## 🧰 Supported Tools & Destinations

### 🛠️ Tools Used in This Script

* ✅ Python (PySpark)
* ✅ Azure Synapse

### 📁 Files

* ✅ Parquet

### 🏢 Data Warehouse / Database

* ✅ Azure SQL

## ⚙️ Other Supported but Not Used in Script

### 📁 Files

* ✅ JSON
* ✅ CSV
* ✅ ORC

### 🌊 Lakehouse

* ✅ Databricks: Delta Lake
* ✅ Fabric - Lakehouse

### 🏢 Data Warehouse / Database

* ✅ Snowflake
* ✅ PostgreSQL
* ✅ MySQL
* ✅ Databricks
* ✅ Fabric - Warehouse

## ✨ Key Features

1. **Dynamic Schema Inference**: Automatically detects and maps the schema from Business Central API responses
2. **Pagination Support**: Handles paginated responses from the API to fetch complete datasets
3. **Data Type Conversion**: Preprocesses data to ensure correct data types for analytical use
4. **Secure Authentication**: Uses Azure Key Vault for secure credential storage
5. **Error Handling**: Robust error handling to maintain data integrity

## ⚠️ Limitations:

1. **Rate Limiting**: Business Central API may enforce rate limits that restrict the frequency of data requests
2. **Data Volume**: Very large datasets may require additional optimization for efficient processing
3. **API Dependencies**: Any changes to the Business Central API structure might require connector updates
4. **Authentication Timing**: Access tokens have a limited lifetime and must be refreshed accordingly
5. **Connection Requirements**: Requires proper network connectivity to both Business Central API and Azure services

## 🧪 Usage Example

```bash
# Run the connector with default configuration
python BC_Tables.py
```

## 🧯 Error Handling

The connector includes basic error handling. You may want to enhance it with:

* Logging to a centralized log repository
* Alerting mechanisms for critical failures
* Retry logic for transient errors
* Transaction management for database operations

### 🚀 **Ready to Deploy?**

Follow the setup guide, configure credentials, and start ingesting Business Central data into Azure Synapse seamlessly!

# **References**
* https://learn.microsoft.com/en-us/dynamics365/business-central/dev-itpro/api-reference/v2.0/
