resource "azurerm_resource_group" "vnet_rg" {
  name     = var.vnet_rg_name
  location = var.vnet_rg_location
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = azurerm_resource_group.vnet_rg.location
  resource_group_name = azurerm_resource_group.vnet_rg.name
  address_space       = var.vnet_address_space

  subnet {
    name           = var.subnet1_name
    address_prefix = var.subnet1_address_prefix
  }

  subnet {
    name           = var.subnet2_name
    address_prefix = var.subnet2_address_prefix
  }

  tags = var.vnet_tags
}