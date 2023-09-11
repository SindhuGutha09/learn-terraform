terraform {
  backend "s3" {

  }
}
variable "test" {
  default = "hello"
}
  output "test" {
  value = var.test
}