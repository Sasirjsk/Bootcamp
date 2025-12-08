resource "azurerm_resource_group" "rg" {
  name     = var.rgname
  location = var.location
}

module "aks" {
  source              = "../../modules/aks"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  cluster_name        = var.cluster_name
  node_pool_name      = var.node_pool_name
}

# OPTIONAL: only if running locally (not in CI)
# resource "local_file" "kubeconfig" {
#   filename = "./kubeconfig"
#   content  = module.aks.kube_config_raw
# }
