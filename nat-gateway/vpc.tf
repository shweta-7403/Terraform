# create vpc 
resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "myvpc"
  }
}
# create public subnet
resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.main.id
  cidr_block = cidrsubnet(aws_vpc.main.cidr_block,8,1)
  map_public_ip_on_launch = true
  availability_zone       = "us-east-2a"

  tags = {
    Name = "public-subnet"
  }
}
# create private subnet
resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.main.id
  cidr_block = cidrsubnet(aws_vpc.main.cidr_block,8,2)
  map_public_ip_on_launch = false
  availability_zone       = "us-east-2a"
  tags = {
    Name = "private-subnet"
  }
}


resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "my-igw"
  }
}