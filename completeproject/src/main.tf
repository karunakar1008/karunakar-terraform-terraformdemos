module "ace_vnet" {
  source = "../modules/networking"
  rg_prefix = var.rg_prefix
  rg_location = var.location
  vnet_prefix =  var.vnet_prefix
  vnet_cidr = var.vnet_cidr
  project_name = var.project_name
  environment = var.environment
  depends_on = [ azurerm_resource_group.ace_rg ]
}