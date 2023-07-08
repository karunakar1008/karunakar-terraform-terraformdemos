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

resource "azurerm_resource_group" "rg_dev" {
  name     = "rg-dev"
  location = "East Us"
}

resource "azurerm_network_security_group" "nsg" {
  name                = "nsg"
  location            = azurerm_resource_group.rg_dev.location
  resource_group_name = azurerm_resource_group.rg_dev.name
    
  security_rule {
    name                       = "allow-ssh"
    priority                   = 500
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
    }
  security_rule {
    name                       = "allow-kibana-service"
    priority                   = 400
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
     }
  security_rule {
    name                       = "allow-es-service"
    priority                   = 300
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "9200-9300"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
     }
     security_rule {
    name                       = "allow-http"
    priority                   = 102
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "http"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
     }
}