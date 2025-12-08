terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "tfstatesacct0t1234"
    container_name       = "tfstate"
    key                  = "aks/dev.tfstate"
  }
}
