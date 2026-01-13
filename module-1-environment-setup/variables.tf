variable "resource_group_name" {
  description = "Name of the resource group for the training lab"
  type        = string
  default     = "rg-sentinel-training"
}

variable "location" {
  description = "Azure region for the resources"
  type        = string
  default     = "East US"
}

variable "workspace_name" {
  description = "Name of the Log Analytics workspace"
  type        = string
  default     = "law-sentinel-training"
}

variable "retention_days" {
  description = "Log retention period in days"
  type        = number
  default     = 30
}

variable "sentinel_solution_name" {
  description = "Name of the Sentinel solution"
  type        = string
  default     = "SecurityInsights"
}

variable "vm_admin_username" {
  description = "Admin username for training VMs"
  type        = string
  default     = "azureuser"
}

variable "vm_admin_password" {
  description = "Admin password for training VMs"
  type        = string
  sensitive   = true
}

variable "enable_data_connectors" {
  description = "Enable sample data connectors for training"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default = {
    Environment = "Training"
    Project     = "Azure-Sentinel-Lab"
    Owner       = "Security-Team"
  }
}