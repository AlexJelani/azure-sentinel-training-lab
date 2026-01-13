# Module 1 Environment Setup

## Overview
This Terraform configuration deploys the core Azure Sentinel infrastructure for the Training Lab.

## What's Deployed
- Resource Group (`rg-sentinel-training`)
- Log Analytics Workspace (`law-sentinel-training`)
- Microsoft Sentinel (enabled)
- API Connection for playbooks

## What's NOT Deployed
The **Training Lab Solution** (workbooks, analytics rules, sample data) must be deployed manually via Azure Portal as per the official Module 1 guide.

## Deployment
```bash
terraform init
terraform apply
```

## Manual Steps Required
1. Deploy Training Lab solution from Azure Marketplace
2. Authorize API connections for playbooks
3. Follow official Module 1 exercises

## Architecture
- **Terraform**: Core infrastructure (IaC)
- **Manual**: Training content (marketplace solution)
- **Hybrid**: Best of both approaches

## Outputs
- `sentinel_url`: Direct link to Sentinel workspace
- `workspace_id`: Log Analytics workspace resource ID
- `resource_group_name`: Resource group name
- `workspace_name`: Workspace name

## Cost
~$0 during 31-day Sentinel trial period