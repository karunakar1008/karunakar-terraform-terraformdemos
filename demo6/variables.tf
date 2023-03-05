variable "prefix" {
  description = "Prefix all the resources with this name"
}
variable "name" {
  description = "The resource group name"
}
variable "location" {
  description = "The resource group location"
}
variable "storage_account_name" {
  description = "The storage account name"
}

variable "container_name" {
  description = "The storage account container name"
}

output "storage-access-key" {
  value = azurerm_storage_account.sa.primary_access_key
  sensitive = true
}