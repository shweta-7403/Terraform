terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.84.0"
    }
  }
}

provider "aws" {
  region  = "us-east-2"
  profile = "myprofile"
}
resource "aws_instance" "shweta" {
  ami           = "ami-0eb070c40e6a142a3"
  instance_type = var.aws_instance_type
  root_block_device {
    delete_on_termination = true
    volume_size           = var.ec2_config.v_size
    volume_type           = var.ec2_config.v_type
  }
  tags = merge(var.additional_tags, {
    env = "dev"
  })
}
