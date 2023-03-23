/*
resource "azurerm_resource_group" "sa_rg" {
  name     = "learning-sa-rg"
  location = "westeurope"
}

resource "random_id" "sa_random_id" {
  byte_length = 8
}

resource "azurerm_storage_account" "storage_account" {
  name                     = "stoacc${random_id.sa_random_id.hex}"
  resource_group_name      = azurerm_resource_group.sa_rg.name
  location                 = azurerm_resource_group.sa_rg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}
*/