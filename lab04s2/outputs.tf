output "VMHostname"{
    value = values(azurerm_windows_virtual_machine.windows_vm)[*].computer_name
}
output "VMDNSlabel"{
    value = values(azurerm_public_ip.public_ip)[*].fqdn
}
output "PrivateIPAddress"{
    value = values(azurerm_windows_virtual_machine.windows_vm)[*].private_ip_address
}
output "PublicIPAddress"{
    value = values(azurerm_windows_virtual_machine.windows_vm)[*].public_ip_address
}
output "VNetworkName"{
    value = azurerm_virtual_network.vnet1.name
}
output "VNetAddressSpace"{
    value = azurerm_virtual_network.vnet1.address_space
}
output "Subnet1Name"{
    value = azurerm_subnet.subnet1.name
}
output "Subnet2Name"{
    value = azurerm_subnet.subnet2.name
}
output "Subnet1AddressPrefixes"{
    value = azurerm_subnet.subnet1.address_prefixes
}
output "Subnet2AddressPrefixes"{
    value = azurerm_subnet.subnet2.address_prefixes
}
output "WindowsAvailabilitySet"{
    value = azurerm_availability_set.avset.name
}
