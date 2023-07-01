variable "prefix" {
  description = "Prefix all the resources with this name"
}
variable "name" {
  description = "The resource group name"
}
variable "location" {
  description = "The resource group location"
  default = "east us"
}