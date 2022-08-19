
terraform {
  backend "azurerm" {
    resource_group_name  = "tfstateN01517411RG"
    storage_account_name = "tfstaten01517411sa"
    container_name       = "tfstatefiles"
    key                  = "ESgphRGl5josYwx+D3b+kKH3q5o/LgCe2dYb3m9PHA06+LaDx6ZSgGnzUc6tPtAAgSTbX4hTJ8no+AStEGey9Q=="
  }
}

