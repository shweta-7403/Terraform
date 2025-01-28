aws_instance_type = "t2.micro"
ec2_config = {
  v_size = 30
  v_type = "gp3"
}
additional_tags = {
  Dept  = "testing"
  class = "dev"
}