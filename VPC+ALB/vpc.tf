resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "myvpc"
  }
}

resource "aws_subnet" "public1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = cidrsubnet(aws_vpc.main.cidr_block,8,1)
  map_public_ip_on_launch = true
  availability_zone = "us-east-2a"

  tags = {
    Name = "public-subnet1"
  }
}

resource "aws_subnet" "public2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = cidrsubnet(aws_vpc.main.cidr_block,8,2)
  map_public_ip_on_launch = true
  availability_zone = "us-east-2b"

  tags = {
    Name = "public-subnet2"
  }
}

resource "aws_route_table" "rt1" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "my-rt"
  }
}
resource "aws_route_table_association" "a" {
  subnet_id = aws_subnet.public1.id
  route_table_id = aws_route_table.rt1.id
  }
resource "aws_route_table_association" "b" {
  subnet_id = aws_subnet.public2.id
  route_table_id = aws_route_table.rt1.id
  }

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "my-igw"
  }
}