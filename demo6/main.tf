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


resource "azurerm_resource_group" "rg" {
  name     = "${var.prefix}-${var.name}"
  location = var.location
}

resource "azurerm_storage_account" "sa" {
  name                     = "${var.storage_account_name}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "${var.prefix}"
  }
}

resource "azurerm_storage_container" "sa-container1" {
  name                  = "dev-${var.container_name}"
  storage_account_name  = azurerm_storage_account.sa.name
  container_access_type = "private"
}
resource "azurerm_storage_container" "sa-container2" {
  name                  = "uat-${var.container_name}"
  storage_account_name  = azurerm_storage_account.sa.name
  container_access_type = "private"
}
resource "azurerm_storage_container" "sa-container3" {
  name                  = "prod-${var.container_name}"
  storage_account_name  = azurerm_storage_account.sa.name
  container_access_type = "private"
}
