variable "resource_group_name" {
  description = "Azure resource group name"
  type        = string
  default     = "rg-dev-aks"
}

variable "env" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "eastus"
}

variable "resource_group_name" {
  description = "Azure resource group name"
  type        = string
}
variable "kubernetes_version" {
  description = "AKS Kubernetes version"
  type        = string
  default     = "1.27"
}

variable "aks_name" {
  description = "AKS cluster name"
  type        = string
  default     = "dev-aks"
}
