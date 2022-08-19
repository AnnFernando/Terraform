resource "azurerm_resource_group" "rgroupLinux" {
  name     = var.rgroupLinux
  location = var.location
}
resource "azurerm_resource_group" "rgroupWindows" {
  name     = var.rgroupWindows
  location = var.location
}
resource "azurerm_resource_group" "rgroupNetworking" {
  name     = var.rgroupNetworking
  location = var.location
}
