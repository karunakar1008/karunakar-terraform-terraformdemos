resource "azurerm_virtual_network" "example" {
  name                = "${var.vnet_prefix}-${var.project_name}-${var.environment}"
  location            = var.rg_location
  resource_group_name = "${var.rg_prefix}-${var.project_name}-${var.environment}"
  address_space       = [var.vnet_cidr]
  tags = {
      location=var.rg_location
        environment=var.environment
        project=var.project_name
  }
}