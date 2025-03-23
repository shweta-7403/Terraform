resource "aws_ebs_volume" "example" {
  availability_zone = data.aws_instance.existing.availability_zone
  size              = 40

  tags = {
    Name = "my-volume"
  }
}

output "ebs_id" {
  value =  aws_ebs_volume.example.id  
}