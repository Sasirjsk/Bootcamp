terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.10"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "b75cea1b-f62a-44ce-9a24-30995b4a83a6"
  
}

# ------------------------------------------
# 1. Resource Group for Terraform Backend
# ------------------------------------------
resource "azurerm_resource_group" "tfstate_rg" {
  name     = "tfstate-rg"
  location = "canadacentral"
}

# ------------------------------------------
# 2. Storage Account for Terraform State
# ------------------------------------------
resource "azurerm_storage_account" "tfstate_sa" {
  name                     = "tfstatesacct0t123"  # must be globally unique
  resource_group_name      = azurerm_resource_group.tfstate_rg.name
  location                 = azurerm_resource_group.tfstate_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  blob_properties {
    versioning_enabled = true
    delete_retention_policy {
      days = 7
    }
  }
}

# ------------------------------------------
# 3. Blob Container for Storing TF State Files
# ------------------------------------------
resource "azurerm_storage_container" "tfstate_container" {
  name                  = "tfstate"
   storage_account_id  = azurerm_storage_account.tfstate_sa.id
  container_access_type = "private"
}

# ------------------------------------------
# 4. Outputs for Dev/Staging backend.tf
# ------------------------------------------
output "rg_name" {
  value = azurerm_resource_group.tfstate_rg.name
}

output "storage_account_name" {
  value = azurerm_storage_account.tfstate_sa.name
}

output "container_name" {
  value = azurerm_storage_container.tfstate_container.name
}

output "example_dev_key" {
  value = "aks/dev.tfstate"
}

output "example_staging_key" {
  value = "aks/staging.tfstate"
}
