resource "aws_instance" "frontend" {
  ami           = "ami-03265a0778a880afb"
  instance_type = "t3.small"
  vpc_security_group_ids = ["sg-0ae3d8fafa987a7e9"]

  tags = {
    Name = "frontend"
  }
}

resource "aws_route53_record" "frontend" {
  zone_id = "Z02270343NL9KMFFFDGTD"
  name    = "frontend-dev.sgdevrobo.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.frontend.private_ip]
}

resource "aws_instance" "mongodb" {
  ami           = "ami-03265a0778a880afb"
  instance_type = "t3.small"
  vpc_security_group_ids = ["sg-0ae3d8fafa987a7e9"]

  tags = {
    Name = "mongodb"
  }
}

resource "aws_instance" "catalogue" {
  ami           = "ami-03265a0778a880afb"
  instance_type = "t3.small"
  vpc_security_group_ids = ["sg-0ae3d8fafa987a7e9"]

  tags = {
    Name = "catalogue"
  }
}

resource "aws_instance" "redis" {
  ami           = "ami-03265a0778a880afb"
  instance_type = "t3.small"
  vpc_security_group_ids = ["sg-0ae3d8fafa987a7e9"]

  tags = {
    Name = "redis"
  }
}

resource "aws_instance" "user" {
  ami           = "ami-03265a0778a880afb"
  instance_type = "t3.small"
  vpc_security_group_ids = ["sg-0ae3d8fafa987a7e9"]

  tags = {
    Name = "user"
  }
}

resource "aws_instance" "cart" {
  ami           = "ami-03265a0778a880afb"
  instance_type = "t3.small"
  vpc_security_group_ids = ["sg-0ae3d8fafa987a7e9"]

  tags = {
    Name = "cart"
  }
}

resource "aws_instance" "mysql" {
  ami           = "ami-03265a0778a880afb"
  instance_type = "t3.small"
  vpc_security_group_ids = ["sg-0ae3d8fafa987a7e9"]

  tags = {
    Name = "mysql"
  }
}

resource "aws_instance" "shipping" {
  ami           = "ami-03265a0778a880afb"
  instance_type = "t3.small"
  vpc_security_group_ids = ["sg-0ae3d8fafa987a7e9"]

  tags = {
    Name = "shipping"
  }
}

resource "aws_instance" "rabbitmq" {
  ami           = "ami-03265a0778a880afb"
  instance_type = "t3.small"
  vpc_security_group_ids = ["sg-0ae3d8fafa987a7e9"]

  tags = {
    Name = "rabbitmq"
  }
}

resource "aws_instance" "payment" {
  ami           = "ami-03265a0778a880afb"
  instance_type = "t3.small"
  vpc_security_group_ids = ["sg-0ae3d8fafa987a7e9"]

  tags = {
    Name = "payment"
  }
}

resource "aws_instance" "dispatch" {
  ami           = "ami-03265a0778a880afb"
  instance_type = "t3.small"
  vpc_security_group_ids = ["sg-0ae3d8fafa987a7e9"]

  tags = {
    Name = "dispatch"
  }
}