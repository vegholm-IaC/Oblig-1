terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
  backend "azurerm" {}
}

provider "azurerm" {
  features {}
  resource_providers_to_register = ["Microsoft.Network"]
}

resource "azurerm_resource_group" "rg" {
  name     = lower("rg-compute-${var.base_name}")
  location = var.location
  tags     = local.common_tags
}

data "terraform_remote_state" "nettverk" {
  backend = "azurerm"

  config = {
    resource_group_name  = var.backend_resource_group_name
    storage_account_name = var.backend_storage_account_name
    container_name       = var.backend_container_name
    key                  = var.nettverk_state_key
    use_azuread_auth     = true
  }
}

module "compute" {
  source         = "../../../modules/compute"
  rsg_name       = azurerm_resource_group.rg.name
  location       = var.location
  base_name      = lower(var.base_name)
  environment    = var.environment
  owner          = var.owner
  managedby      = var.managedby
  vm_size        = var.vm_size
  subnet_id      = local.subnet_id
  admin_password = var.admin_password
}
