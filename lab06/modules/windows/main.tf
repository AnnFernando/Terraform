resource "azurerm_availability_set" "avset"{
  name = var.windows_avs
  resource_group_name = var.rgroupWindows
  location = var.location
  platform_update_domain_count = 5
  platform_fault_domain_count = 2
}

resource "azurerm_network_interface" "windows_nic" {
  for_each            = var.windows_name
  name                = "${each.key}-nic"
  location            = var.location
  resource_group_name = var.rgroupWindows
  tags                = local.common_tags

  ip_configuration {
    name                          = "${each.key}-internal"
    subnet_id                     = var.subnet2_id
    private_ip_address_allocation = "Dynamic"
  }
}
resource "azurerm_public_ip" "public_ip" {
  for_each            = var.windows_name
  name                = "${each.key}-pip"
  resource_group_name = var.rgroupWindows
  location            = var.location
  allocation_method   = "Dynamic"
  domain_name_label   = "${each.key}-dns"
  tags                = local.common_tags
  depends_on          = [var.resource_group]
}
resource "azurerm_windows_virtual_machine" "windows_vm"{
  for_each                        = var.windows_name
  name                            = each.key
  resource_group_name             = var.rgroupWindows
  location                        = var.location
  size                            = each.value
  computer_name                   = each.key
  admin_username                  = var.adminuser
  admin_password                  = var.adminpwd
  network_interface_ids           = [azurerm_network_interface.windows_nic[each.key].id]
  tags                            = local.common_tags
  availability_set_id             = azurerm_availability_set.avset.id
  depends_on                      = [azurerm_availability_set.avset]

  os_disk{
    name                 = "${each.key}-os-disk"
    caching              = var.windows_os_disk["lod_caching"]
    storage_account_type = var.windows_os_disk["lod_os_account_type"]
    disk_size_gb         = var.windows_os_disk["lod_disk_size"]
  }

  source_image_reference{
    publisher = var.windows_os_info["loi_os_publisher"]
    offer     = var.windows_os_info["loi_offer"]
    sku       = var.windows_os_info["loi_sku"]
    version   = var.windows_os_info["loi_version"]
  }

  winrm_listener{
    protocol = "Http"
  }
} 