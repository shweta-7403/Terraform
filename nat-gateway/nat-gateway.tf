# Elastic IP for NAT Gateway
resource "aws_eip" "nat_eip" {
  domain               = "vpc"
  network_border_group = "us-east-2" 
  tags = {
    Name = "NAT-EIP"
  }
}

# NAT Gateway
resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public.id
  tags = {
    Name = "NAT-Gateway"
  }
}
