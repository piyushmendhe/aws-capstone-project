# AWS Capstone Project – ETL Data Pipeline with Terraform

This project is a fully automated **ETL Data Pipeline on AWS**, built using **Terraform** for Infrastructure-as-Code. It demonstrates how to ingest, transform, and report on e-commerce data using modern cloud-native tools.

---

## 🚀 Project Overview
The pipeline is designed to:
1. **Ingest Data** – Data is uploaded to an S3 bucket.  
2. **Trigger Processing** – An AWS Lambda function is invoked automatically.  
3. **Orchestrate Workflow** – The Lambda triggers an AWS Step Function to coordinate tasks.  
4. **Transform Data** – AWS Glue performs cleaning, joins, and transformations.  
5. **Catalog & Query** – A Glue Crawler updates the Data Catalog, enabling queries in Athena.  
6. **Generate Reports** – Lambda functions create summary reports (by category, by payment method, counts) and store them back in S3.  

This project highlights **event-driven architecture, ETL orchestration, serverless compute, and Infrastructure-as-Code**.

---

## 🏗️ Architecture
- **AWS S3** – Data lake storage for raw and processed data.  
- **AWS Lambda** – Custom ETL/reporting functions written in Python.  
- **AWS Glue** – Transformation jobs for scalable data processing.  
- **AWS Step Functions** – Orchestration of ETL workflows.  
- **AWS Glue Crawler** – Automated schema discovery for Athena queries.  
- **Athena** – SQL-based querying on curated datasets.  
- **IAM** – Fine-grained access control.  
- **Terraform** – End-to-end infrastructure automation.

---

## 📂 Repository Structure
