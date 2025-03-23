resource "aws_instance" "server" {
  
  ami = data.aws_ami.amazon-linux.id
  instance_type = "t2.micro"
  key_name = data.aws_key_pair.my_key.key_name
  associate_public_ip_address = true
  vpc_security_group_ids = ["sg-0bc30aefe850c816e"]
  
  user_data = <<-EOF
    
     #!/bin/bash
     sudo yum install httpd -y
     sudo systemctl enable --now httpd
     echo "Welcome terraform" >> /var/www/html/index.html
     sudo systemctl restart httpd
     EOF

  tags = {
    Name = "Bootstraps"
  }
}

output "result" {
  value = aws_instance.server.public_ip
}

