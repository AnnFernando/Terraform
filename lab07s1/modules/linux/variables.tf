variable "resource_group" {
  default = "linux-rg"
}
variable "rgroupLinux" {
  default = "linux-rg"
}
variable "location" {
  default = "australia central"
}
variable "linux_name" {
  default = "lab04s1-db1-u-vm"
}
variable "linux_size" {
  default = "Standard_B1s"
}
variable "adminuser" {
  default = "annfernando"
}
variable "adminpwd" {
  default = "Admin123"
}
variable "linux_os_disk" {
  type = map(string)
  default = {
    lod_os_account_type = "Premium_LRS"
    lod_disk_size       = "32"
    lod_caching         = "ReadWrite"
  }
}
variable "linux_os_info" {
  type = map(string)
  default = {
    loi_os_publisher = "OpenLogic"
    loi_offer        = "CentOS"
    loi_sku          = "8_2"
    loi_version      = "latest"
  }
}

locals {
  common_tags = {
    Name         = "Terraform Class"
    Project      = "Learning"
    ContactEmail = "annrukshini@gmail.com"
    Environment  = "Lab"
  }
}
variable "linux_avs" {
  default = "linux_avs"
}
variable "nb_count" {
  default = 2
}
variable "priv_key" {
  default = "/home/annfernando/.ssh/id_rsa"
}
variable "pub_key" {
  default = "/home/annfernando/.ssh/id_rsa.pub"
}
variable "subnet1_id" {
  default = ""
}
