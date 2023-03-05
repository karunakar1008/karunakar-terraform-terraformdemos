terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.46.0"
    }
  }
  backend "azurerm" {
    storage_account_name = "dmeostoragetfbackend"
    container_name       = "dev-tfstate"
    key                  = "dev.terraform.tfstate"

    # rather than defining this inline, the Access Key can also be sourced
    # from an Environment Variable - more information is available below.
    access_key = "KV8cSL9g31+9BZpPqkvjN9Ii2fBHbyeQN8+0bh+vyBTIkSQ3Fo7z4NKPSF9Qly8tOKc8edv54hYc+AStx0mL6w=="
  }
}

# Authenticate using azure CLI
provider "azurerm" {
  features {}
}


resource "azurerm_resource_group" "rg" {
  name     = "${var.name}"
  location = var.location
}