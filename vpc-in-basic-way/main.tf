variable "cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnets" {
  default = ["10.0.0.0/24", "10.0.1.0/24"]
}

variable "app_subnets" {
  default = ["10.0.3.0/24", "10.0.10.0/24"]
}

variable "db_subnets" {
  default = ["10.0.5.0/24", "10.0.4.0/24"]
}




resource "aws_vpc" "main" {
  cidr_block = var.cidr
}

resource "aws_subnet" "public" {
  count = length(var.public_subnets)
  vpc_id = aws_vpc.main.id
  cidr_block = var.public_subnets[count.index]
  tags = {
    Name = "public-${count.index+1}"
  }
}

resource "aws_subnet" "app" {
  count = length(var.app_subnets)
  vpc_id = aws_vpc.main.id
  cidr_block = var.app_subnets[count.index]
  tags = {
    Name = "app-${count.index+1}"
  }
}

resource "aws_subnet" "db" {
  count = length(var.db_subnets)
  vpc_id = aws_vpc.main.id
  cidr_block = var.db_subnets[count.index]
  tags = {
    Name = "db-${count.index+1}"
  }
}