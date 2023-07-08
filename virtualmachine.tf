/*resource "azurerm_virtual_network" "DB_Vnet" {
  name                = var.virtual_network
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "DB_sub" {
  name                 = var.Subnet
  resource_group_name  = "1-955a11d0-playground-sandbox"
  virtual_network_name = "DB_VNET"
  address_prefixes     = ["10.0.0.0/24"]
}

resource "azurerm_public_ip" "DB_pub_IP" {
  name                = var.Public_IP
  location            = var.location
  resource_group_name = "1-955a11d0-playground-sandbox"
  allocation_method   = "Dynamic"
}

resource "azurerm_network_interface" "DB-nic" {
  name                = var.network_interface
  location            = var.location
  resource_group_name = var.resource_group_name
  ip_configuration {
    name                          = var.network_interface
    subnet_id                     = azurerm_subnet.DB_sub.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.DB_pub_IP.id
  }
}

resource "azurerm_linux_virtual_machine" "DB_VM" {
  name                = var.virtual_machine
  location            = var.location
  resource_group_name = var.resource_group_name
  size                = "Standard_DS1_v2"
  admin_username      = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.DB-nic.id,
  ]
  admin_password                  = "Proximus#18"
  disable_password_authentication = false

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }
}*/

/*provider "azurerm" {

  client_id       = "60e570f9-56f6-4052-ab18-36dafd651556"
  client_secret   = "rTA8Q~N2moCbHk6XWr8xoWLc1OBXj4ESi~a5CbJD"
  tenant_id       = "84f1e4ea-8554-43e1-8709-f0b8589ea118"
  subscription_id = "0cfe2870-d256-4119-b0a3-16293ac11bdc"
  features {}
  skip_provider_registration = true
}

/*resource "azurerm_resource_group" "DB_RG" {
  name     = var.resource_group_name
  location = var.location
}*/

resource "azurerm_virtual_network" "DB_Vnet" {
  name                = "DB_Vnet"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "DB_sub" {
  name                 = "DB-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.DB_Vnet.name
  address_prefixes     = ["10.0.0.0/24"]
}

resource "azurerm_public_ip" "DB_pub_IP_1" {
  name                = "DB-public-ip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Dynamic"
}
/*resource "azurerm_public_ip" "DB_pub_IP_2" {
  name                = "DB-public-ip-2"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Dynamic"
}
resource "azurerm_public_ip" "DB_pub_IP_3" {
  name                = "DB-public-ip-3"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Dynamic"
}*/
resource "azurerm_public_ip" "MON_pub_IP_4" {
  name                = "MON-public-ip-4"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Dynamic"
}

resource "azurerm_network_interface" "DB-nic-1" {
  name                = "DB-nic_1"
  location            = var.location
  resource_group_name = var.resource_group_name
  ip_configuration {
    name                          = "DB-nic-configuration"
    subnet_id                     = azurerm_subnet.DB_sub.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.DB_pub_IP_1.id
  }
}

/*resource "azurerm_network_interface" "DB-nic-2" {
  name                = "DB-nic_2"
  location            = var.location
  resource_group_name = var.resource_group_name
  ip_configuration {
    name                          = "DB-nic-configuration"
    subnet_id                     = azurerm_subnet.DB_sub.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.DB_pub_IP_2.id
  }
}
resource "azurerm_network_interface" "DB-nic-3" {
  name                = "DB-nic-3"
  location            = var.location
  resource_group_name = var.resource_group_name
  ip_configuration {
    name                          = "DB-nic-configuration"
    subnet_id                     = azurerm_subnet.DB_sub.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.DB_pub_IP_3.id
  }
}*/
resource "azurerm_network_interface" "MON-nic" {
  name                = "MON-nic"
  location            = var.location
  resource_group_name = var.resource_group_name
  ip_configuration {
    name                          = "MON-nic-configuration"
    subnet_id                     = azurerm_subnet.DB_sub.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.MON_pub_IP_4.id
  }
}
resource "azurerm_linux_virtual_machine" "DB_VM_1" {
  name                = "DBVM1"
  location            = var.location
  resource_group_name = var.resource_group_name
  size                = "Standard_D2s_v3"
  admin_username      = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.DB-nic-1.id,
  ]
  admin_password                  = "Proximus#18"
  disable_password_authentication = false

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }
}
/*resource "azurerm_linux_virtual_machine" "DB_VM_2" {
  name                = "DBVM2"
  location            = var.location
  resource_group_name = var.resource_group_name
  size                = "Standard_D2s_v3"
  admin_username      = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.DB-nic-2.id,
  ]
  admin_password                  = "Proximus#18"
  disable_password_authentication = false

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }
}
resource "azurerm_linux_virtual_machine" "DB_VM_3" {
  name                = "DBVM3"
  location            = var.location
  resource_group_name = var.resource_group_name
  size                = "Standard_D2s_v3"
  admin_username      = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.DB-nic-3.id,
  ]
  admin_password                  = "Proximus#18"
  disable_password_authentication = false

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }
}*/
resource "azurerm_linux_virtual_machine" "MON1" {
  name                = "MON1"
  location            = var.location
  resource_group_name = var.resource_group_name
  size                = "Standard_D2s_v3"
  admin_username      = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.MON-nic.id,
  ]
  admin_password                  = "Proximus#18"
  disable_password_authentication = false

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }
}