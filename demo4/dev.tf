terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.46.0"
    }
  }
}

# Authenticate using azure CLI
provider "azurerm" {
  features {}
}

module "module_dev" {
  source   = "./modules"
  prefix   = "dev"
  name     = "nextops-vedios-demo2"
  location = "West Europe"
  # providers = {
  #   azurerm = {
  #     source  = "hashicorp/azurerm"
  #     version = "3.46.0"
  #   }
  # }
}
output "azurerm_resource_group_id" {
  value = module.module_dev.id
}