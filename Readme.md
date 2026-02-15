Production-Ready AKS Infrastructure with Terraform & CI/CD

This repository provisions a production-grade Azure Kubernetes Service (AKS) cluster using Terraform, with security-first design and GitHub Actions CI/CD integration.

The infrastructure is fully defined as code and executed through a controlled pipeline — no manual Terraform runs.

🏗️ Architecture Overview

The infrastructure includes:

Azure Resource Group

Virtual Network (VNet)

Subnets

AKS Cluster (VMSS-based node pool)

User Assigned Managed Identity

Scoped Role Assignments (Least Privilege)

NGINX Ingress Controller (Helm)

Remote State Backend (HCP Terraform)

GitHub Actions CI/CD Pipeline

🔐 Security Design

This setup intentionally follows production-oriented practices:

✅ User-assigned managed identity

✅ Principle of least privilege (Network Contributor scoped to RG)

✅ No hardcoded credentials

✅ Azure authentication via GitHub Secrets

✅ Pipeline-controlled infrastructure changes

✅ Clear separation between plan and apply

Infrastructure does not depend on local machines.

⚙️ CI/CD Workflow (GitHub Actions)

Every push to main triggers:

terraform init

terraform plan

Manual workflow dispatch allows:

plan

apply

destroy

Example pipeline execution:

- name: Terraform Plan
  run: terraform plan -var-file="terraform.tfvars"


Apply only runs when explicitly triggered.

 Repository Structure
.
├── .github/workflows/
│   └── cicd.yml
├── tf-value/
│   ├── 00_backend.tf
│   ├── 000_local.tf
│   ├── 0_provider.tf
│   ├── 1_resource.tf
│   ├── 2_variable.tf
│   ├── 3_vnet.tf
│   ├── 4_subnet.tf
│   ├── 5_aks.tf
│   ├── 6_node_group.tf
│   ├── 7_nginx_controller.tf
│   ├── 8_certmanager.tf
│   └── main.tf
└── terraform.tfvars

 Networking

Custom VNet

Dedicated subnet for AKS

Azure CNI networking

Service CIDR configured

Controlled NSG configuration

 AKS Configuration

VM Scale Set node pool

Kubernetes version controlled via variables

Azure network plugin

Explicit DNS service IP

Managed identity attached to cluster

🔄 Remote Backend (HCP Terraform)

Remote state is stored securely using:

HCP Terraform backend

API token stored as GitHub Secret

No local state files committed

 Why This Matters

Infrastructure is:

Repeatable

Version-controlled

Auditable

Secure by design

Pipeline-driven

This is how modern cloud environments are expected to be managed.

 How to Run Locally (Optional)
terraform init
terraform plan -var-file="terraform.tfvars"
terraform apply -auto-approve

 Future Improvements

Workload-level RBAC policies

Pod Security Standards

External DNS integration

TLS automation

Observability stack (Prometheus + Grafana)

 Key Takeaway

CI/CD is not about speed.

It is about control, safety, and trust in infrastructure changes.