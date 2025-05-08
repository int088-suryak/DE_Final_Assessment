# Sage Intacct Data Source Ingestion Connector - README

## Overview

This document provides detailed information about the Sage Intacct data source ingestion connector, including the required credentials, supported data points for ingestion, and any known limitations or considerations. 📚

## Prerequisites

Before using this connector, ensure the following requirements are met:

### Required Credentials:

* **API Credentials** 🛠️: A valid Sage Intacct API key and sender ID.
* **User Credentials** 👤: Sage Intacct username and password with appropriate permissions.
* **Company ID** 🆔: The unique identifier for your Sage Intacct account.
* **OAuth Token** 🔑: If using OAuth authentication, an access token with the appropriate scope.
* **Other Required Credentials** 💼: Any other specific credentials, such as access keys or client secrets.

### Data Source URL:

Provide the Sage Intacct API base URL:
API Endpoint: [https://api.intacct.com/ia/xml/xmlgw.phtml](https://api.intacct.com/ia/xml/xmlgw.phtml) 🌐

## Data Points for Ingestion

The following data points are supported by the connector:

1. **Customers** 👥: Customer account details and contact information.
2. **Vendors** 🏢: Supplier and vendor information.
3. **General Ledger** 📊: Journal entries, transactions, and account balances.
4. **Accounts Payable** 💳: Invoice and payment tracking for vendors.
5. **Accounts Receivable** 💰: Customer invoices, payments, and aging reports.
6. **Purchase Orders** 🛒: Procurement records and approvals.
7. **Sales Orders** 🧾: Sales transactions and order processing.
8. **Employee Expenses** 💼: Expense reports and reimbursements.
9. **Projects** 📈: Project-related financials and tracking.
10. **Inventory** 📦: Stock levels and inventory movement tracking.

Note: The available data points may vary based on the configuration and permissions granted to the connector.

## Supported tools

* ✅ **ADF (Azure Data Factory)**
* ✅ **Fabric**

## Supported Destination

### Files

* ✅ **Parquet** 🗂️

### Lakehouse

* ✅ **Fabric - Lakehouse** 🌊

### **Data Warehouse / Database**

* ✅ **Fabric - Warehouse** 🏢

## Limitations:

1. **API Rate Limiting** ⚠️: Sage Intacct imposes API rate limits, which may restrict the frequency of data requests. Be mindful of these limits to avoid failures.
2. **Pagination Handling** 🔢: Large datasets require pagination when making API calls.
3. **Data Sync Delays** ⏳: Sage Intacct data may not always be updated in real time.
4. **Data Type Constraints** 🧑‍💻: Some fields, especially custom properties, may have inconsistent data types.
5. **Time Zone Handling** 🕰️: Timestamps in Sage Intacct are stored in UTC and may require conversion.
6. **Schema Changes** 🔄: Any modifications to Sage Intacct object schemas may require updates to the ingestion pipeline.
