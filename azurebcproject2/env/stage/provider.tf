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