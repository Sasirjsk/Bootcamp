terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "tfstatesacct0t123"
    container_name       = "tfstate"
    key                  = "aks/staging.tfstate"
  }
}
