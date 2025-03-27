# update rt1 in vpc1
resource "aws_route" "route_a_to_b" {
  provider                  = aws.region_a
  route_table_id            = "rtb-0ee8dda357414d497"  
  destination_cidr_block    = data.aws_vpc.vpc_b.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
}
# update rt in vpc2
resource "aws_route" "route_b_to_a" {
  provider                  = aws.region_b
  route_table_id            = "rtb-027c79c28afc5a1b5"
  destination_cidr_block    = data.aws_vpc.vpc_a.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
}