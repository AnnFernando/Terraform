output "VM_Hostnames" {
  value = azurerm_linux_virtual_machine.linux_vm[*].computer_name
}
output "VM_DNS_Labels" {
  value = azurerm_public_ip.public_ip[*].fqdn
}
output "Private_IP_Addresses" {
  value = azurerm_linux_virtual_machine.linux_vm[*].private_ip_address
}
output "Public_IP_Addresses" {
  value = azurerm_linux_virtual_machine.linux_vm[*].public_ip_address
}
output "Linux_Availability_Set" {
  value = azurerm_availability_set.avset.name
}