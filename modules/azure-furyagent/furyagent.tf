resource "random_string" "main" {
  length  = 6
  special = false
  upper   = false

  keepers = {
    resource_group = data.azurerm_resource_group.main.name
  }
}

resource "azurerm_storage_account" "main" {
  name                      = var.furyagent_storage_account_name
  resource_group_name       = data.azurerm_resource_group.main.name
  location                  = data.azurerm_resource_group.main.location
  account_kind              = "BlobStorage"
  account_tier              = "Standard"
  account_replication_type  = "GRS"
  access_tier               = "Hot"
  enable_https_traffic_only = true

  tags = merge(
    var.tags,
    {
      Name = var.furyagent_storage_account_name
    }
  )
}

resource "azurerm_storage_container" "main" {
  name                  = "furyagent"
  storage_account_name  = azurerm_storage_account.main.name
  container_access_type = "private"
}
