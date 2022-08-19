output "VNetworkName" {
  value = azurerm_virtual_network.vnet.name
}
output "VNetAddressSpace" {
  value = azurerm_virtual_network.vnet.address_space
}
output "Subnet1Name" {
  value = azurerm_subnet.subnet1.name
}
output "Subnet2Name" {
  value = azurerm_subnet.subnet2.name
}
output "Subnet1_id" {
  value = azurerm_subnet.subnet1.id
}
output "Subnet2_id" {
  value = azurerm_subnet.subnet2.id
}
output "Subnet1AddressSpace" {
  value = azurerm_subnet.subnet1.address_prefixes
}
output "Subnet2AddressSpace" {
  value = azurerm_subnet.subnet2.address_prefixes
}
output "SecurityGroup1" {
  value = azurerm_network_security_group.secgroup1.name
}
output "SecurityGroup2" {
  value = azurerm_network_security_group.secgroup2.name
}