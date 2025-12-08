variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "cluster_name" {
  type = string
}

variable "node_pool_name" {
  type    = string
  default = "nodepool1"
}

variable "node_count" {
  type    = number
  default = 1
}

variable "node_vm_size" {
  type    = string
  default = "Standard_D4ds_v5"
}

variable "tags" {
  type    = map(string)
  default = {}
}
