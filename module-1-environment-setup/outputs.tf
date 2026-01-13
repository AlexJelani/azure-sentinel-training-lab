output "resource_group_name" {
  description = "Name of the created resource group"
  value       = azurerm_resource_group.sentinel_training.name
}

output "workspace_id" {
  description = "ID of the Log Analytics workspace"
  value       = azurerm_log_analytics_workspace.training_workspace.id
}

output "workspace_name" {
  description = "Name of the Log Analytics workspace"
  value       = azurerm_log_analytics_workspace.training_workspace.name
}

output "sentinel_url" {
  description = "URL to access Microsoft Sentinel"
  value       = "https://portal.azure.com/#@/resource${azurerm_log_analytics_workspace.training_workspace.id}/overview"
}