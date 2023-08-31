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

resource "aws_instance" "frontend" {
  ami           = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = [var.security_groups]

  tags = {
    Name = "frontend"
  }
}

resource "aws_route53_record" "frontend" {
  zone_id = var.zone_id
  name    = "frontend-dev.sgdevrobo.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.frontend.private_ip]
}

resource "aws_instance" "mongodb" {
  ami           = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = [var.security_groups]

  tags = {
    Name = "mongodb"
  }
}

resource "aws_route53_record" "mongodb" {
  zone_id = var.zone_id
  name    = "mongodb-dev.sgdevrobo.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.mongodb.private_ip]
}

resource "aws_instance" "catalogue" {
  ami           = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = [var.security_groups]

  tags = {
    Name = "catalogue"
  }
}

resource "aws_route53_record" "catalogue" {
  zone_id = var.zone_id
  name    = "catalogue-dev.sgdevrobo.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.catalogue.private_ip]
}

resource "aws_instance" "redis" {
  ami           = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = [var.security_groups]

  tags = {
    Name = "redis"
  }
}
resource "aws_route53_record" "redis" {
  zone_id = var.zone_id
  name    = "redis-dev.sgdevrobo.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.redis.private_ip]
}

resource "aws_instance" "user" {
  ami           = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = [var.security_groups]

  tags = {
    Name = "user"
  }
}

resource "aws_route53_record" "user" {
  zone_id = var.zone_id
  name    = "user-dev.sgdevrobo.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.user.private_ip]
}

resource "aws_instance" "cart" {
  ami           = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = [var.security_groups]


  tags = {
    Name = "cart"
  }
}

resource "aws_route53_record" "cart" {
  zone_id = var.zone_id
  name    = "cart-dev.sgdevrobo.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.cart.private_ip]
}

resource "aws_instance" "mysql" {
  ami           = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = [var.security_groups]


  tags = {
    Name = "mysql"
  }
}

resource "aws_route53_record" "mysql" {
  zone_id = var.zone_id
  name    = "mysql-dev.sgdevrobo.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.mysql.private_ip]
}

resource "aws_instance" "shipping" {
  ami           = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = [var.security_groups]

  tags = {
    Name = "shipping"
  }
}

resource "aws_route53_record" "shipping" {
  zone_id = var.zone_id
  name    = "shipping-dev.sgdevrobo.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.shipping.private_ip]
}

resource "aws_instance" "rabbitmq" {
  ami           = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = [var.security_groups]


  tags = {
    Name = "rabbitmq"
  }
}

resource "aws_route53_record" "rabbitmq" {
  zone_id = var.zone_id
  name    = "rabbitmq-dev.sgdevrobo.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.rabbitmq.private_ip]
}

resource "aws_instance" "payment" {
  ami           = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = [var.security_groups]

  tags = {
    Name = "payment"
  }
}

resource "aws_route53_record" "payment" {
  zone_id = var.zone_id
  name    = "payment-dev.sgdevrobo.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.payment.private_ip]
}

resource "aws_instance" "dispatch" {
  ami           = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = [var.security_groups]


  tags = {
    Name = "dispatch"
  }
}

resource "aws_route53_record" "dispatch" {
  zone_id = var.zone_id
  name    = "dispatch-dev.sgdevrobo.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.dispatch.private_ip]
}