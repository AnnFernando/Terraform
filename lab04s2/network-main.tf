resource "azurerm_resource_group" "rgroup1"{
    name        = var.rgroup1
    location    = var.location
}
resource "azurerm_virtual_network" "vnet1"{
    name                = var.vnet1
    location            = var.location
    resource_group_name = var.rgroup1
    address_space       = var.vnet_space
}
resource "azurerm_subnet" "subnet1"{
    name                 = var.subnet1
    resource_group_name  = var.rgroup1
    virtual_network_name = var.vnet1
    address_prefixes     = var.subnet1_prefixes
}
resource "azurerm_subnet" "subnet2"{
    name                 = var.subnet2
    resource_group_name  = var.rgroup1
    virtual_network_name = var.vnet1
    address_prefixes     = var.subnet2_prefixes
}
resource "azurerm_network_security_group" "secgroup1" {
  name                = var.secgroup1
  location            = var.location
  resource_group_name = var.rgroup1

  security_rule {
    name                       = "rule1"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = 22
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
resource "azurerm_subnet_network_security_group_association" "sgassociation1" {
  subnet_id                 = azurerm_subnet.subnet1.id
  network_security_group_id = azurerm_network_security_group.secgroup1.id
}
resource "azurerm_network_security_group" "secgroup2" {
  name                = var.secgroup2
  location            = var.location
  resource_group_name = var.rgroup1

  security_rule {
    name                       = "rule1"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = 3389
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
    security_rule {
    name                       = "rule2"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = 5985
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
resource "azurerm_subnet_network_security_group_association" "sgassociation2" {
  subnet_id                 = azurerm_subnet.subnet2.id
  network_security_group_id = azurerm_network_security_group.secgroup2.id
}
