variable "resource_group"{
    default = "network-rg"
}
variable "rgroupNetworking"{
    default = "network-rg"
}
variable "location"{
    default = "australia central"
}
variable "vnet" {
  default = "network-vnet"
}
variable "vnet_space" {
  default = ["10.0.0.0/16"]
}
variable "subnet1" {
  default = "network-subnet1"
}
variable "subnet2" {
  default = "network-subnet2"
}
variable "subnet1_space" {
  default = ["10.0.1.0/24"]
}
variable "subnet2_space" {
  default = ["10.0.2.0/24"]
}
variable "secgroup1" {
  default = "network-nsg1"
}
variable "secgroup2" {
  default = "network-nsg2"
}

