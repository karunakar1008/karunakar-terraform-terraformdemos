resource "azurerm_resource_group" "ace_rg" {
  name     = "${var.rg_prefix}-${var.project_name}-${var.environment}"
  location = var.location
}
