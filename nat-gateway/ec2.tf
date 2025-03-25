# create ec2 instance in public subnet
resource "aws_instance" "web" {
  ami           = "ami-0d0f28110d16ee7d6"
  instance_type = "t2.micro"
  key_name = "ansible-key"
  subnet_id = aws_subnet.public.id
  associate_public_ip_address = true
  depends_on = [aws_security_group.natgateway_sg]  

  vpc_security_group_ids = [aws_security_group.natgateway_sg.id]
  
   tags = {
    Name = "public-ec2"
  }
}
# create ec2 instnace in private subnet
resource "aws_instance" "private" {
  ami           = "ami-0d0f28110d16ee7d6"
  instance_type = "t2.micro"
  key_name = "ansible-key"
  subnet_id = aws_subnet.private.id
  
  depends_on = [aws_security_group.natgateway_sg]  

  vpc_security_group_ids = [aws_security_group.natgateway_sg.id]
  
   tags = {
    Name = "private-ec2"
  }
}


