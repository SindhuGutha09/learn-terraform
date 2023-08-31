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
    frontend  = {}
    mongodb   = {}
    catalogue = {}
    user      = {}
    redis     = {}
    mysql     = {}
    cart      = {}
    rabbitmq  = {}
    payment   = {}
    shipping  = {}
    dispatch  = {}
  }
}
resource "aws_instance" "instance" {
  for_each = var.components
  ami           = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = [var.security_groups]

  tags = {
    Name = lookup(var.components, each.key, null)
  }
}

resource "aws_route53_record" "record" {
  for_each = var.components
  zone_id = var.zone_id
  name    = "frontend-dev.sgdevrobo.online"
  type    = "A"
  ttl     = 30
  records = [lookup(aws_instance.instance,each.key[""])]
}


output "instances" {
      value = aws_instance.instance
    }