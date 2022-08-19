variable "windows_name"{
    default = {
        lab-web-w-vm1 = "Standard_B1s"
        lab-web-w-vm2 = "Standard_B1ms"
    }
}
variable "adminuser"{
    default = "ann-n01517411"
}
variable "adminpwd"{
    default = "Admin123"
}
variable "windows_os_disk"{
   type = map(string)
   default = {
       lod_os_account_type = "StandardSSD_LRS"
       lod_disk_size       = "128"
       lod_caching         = "ReadWrite"
   }
}
variable "windows_os_info"{
    type = map(string)
    default = {
       loi_os_publisher = "MicrosoftWindowsServer"
       loi_offer        = "WindowsServer"
       loi_sku          = "2016-Datacenter"
       loi_version      = "latest"  
   }
}
locals{
    common_tags = {
        Name = "Terraform Class"
        Project = "Learning"
        ContactEmail = "annrukshini@gmail.com"
        Environment = "Lab"
    }
}
variable "windows_avs"{
    default = "windows_avs"
}
