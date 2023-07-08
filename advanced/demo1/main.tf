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
  # subscription_id = ""
  # tenant_id = ""
  # client_id = ""
  # client_secret = ""
  alias = "subscirption_dev"
}
provider "azurerm" {
  features {}
  # subscription_id = ""
  # tenant_id = ""
  # client_id = ""
  # client_secret = ""
  alias = "subscirption_test"
}
provider "azurerm" {
  features {}
  # subscription_id = ""
  # tenant_id = ""
  # client_id = ""
  # client_secret = ""
  alias = "subscirption_prod"
}


resource "azurerm_resource_group" "rg_dev" {
  name     = "rg-dev"
  location = "East Us"
  provider = azurerm.subscirption_dev
}
resource "azurerm_virtual_network" "network_dev" {
  name                = "network_dev"
  location            = azurerm_resource_group.rg_dev.location
  resource_group_name = azurerm_resource_group.rg_dev.name
  address_space       = ["10.0.0.0/16"]
  provider            = azurerm.subscirption_dev
  subnet {
    name           = "subnet1"
    address_prefix = "10.0.0.0/24"
  }
}
resource "azurerm_resource_group" "rg_test" {
  name     = "rg-test"
  location = "West Us"
  provider = azurerm.subscirption_test
}
resource "azurerm_virtual_network" "network_test" {
  name                = "network_test"
  location            = azurerm_resource_group.rg_test.location
  resource_group_name = azurerm_resource_group.rg_test.name
  address_space       = ["10.1.0.0/16"]
  provider            = azurerm.subscirption_dev
  subnet {
    name           = "subnet1"
    address_prefix = "10.1.0.0/24"
  }
}
resource "azurerm_resource_group" "rg_prod" {
  name     = "rg-prod"
  location = "central Us"
  provider = azurerm.subscirption_prod
}
resource "azurerm_virtual_network" "network_prod" {
  name                = "network_prod"
  location            = azurerm_resource_group.rg_prod.location
  resource_group_name = azurerm_resource_group.rg_prod.name
  address_space       = ["10.2.0.0/16"]
  provider            = azurerm.subscirption_dev
  subnet {
    name           = "subnet1"
    address_prefix = "10.2.0.0/24"
  }
}