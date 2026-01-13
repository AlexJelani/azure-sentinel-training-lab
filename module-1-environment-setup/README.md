# Module 1: Setting up the Environment

## Overview
This module covers the initial setup and configuration of the Azure Sentinel training environment.

## Source Reference
[Module 1 - Setting up the environment](https://github.com/Azure/Azure-Sentinel/blob/master/Solutions/Training/Azure-Sentinel-Training-Lab/Modules/Module-1-Setting-up-the-environment.md)

## Prerequisites

### Azure Subscription Requirements
- Active Azure subscription with Owner or Contributor permissions
- Sufficient quota for Log Analytics workspace
- Access to create resource groups and deploy resources

### Required Permissions
- Microsoft Sentinel Contributor
- Log Analytics Contributor
- Security Reader (minimum)

## Lab Environment Setup

### Step 1: Resource Group Creation
```bash
# Create resource group for the training lab
az group create --name rg-sentinel-training --location eastus
```

### Step 2: Log Analytics Workspace
- Deploy Log Analytics workspace
- Configure retention settings
- Set up data export (if needed)

### Step 3: Microsoft Sentinel Deployment
- Enable Microsoft Sentinel on the workspace
- Configure initial settings
- Verify deployment

## Infrastructure as Code

### Terraform Configuration
```hcl
# Resource group
resource "azurerm_resource_group" "sentinel_training" {
  name     = "rg-sentinel-training"
  location = "East US"
}

# Log Analytics workspace
resource "azurerm_log_analytics_workspace" "training_workspace" {
  name                = "law-sentinel-training"
  location            = azurerm_resource_group.sentinel_training.location
  resource_group_name = azurerm_resource_group.sentinel_training.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

# Microsoft Sentinel
resource "azurerm_sentinel_log_analytics_workspace_onboarding" "training_sentinel" {
  workspace_id = azurerm_log_analytics_workspace.training_workspace.id
}
```

## Validation Steps

1. **Workspace Verification**
   - Confirm Log Analytics workspace is active
   - Verify data retention settings
   - Check workspace permissions

2. **Sentinel Activation**
   - Navigate to Microsoft Sentinel in Azure portal
   - Confirm workspace appears in Sentinel
   - Verify initial dashboards load

3. **Access Control**
   - Test user permissions
   - Verify role assignments
   - Confirm security settings

## Next Steps
- Proceed to Module 2: Data Connectors
- Review the official Microsoft documentation
- Bookmark the Sentinel workspace URL

## Troubleshooting

### Common Issues
- **Insufficient Permissions**: Ensure proper RBAC roles
- **Quota Limits**: Check subscription limits for Log Analytics
- **Region Availability**: Verify Sentinel is available in selected region

### Support Resources
- [Microsoft Sentinel Documentation](https://docs.microsoft.com/azure/sentinel/)
- [Azure Support](https://azure.microsoft.com/support/)
- [Community Forums](https://techcommunity.microsoft.com/t5/microsoft-sentinel/ct-p/MicrosoftSentinel)