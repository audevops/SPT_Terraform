resource "azurerm_virtual_network" "NanKum_Vnet" {
  name                = "NanKum_Vnet"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "NanKum_Sub" {
  name                 = "NanKum_Sub"
  resource_group_name  = var.resource_group_name
  virtual_network_name = "NanKum_Vnet"
  address_prefixes     = ["10.0.1.0/24"]
  depends_on = [
    azurerm_virtual_network.NanKum_Vnet
  ]
}

resource "azurerm_public_ip" "NanKum_pub_IP_1" {
  name                = "NANKUM-public-ip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Dynamic"
}


resource "azurerm_network_interface" "NANKUM-nic-1" {
  name                = "NANKUM-nic"
  location            = var.location
  resource_group_name = var.resource_group_name
  ip_configuration {
    name                          = "NANKUM-nic-configuration"
    subnet_id                     = azurerm_subnet.NanKum_Sub.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.NanKum_pub_IP_1.id
  }
}

resource "azurerm_virtual_machine" "NanKum_VM" {
  name                = "NANKUMVM1"
  location            = var.location
  resource_group_name = var.resource_group_name
  vm_size             = "Standard_D2s_v3"
  /*admin_username      = "adminuser"*/
  network_interface_ids = [
    azurerm_network_interface.NANKUM-nic-1.id,
  ]
  storage_os_disk {
    name              = "NANKUMdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts-gen2"
    version   = "latest"
  }
  os_profile {
    computer_name  = "NANKUMVM1"
    admin_username = "testadmin"
    admin_password = "Password1234!"
    custom_data = base64encode(<<EOF
#!/bin/bash
sudo apt-get update
sudo apt-get install -y apache2
sudo service apache2 start
EOF
    )
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
}