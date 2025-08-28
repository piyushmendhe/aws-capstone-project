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

aws-capstone-project
│ .gitignore
│ .terraform.lock.hcl
│ backend.tf
│ main.tf
│ outputs.tf
│ README.md
│ variables.tf
│
├── .github
│ └── workflows
│ └── terraform.yml # GitHub Actions workflow for CI/CD
│
└── modules
├── crawler # Glue Crawler setup
│ └── main.tf
├── glue # Glue Job definitions
│ └── main.tf
├── iam # IAM Roles & Policies
│ └── main.tf
├── lambda # Python Lambda functions + Terraform
│ ├── by_payment_methods_lambda.py
│ ├── categories_report.py
│ ├── counts_report.py
│ ├── Trigger_Step_Function.py
│ └── main.tf
├── s3 # S3 bucket setup
│ └── main.tf
└── step_function # Step Function workflow
└── main.tf

---

## 📊 Workflow
1. A new file is uploaded to **S3**.  
2. The upload triggers a **Lambda function**.  
3. Lambda calls the **Step Function**, which orchestrates the pipeline.  
4. **Glue Crawlers** update the Data Catalog.  
5. **Glue Jobs** transform raw data into structured tables.  
6. **Athena** queries generate insights.  
7. Lambda functions prepare and store reports.

---

## ✅ Features
- Fully automated, event-driven pipeline.
- Modular Terraform design for reusability.
- Secure IAM roles and least-privilege access.
- CI/CD pipeline for Terraform deployment.
- Python-based reporting with aggregation (e.g., by category, by payment method).

---

## 📦 Deployment
### Prerequisites
- Terraform >= 1.3  
- AWS CLI configured with appropriate credentials  
- Python 3.11  

## Steps
```bash
# Clone the repository
git clone https://github.com/piyushmendhe/aws-capstone-project.git
cd aws-capstone-project

# Initialize Terraform
terraform init

# Review the plan
terraform plan

# Deploy infrastructure
terraform apply
```

## 📈 Example Reports

Category Report: Aggregates sales by product category.

Payment Method Report: Counts and trends of payment methods.

Counts Report: Summarized transactions and customer counts.

All reports are stored back into S3 for downstream analytics.

## 🎯 What This Project Demonstrates

Expertise in Data Engineering with AWS.

Ability to design modular, production-grade pipelines.

Strong skills in Terraform, Python, and Cloud ETL workflows.

Hands-on experience with event-driven architectures.

## 🤝 Contributing

Contributions are welcome! Please fork the repo and submit a pull request.


