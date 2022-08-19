resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet
  location            = var.location
  resource_group_name = var.rgroupNetworking
  address_space       = var.vnet_space
  depends_on          = [var.resource_group]
}
resource "azurerm_subnet" "subnet1" {
  name                 = var.subnet1
  resource_group_name  = var.rgroupNetworking
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.subnet1_space
  depends_on           = [var.resource_group, azurerm_virtual_network.vnet]
}
resource "azurerm_subnet" "subnet2" {
  name                 = var.subnet2
  resource_group_name  = var.rgroupNetworking
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.subnet2_space
  depends_on           = [var.resource_group, azurerm_virtual_network.vnet]
}
resource "azurerm_network_security_group" "secgroup1" {
  name                = var.secgroup1
  location            = var.location
  resource_group_name = var.rgroupNetworking
  depends_on          = [azurerm_virtual_network.vnet]

  security_rule {
    name                       = "rule1"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
    security_rule {
    name                       = "rule2"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
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
  resource_group_name = var.rgroupNetworking
  depends_on          = [var.resource_group]

  security_rule {
    name                       = "rule1"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "rule2"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "5985"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
resource "azurerm_subnet_network_security_group_association" "sgassociation2" {
  subnet_id                 = azurerm_subnet.subnet2.id
  network_security_group_id = azurerm_network_security_group.secgroup2.id
}
