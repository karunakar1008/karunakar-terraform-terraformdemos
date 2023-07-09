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


variable "resourcegroups" {
  type = map(object({
    name     = string
    location = string
  }))
  default = {
    "dev" = {
      name     = "rg_dev"
      location = "east us"
    }
    "test" = {
      name     = "rg_test"
      location = "west us"
    }
  }
}

resource "azurerm_resource_group" "rg" {
  for_each = var.resourcegroups
  name     = each.value.name
  location = each.value.location
}
