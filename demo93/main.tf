variable "candy_list" {
  type = list(string)
  default = ["snickers", "kitkat", "reeces", "m&ms"]
}
 
output "give_me_candy" {
  value = var.candy_list
}