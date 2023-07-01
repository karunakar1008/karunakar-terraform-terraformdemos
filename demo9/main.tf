terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.46.0"
    }
  }
}

# The default "azurerm" configuration is used for azure resources in the root
# module where no explicit provider instance is selected.
provider "azurerm" {
  features {}
  alias = "eastus"
}

# An alternate configuration is also defined for a different
# region, using the alias "westus".
provider "azurerm" {
   features {}
  alias  = "westus"
}

resource "azurerm_resource_group" "rg" {
  name     = "dev-${var.prefix}-${var.rg_name}"
  location = var.location
  provider = azurerm.eastus
}

resource "azurerm_resource_group" "rg2" {
  name     = "qa-${var.prefix}-${var.rg_name}"
  location = "westus"
  provider = azurerm.westus
}