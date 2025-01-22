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
}

resource "aws_instance" "server" {
    ami = "ami-00bb6a80f01f03502"
    instance_type = "t3.nano"

    tags = {
      Name = "Server"
    }
}