# 📡 Business Central Data Ingestion Connector

## 📘 Overview

This connector extracts data from Microsoft Business Central via API, processes it, and stores it in Azure Synapse. The connector handles API authentication, data preprocessing, and manages the data pipeline to ensure consistent data storage and availability for analytics.

### 🌐 Data Source URL:

* Business Central API: `https://api.businesscentral.dynamics.com/v2.0/{company_id}/Production/ODataV4/Company({company_name})`
* Token URL: `https://login.microsoftonline.com/{company_id}/oauth2/v2.0/token`

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
