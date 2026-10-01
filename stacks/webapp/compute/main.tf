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

module "network" {
  source        = "../../../modules/compute"
  rsg_name      = azurerm_resource_group.rg.name
  location      = var.location
  base_name     = lower(var.base_name)
  environment   = var.environment
  owner         = var.owner
  managedby     = var.managedby
  vm_size = var.vm_size
  subnet_id = var.subnet_id["web"]
}
