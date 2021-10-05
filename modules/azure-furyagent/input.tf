variable "furyagent_storage_account_name" {
  description = "name of storage account"
  type        = string
}

variable "resource_group_name" {
  description = "resource group to use"
  type        = string
}

data "azurerm_resource_group" "main" {
  name = var.resource_group_name
}

variable "tags" {
  default = {}
}