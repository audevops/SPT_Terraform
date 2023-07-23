resource "azurerm_network_security_group" "NanKUM_NSG" {
  name                = "NANKUMNSG"
  location            = var.location
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = "ALLOPEN"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
resource "azurerm_subnet_network_security_group_association" "SUB_NSG" {
  subnet_id                 = azurerm_subnet.NanKum_Sub.id
  network_security_group_id = azurerm_network_security_group.NanKUM_NSG.id
}
