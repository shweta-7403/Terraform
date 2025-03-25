# route table for internet gateway
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
# associate public subnet
resource "aws_route_table_association" "a" {
  subnet_id = aws_subnet.public.id
  route_table_id = aws_route_table.rt1.id
  }


# route table for natgateway
  resource "aws_route_table" "pri-rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw.id
  }
  tags = {
    Name = "my-nat-rt"
  }
}
# associate route table in private subnet
resource "aws_route_table_association" "private_assoc" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.pri-rt.id
}

