module "resource_group" {
  source           = "./modules/resource_group"
  rgroupNetworking = "network-rg"
  rgroupLinux      = "linux-rg"
  rgroupWindows    = "windows-rg"
  location         = "australia central"
}

module "network"{
  source              = "./modules/network"
  rgroupNetworking    = "network-rg"
  resource_group      = module.resource_group.rgroupNetworking.name
  location            = module.resource_group.rgroupNetworking.location
  vnet                = "vnet1"
  vnet_space          = ["10.0.0.0/16"]
  subnet1             = "subnet1"
  subnet1_space       = ["10.0.1.0/24"]
  subnet2             = "subnet2"
  subnet2_space       = ["10.0.2.0/24"]
  secgroup1           = "secgroup1"
  secgroup2           = "secgroup2"
}

module "linux"{
  source              = "./modules/linux"
  rgroupLinux         = "linux-rg"
  resource_group      = module.resource_group.rgroupLinux.name
  location            = module.resource_group.rgroupLinux.location
  linux_name          = "linux-vm"
  linux_avs           = "linux-avs"
  nb_count            = 2
  subnet1_id           = module.network.Subnet1_id
  depends_on          = [module.network]
} 

module "windows"{
  source              = "./modules/windows"
  rgroupWindows       = "windows-rg"
  resource_group      = module.resource_group.rgroupWindows.name
  location            = module.resource_group.rgroupWindows.location
  windows_name        = {
    lab-web-w-vm1 = "Standard_B1s"
    lab-web-w-vm2 = "Standard_B1ms"
  }
  windows_avs         = "windows-avs"
  subnet2_id          = module.network.Subnet2_id
  depends_on          = [module.network]
}