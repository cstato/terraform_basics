resource "azurerm_public_ip" "bastion_pip" {
  name                = "learning-bastion-pip"
  location            = azurerm_resource_group.vm_rg.location
  resource_group_name = azurerm_resource_group.vm_rg.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

data "azurerm_subnet" "data_azureBastionSubnet" {
  depends_on = [
    azurerm_virtual_network.vnet
  ]
  name                 = "AzureBastionSubnet"
  virtual_network_name = "learning-vnet-network"
  resource_group_name  = "learning-vnt-rg"
}

resource "azurerm_bastion_host" "bastion_host" {
  name                = "learning-bastion-host"
  location            = azurerm_resource_group.vm_rg.location
  resource_group_name = azurerm_resource_group.vm_rg.name

  ip_configuration {
    name                 = "configuration"
    subnet_id            = data.azurerm_subnet.data_azureBastionSubnet.id
    public_ip_address_id = azurerm_public_ip.bastion_pip.id
  }
}