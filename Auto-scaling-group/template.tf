# Launch Template with fetched AMI
resource "aws_launch_template" "web_lt" {
  name_prefix   = "web-lt-"
  image_id      = "ami-05ccc7da0c9bb7538"
  instance_type = "t2.micro"
  key_name      = "ansible-key"                   

  network_interfaces {
    associate_public_ip_address = true
    security_groups = ["sg-07006317b8e4fd18a"]   
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "ASG-Instance"
    }
  }
}
