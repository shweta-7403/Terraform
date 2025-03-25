# create sg for ec2
resource "aws_security_group" "natgateway_sg" {
  vpc_id = aws_vpc.main.id
  tags = { 
    Name = "natgateway-sg" 
    }
    ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
