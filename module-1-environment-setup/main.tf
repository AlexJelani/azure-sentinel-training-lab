terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# Resource group for the training lab
resource "azurerm_resource_group" "sentinel_training" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

# Log Analytics workspace
resource "azurerm_log_analytics_workspace" "training_workspace" {
  name                = var.workspace_name
  location            = azurerm_resource_group.sentinel_training.location
  resource_group_name = azurerm_resource_group.sentinel_training.name
  sku                 = "PerGB2018"
  retention_in_days   = var.retention_days
  tags                = var.tags
}

# Microsoft Sentinel onboarding
resource "azurerm_sentinel_log_analytics_workspace_onboarding" "training_sentinel" {
  workspace_id = azurerm_log_analytics_workspace.training_workspace.id
}

# Deploy Training Lab solution template
resource "azurerm_resource_group_template_deployment" "training_lab_solution" {
  name                = "sentinel-training-lab-solution"
  resource_group_name = azurerm_resource_group.sentinel_training.name
  deployment_mode     = "Incremental"
  
  template_content = file("${path.module}/training-lab-template.json")
  
  parameters_content = jsonencode({
    workspace-name = {
      value = azurerm_log_analytics_workspace.training_workspace.name
    }
    workspace-id = {
      value = azurerm_log_analytics_workspace.training_workspace.id
    }
  })
  
  depends_on = [azurerm_sentinel_log_analytics_workspace_onboarding.training_sentinel]
}

# API Connection for playbook
resource "azurerm_api_connection" "sentinel_connection" {
  name                = "azuresentinel-Get-GeoFromIpAndTagIncident"
  resource_group_name = azurerm_resource_group.sentinel_training.name
  managed_api_id      = "/subscriptions/${data.azurerm_client_config.current.subscription_id}/providers/Microsoft.Web/locations/${var.location}/managedApis/azuresentinel"
  display_name        = "Azure Sentinel Connection"
  tags                = var.tags
}

data "azurerm_client_config" "current" {}