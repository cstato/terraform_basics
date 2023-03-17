resource "azurerm_resource_group" "vm_rg" {
  name     = "learning-vm-rg"
  location = "westeurope"
}

data "azurerm_subnet" "data_subnet1" {
  name                 = "subnet1"
  virtual_network_name = "learning-vnet-network"
  resource_group_name  = "learning-vnt-rg"
}

resource "azurerm_network_interface" "vm_nic" {
  name                = "nic-1"
  location            = azurerm_resource_group.vm_rg.location
  resource_group_name = azurerm_resource_group.vm_rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.data_subnet1.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "vm" {
  name                = "vm-1"
  resource_group_name = azurerm_resource_group.vm_rg.name
  location            = azurerm_resource_group.vm_rg.location
  size                = "Standard_F2"
  admin_username      = "Azureadmin"
  admin_password      = "Azureadmin1"
  network_interface_ids = [
    azurerm_network_interface.vm_nic.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }

  identity {
    type         = "SystemAssigned"
    identity_ids = []
  }
}