

# fetch subnet
data "aws_subnet" "subnet1" {
  id = "subnet-0309870cc193c747e"     
}
# fetch subnet
data "aws_subnet" "subnet2" {
  id = "subnet-089151e0fc9998ab5"     
}
# fetch Default Subnets 
data "aws_subnets" "default_subnets" {
  filter {
    name   = "vpc-id"
    values = ["vpc-022eef5c50be724c7"]    
  }
}
