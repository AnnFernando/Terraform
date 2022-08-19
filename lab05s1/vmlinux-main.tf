resource "azurerm_availability_set" "avset"{
  name = var.linux_avs
  resource_group_name = var.rgroup1
  location = var.location
  platform_update_domain_count = 5
  platform_fault_domain_count = 2
  depends_on = [azurerm_resource_group.rgroup1]
}

resource "azurerm_network_interface" "linux_nic" {
  name                = "${var.linux_name}-nic-${format("%1d",count.index +1)}"
  count               = var.nb_count
  location            = var.location
  resource_group_name = var.rgroup1
  tags                = local.common_tags

  ip_configuration {
    name                          = "internal-${format("%1d",count.index +1)}"
    subnet_id                     = azurerm_subnet.subnet1.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ip[count.index].id

  }
}
resource "azurerm_public_ip" "public_ip" {
  count               = var.nb_count
  name                = "${var.linux_name}-pip-${format("%1d",count.index +1)}"
  resource_group_name = var.rgroup1
  location            = var.location
  allocation_method   = "Dynamic"
  domain_name_label   = "${var.linux_name}-dns-${format("%1d",count.index +1)}"
  tags                = local.common_tags
  depends_on = [azurerm_resource_group.rgroup1]
}
resource "azurerm_linux_virtual_machine" "linux_vm"{
  count                           = var.nb_count
  name                            = "${var.linux_name}${format("%1d",count.index +1)}"
  resource_group_name             = var.rgroup1
  location                        = var.location
  size                            = var.linux_size
  computer_name                   = "${var.linux_name}${format("%1d",count.index +1)}"
  admin_username                  = var.adminuser
  admin_password                  = var.adminpwd

  disable_password_authentication = false
  network_interface_ids           = [element(azurerm_network_interface.linux_nic[*].id, count.index + 1)]
  tags                            = local.common_tags
  availability_set_id             = azurerm_availability_set.avset.id
  depends_on                      = [azurerm_availability_set.avset]

  os_disk{
    name                 = "${var.linux_name}-os-disk-${format("%1d",count.index +1)}"
    caching              = var.linux_os_disk["lod_caching"]
    storage_account_type = var.linux_os_disk["lod_os_account_type"]
    disk_size_gb         = var.linux_os_disk["lod_disk_size"]
  }

  admin_ssh_key {
    username   = var.adminuser
    public_key = file(var.pub_key)
  }

  source_image_reference{
    publisher = var.linux_os_info["loi_os_publisher"]
    offer     = var.linux_os_info["loi_offer"]
    sku       = var.linux_os_info["loi_sku"]
    version   = var.linux_os_info["loi_version"]
  }
} 