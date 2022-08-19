output "RGroupLinux" {
  value = module.resource_group.rgroupLinux.name
}
output "RGroupWindows" {
  value = module.resource_group.rgroupWindows.name
}
output "RGroupNetworking" {
  value = module.resource_group.rgroupNetworking.name
}
output "VNetworkName" {
  value =  module.network.VNetworkName
}
output "VNetAddressSpace" {
  value = module.network.VNetAddressSpace
}
output "Subnet1_Name" {
  value = module.network.Subnet1Name
}
output "Subnet2_Name" {
  value = module.network.Subnet2Name
}
output "Subnet1_AddressSpace" {
  value = module.network.Subnet1AddressSpace
}
output "Subnet2_AddressSpace" {
  value = module.network.Subnet2AddressSpace
}
output  "SecurityGroup1" {
    value = module.network.SecurityGroup1
}
output  "SecurityGroup2" {
    value = module.network.SecurityGroup2
}
output "Linux-VM_Hostnames" {
  value = module.linux.VM_Hostnames
}
output "Linux-VM_DNS_Labels" {
  value = module.linux.VM_DNS_Labels
}
output "Linux-Private_IP_Addresses" {
  value = module.linux.Private_IP_Addresses
}
output "Linux-Public_IP_Addresses" {
  value = module.linux.Public_IP_Addresses
}
output "Linux_Availability_Set" {
  value = module.linux.Linux_Availability_Set
}
output "Windows-VM_Hostnames"{
  value = module.windows.Windows-VM_Hostnames
}
output "Windows-VM_DNS_Labels"{
  value = module.windows.Windows-VM_DNS_Labels
}
output "Windows-Private_IP_Addresses"{
  value = module.windows.Windows-VM_DNS_Labels
}
output "Windows-Public_IP_Addresses"{
  value = module.windows.Windows-Public_IP_Addresses
}
output "Windows_Availability_Set"{
  value = module.windows.Windows_Availability_Set
}