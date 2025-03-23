data "aws_ami" "amazon-linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-2.0.20241113.1-x86_64-gp2"]
  }
  owners = ["amazon"]
}
output "ami_id" {
  value = data.aws_ami.amazon-linux.id
}

data "aws_key_pair" "my_key" {
  key_name = "ansible-key"
}

output "keys" {
  value = data.aws_key_pair.my_key.key_name
}
