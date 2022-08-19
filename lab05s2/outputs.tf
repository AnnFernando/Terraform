output "VMHostname" {
  value = azurerm_linux_virtual_machine.linux_vm[*].computer_name
}
output "VMDNSlabel" {
  value = azurerm_public_ip.public_ip[*].fqdn
}
output "PrivateIPAddress" {
  value = azurerm_linux_virtual_machine.linux_vm[*].private_ip_address
}
output "PublicIPAddress" {
  value = azurerm_linux_virtual_machine.linux_vm[*].public_ip_address
}
output "VNetworkName" {
  value = azurerm_virtual_network.vnet1.name
}
output "VNetAddressSpace" {
  value = azurerm_virtual_network.vnet1.address_space
}
output "Subnet1Name" {
  value = azurerm_subnet.subnet1.name
}
output "Subnet2Name" {
  value = azurerm_subnet.subnet2.name
}
output "Subnet1AddressPrefixes" {
  value = azurerm_subnet.subnet1.address_prefixes
}
output "Subnet2AddressPrefixes" {
  value = azurerm_subnet.subnet2.address_prefixes
}
output "LinuxAvailabilitySet" {
  value = azurerm_availability_set.avset.name
}
