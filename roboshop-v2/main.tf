variable "ami" {
  default = "ami-03265a0778a880afb"
}

variable "security_groups" {
  default = [ "sg-0dee954b08055e577" ]
}

variable "instance_type" {
  default = "t3.small"
}

variable "zone_id" {
  default = "Z0021413JFIQEJP9ZO9Z"
}

variable "components" {
  default = {
    frontend = { name = "frontend"}
    catalogue = { name = "catalogue" }
    mongodb = { name = "mongodb"}
    user = { name = "user"}
    redis = { name = "redis"}
    cart = { name = "cart"}
    mysql = { name = "mysql" }
    shipping = { name = "shipping"}
    payment = { name = "payment"}
    rabbitmq = { name = "rabbitmq"}
  }
}

resource "aws_instance" "instance" {
  for_each = var.components
  ami           = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = var.security_groups

  tags = {
    Name = lookup(var.components, each.value["name"], "null")
  }
}

//resource "aws_route53_record" "record" {
//  for_each = var.components
//  zone_id = var.zone_id
//  name    = "frontend-dev.rdevopsb72.online"
//  type    = "A"
//  ttl     = 30
//  records = [lookup(aws_instance.instance, each.key[""] ]
//}

output "instances" {
  value = aws_instance.instance
}
