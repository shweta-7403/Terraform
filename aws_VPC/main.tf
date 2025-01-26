terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.84.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  profile = "myprofile"
}

#create Vpc
resource "aws_vpc" "vpc1" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "myvpc"
  }
}

#Create Public subnet
resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.vpc1.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "public"
  }
}

#Create Private subnet
resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.vpc1.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "private"
  }
}

#Create internet-gateway
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.vpc1.id

  tags = {
    Name = "Igw1"
  }
}
# Create route table route with internet gateway and association with public subnet
resource "aws_route_table" "rt1" {
  vpc_id = aws_vpc.vpc1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }

  tags = {
    Name = "myrt"
  }
}
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.rt1.id
}

# create Key
resource "tls_private_key" "private_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "key" {
  key_name   = "my-key"
  public_key = tls_private_key.private_key.public_key_openssh
}

resource "local_file" "pem_key" {
  filename = "${path.module}/my-key.pem"
  content  = tls_private_key.private_key.private_key_pem
}
#Create instance use my own vpc
resource "aws_instance" "web-server" {
  ami           = "ami-04b4f1a9cf54c11d0"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.public.id
  key_name = aws_key_pair.key.id
  

  tags = {
    Name = "myserver"
  }
}



