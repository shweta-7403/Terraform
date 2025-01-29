terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.84.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
  profile = "myprofile"
}
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners = ["amazon"]

  filter {
    name = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}
output "aws_ami" {
  value = data.aws_ami.amazon_linux.id
}
data "aws_security_group" "name" {
  tags = {
    webserver = "http"
  }
  
}
output "name" {
  value = data.aws_security_group.name.id
}
data "aws_vpc" "name" {
  tags = {
    Name = "myvpc"
  }
}
output "myvpc" {
  value = data.aws_vpc.name.id
}
data "aws_availability_zones" "name" {
  state = "available"
}
output "zone" {
  value = data.aws_availability_zones.name
}
data "aws_region" "name" {
}
output "region-name" {
  value = data.aws_region.name
}
data "aws_caller_identity" "data" { 
}
output "caller_identity" {
  value = data.aws_caller_identity.data
}
resource "aws_instance" "web1" {
    ami = data.aws_ami.amazon_linux.id
    instance_type = "t2.micro"

}
output "public_ip" {
  value = aws_instance.web1.public_ip
}