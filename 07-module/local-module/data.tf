data "aws_ami_ids" "ami" {
  name_regex       = "Centos-*"
  owners           = ["973714476881"]
}

