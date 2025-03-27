resource "aws_vpc_peering_connection" "peer" {
  provider    = aws.region_a
  peer_vpc_id = data.aws_vpc.vpc_b.id # dynamic fetch vpc id
  vpc_id      = data.aws_vpc.vpc_a.id 
  peer_region = "us-west-1"

  tags = {
    Side = "Requester"
  }
}
  