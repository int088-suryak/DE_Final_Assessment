
---

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

### 🌐 Data Source URL:

* Business Central API: `https://api.businesscentral.dynamics.com/v2.0/{company_id}/Production/ODataV4/Company({company_name})`
* Token URL: `https://login.microsoftonline.com/{company_id}/oauth2/v2.0/token`

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

## 🔁 The connector performs the following steps:

1. Authenticate with Business Central API.
2. Fetch data from configured endpoints.
3. Process and transform the data.
4. Save the data to Azure Synapse in Parquet format.

## 🗂️ Folder Structure

Extracted data is stored in a date-based folder structure:

```
<your_blob_storage_path>/<end_point>/{year}/{month}/{day}/temp/{endpoint}
```

## ⚙️ Configuration

Before execution, update the following values in the script:

### 🌍 **Environment Variables**

```bash
BC_CLIENT_ID='<your_client_id>'
BC_SECRET='<your_client_secret>'
BC_COMPANY_ID='<your_company_id>'
BC_COMPANY_NAME='<your_company_name>'
```

### 🧾 **Script Variables**

```python
server = '<your_synapse_server>'
database = '<your_database>'
username = '<your_username>'
password = '<your_password>'
blob_account = '<your_blob_storage_path>'
source_path = '<your_mapping_file_path>'
```

### 🔐 **Authentication Variables**

```python
kv_name = '<your_keyvault_name>'
secret_name = '<your_secret_name>'
linked_service_name = '<your_linked_service_name>'
```

## 🛠️ Template Customization

This code is provided as a template that you can customize for your specific environment:

1. Replace all placeholder values (indicated by `<placeholder_name>`) with your actual configuration values
2. Verify the path structures for source and output files
3. Update the data preprocessing function if additional field conversions are needed
4. Adjust schema inference logic if needed for your specific Business Central endpoints
5. Add any additional error handling specific to your environment

## 🧯 Error Handling

The connector includes basic error handling. You may want to enhance it with:

* Logging to a centralized log repository
* Alerting mechanisms for critical failures
* Retry logic for transient errors
* Transaction management for database operations

### 🚀 **Ready to Deploy?**

Follow the setup guide, configure credentials, and start ingesting Business Central data into Azure Synapse seamlessly!

---
