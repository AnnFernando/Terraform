resource "azurerm_network_interface" "linux_nic" {
    name                = "${var.linux_name}-nic"
    location            = var.location
    resource_group_name = var.rgroup1

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet1.id
    private_ip_address_allocation = "Dynamic"
  }
}
resource "azurerm_public_ip" "public_ip" {
    name                = "${var.linux_name}-pip"
    resource_group_name = var.rgroup1
    location            = var.location
    allocation_method   = "Dynamic"
    domain_name_label   = "${var.linux_name}-dns"
}
resource "azurerm_linux_virtual_machine" "linux_vm"{
    name = var.linux_name
    resource_group_name = var.rgroup1
    location            = var.location
    size                = var.linux_size
    admin_username      = var.adminuser
    admin_password      = var.adminpwd
    disable_password_authentication = false
    network_interface_ids = [
        azurerm_network_interface.linux_nic.id
    ]

  os_disk{
        name                 = "${var.linux_name}-os-disk"
        caching              = var.linux_os_disk["lod_caching"]
        storage_account_type = var.linux_os_disk["lod_os_account_type"]
        disk_size_gb         = var.linux_os_disk["lod_disk_size"]
  }

  source_image_reference{
        publisher = var.linux_os_info["loi_os_publisher"]
        offer     = var.linux_os_info["loi_offer"]
        sku       = var.linux_os_info["loi_sku"]
        version   = var.linux_os_info["loi_version"]
  }
} 