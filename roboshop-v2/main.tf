variable "ami" {
  default = "ami-03265a0778a880afb"
}

variable "security_groups" {
        defaults=["sg-0ae3d8fafa987a7e9" ]
}

variable "instance_type" {
  default ="t3.small"
}
variable "zone_id" {
  default = [ "Z02270343NL9KMFFFDGTD" ]
}

variable "components" {
  default = {
    frontend  = { name = "frontend-dev"}
    mongodb   = { name = "mongodb-dev" }
    catalogue = { name = "catalogue-dev" }
    user      = { name = "user-dev" }
    redis     = { name = "redis-dev" }
    mysql     = { name = "mysql-dev" }
    cart      = { name = "cart-dev" }
    rabbitmq  = { name = "rabbitmq-dev" }
    payment   = { name = "payment-dev" }
    shipping  = { name = "shipping-dev" }
    dispatch  = { name = "dispatch-dev" }
  }
}

resource "aws_instance" "instance" {
  for_each = var.components
  ami           = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = var.security_groups

  tags = {
    Name = lookup(each.value, "name", null)
  }
}

resource "aws_route53_record" "record" {
  for_each = var.components
  zone_id = var.zone_id
  name    = "${lookup(each.value,"name", null)}.sgdevrobo.online"
  type    = "A"
  ttl     = 30
  records = [lookup(lookup(aws_instance.instance, each.key, null), "private_ip", null) ]
}

output "instances" {
  value = aws_instance.instance
}