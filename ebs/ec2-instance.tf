#fetch detail in exstng ec2 instance

data "aws_instance" "existing" {
  instance_id = "i-0d1cbc37896a19558"
}
 output "result" {
   value = data.aws_instance.existing.id
 }

#attach volume in existing instance

resource "aws_volume_attachment" "ebs_attach" {
  device_name = "/dev/xvdf"
  volume_id   = aws_ebs_volume.example.id
  instance_id = data.aws_instance.existing.id
}

# create snapshot of ebs
resource "aws_ebs_snapshot" "snapshot" {
  volume_id = aws_ebs_volume.example.id

  tags = {
    Name = "Myebs-Snapshot"
  }
}
