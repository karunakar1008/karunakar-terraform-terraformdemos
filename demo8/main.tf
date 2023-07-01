variable "apps" {
  type = map(any)
  default = {
    "foo" = {
      "region" = "us-east-1",
    },
    "bar" = {
      "region" = "eu-west-1",
    },
    "baz" = {
      "region" = "ap-south-1",
    },
  }
}

output "app_1" {
  value = var.apps.foo.region
}
output "app_2" {
  value = var.apps.bar.region
}
output "app_3" {
  value = var.apps.baz.region
}