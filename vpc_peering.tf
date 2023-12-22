resource "aws_vpc_peering_connection" "foo" {

  peer_vpc_id   = aws_vpc.private_vpc.id
  vpc_id        = aws_vpc.myfirstvpc.id


  accepter {
    allow_remote_vpc_dns_resolution = true
  }

  requester {
    allow_remote_vpc_dns_resolution = true
  }
  provider = aws.east
  auto_accept = true
}