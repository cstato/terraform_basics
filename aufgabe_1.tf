/*
resource "azurerm_resource_group" "vnet_rg" {
  name     = "learning-vnt-rg"
  location = "westeurope"
}

resource "azurerm_virtual_network" "vnet" {
  name                = "learning-vnet-network"
  location            = azurerm_resource_group.vnet_rg.location
  resource_group_name = azurerm_resource_group.vnet_rg.name
  address_space       = ["10.0.0.0/16"]

  subnet {
    name           = "subnet1"
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name           = "AzureBastionSubnet"
    address_prefix = "10.0.2.0/24"
  }

  tags = {
    environment = "Dev"
  }
}
*/