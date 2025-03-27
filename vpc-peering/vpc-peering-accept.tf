resource "aws_vpc_peering_connection_accepter" "peer_accept" {
  provider                  = aws.region_b
  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
  auto_accept               = true

  tags = {
    Name = "Accepter"
  }
}