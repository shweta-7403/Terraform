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
data "aws_vpc" "vpc1" {
  tags = {
    Name = "myvpc"
  }
}
output "vpc-name" {
    value = data.aws_vpc.vpc1.id
}
data "aws_security_group" "mysg" {
  tags = {
    webserver = "http"
  }
}
output "sg-name" {
    value = data.aws_security_group.mysg.id
  
}
data "aws_subnet" "name" {
    filter {
      name = "vpc-id"
      values = [ data.aws_vpc.vpc1.id ]
    }
    tags = {
      Name = "private-subnet"
    }
}
  
resource "aws_instance" "server" {
    ami = "ami-0b7207e48d1b6c06f"
    instance_type = "t3.nano"
    subnet_id = data.aws_subnet.name.id
    security_groups = [ data.aws_security_group.mysg.id ]
  
}