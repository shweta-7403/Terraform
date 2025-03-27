data "aws_vpc" "vpc_a" {
  provider = aws.region_a
  id       = "vpc-083390dc79782edf3"
}

data "aws_vpc" "vpc_b" {
  provider = aws.region_b
  id       = "vpc-00d4cc4e40136a766"
}