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
resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "${var.cluster_name}-dns"

  # Use Managed Identity
  identity {
    type = "SystemAssigned"
  }

  # Minimum node pool definition
  default_node_pool {
    name       = var.node_pool_name
    node_count = var.node_count
    vm_size    = var.node_vm_size
  }

  # Basic RBAC
  role_based_access_control_enabled = true

  tags = var.tags
}
