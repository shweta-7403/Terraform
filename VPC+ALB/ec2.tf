resource "aws_instance" "web" {
  count = 2
  ami           = "ami-0d0f28110d16ee7d6"
  instance_type = "t2.micro"
  key_name = "ansible-key"
  subnet_id = element([aws_subnet.public1.id,aws_subnet.public2.id],count.index)
  associate_public_ip_address = true
  depends_on = [aws_security_group.ec2_sg]  

  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  user_data = <<-EOF
#!/bin/bash
set -ex   

# Update and install Apache
sudo yum update -y
sudo yum install -y httpd

# Start and enable Apache
sudo systemctl enable --now httpd

# Create index.html with website content
echo "Hello from instance $(hostname)" > /var/www/html/index.html

# Restart Apache
sudo systemctl restart httpd
EOF



  tags = {
    Name = "web-instance-${count.index}"
  }
}


