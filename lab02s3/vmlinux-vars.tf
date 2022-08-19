variable "linux_name"{
    default = "lab02s3-db1-u-vm1"
}
variable "linux_size"{
    default = "Standard_B1s"
}
variable "adminuser"{
    default = "ann-n01517411"
}
variable "adminpwd"{
    default = "Admin123"
}
variable "linux_os_disk"{
   type = map(string)
   default = {
       lod_os_account_type = "Premium_LRS"
       lod_disk_size       = "32"
       lod_caching         = "ReadWrite"
   }
}
variable "linux_os_info"{
    type = map(string)
    default = {
       loi_os_publisher = "Canonical"
       loi_offer        = "UbuntuServer"
       loi_sku          = 19.04
       loi_version      = "latest"  
   }
}