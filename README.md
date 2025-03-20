# Welcome to the Financial System Project. 
This system provides a robust platform for financial operations, including secure payment processing, account management, and financial data analysis. 
The project is built using a React frontend, a set of Node.js microservices for backend processing, and is deployed using Kubernetes on Google Cloud Platform (GCP).


![image](https://github.com/user-attachments/assets/d4b60792-b878-4f10-bf8e-40f25bb4f7e3)


# Build and Run the Front-end Application
## Installation
cd frontend
 npm install or Yarn install
 
 npm test or Yarn install
 
 npm run build or Yarn buid
 
 npm start or yarn start

# Build and Run the Microservices
## Backend (Microservices)
Navigate to the respective microservice directory

cd backends/account-service

npm install or yarn install

npm run build or yarn build

npm start

Repeat the above steps for bill-payment-service and account-process-service.

# Infrastructure Setup with Terraform
Terraform is used to provision GCP infrastructure, including Kubernetes clusters for dev, test, and production environments.

## Prerequisites

Install Terraform: https://developer.hashicorp.com/terraform/tutorials

Authenticate with GCP using gcloud auth login.

Navigate to the Terraform directory:
cd IaaC/finance-system-gcp-infra

terraform init

terraform plan -var-file=dev.tfvars

terraform apply -var-file=dev.tfvars

# Kustomize 
Kustomize is a standalone tool that customizes Kubernetes configuration YAMLs, separating configuration from code. It allows you to create variations of your base Kubernetes configurations without modifying the original YAML files. By overlaying patches and modifications, Kustomize simplifies the management of multiple environments (development, staging, production) or variations of your application, promoting reusability and reducing duplication. It integrates seamlessly with kubectl, making it a powerful and convenient way to manage complex Kubernetes deployments

![image](https://github.com/user-attachments/assets/b145afd5-aeb0-4f6f-9a46-7792347a8755)

Each overlay contains a kustomization.yaml that references the base manifests and applies environment-specific configurations.

 kustomize build command  can be used to build different environment.

