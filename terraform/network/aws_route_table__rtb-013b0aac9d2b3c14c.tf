# File generated by aws2tf see https://github.com/aws-samples/aws2tf
# aws_route_table.rtb-013b0aac9d2b3c14c:
resource "aws_route_table" "rtb-013b0aac9d2b3c14c" {
  propagating_vgws = []
  route = [
    {
      carrier_gateway_id         = ""
      cidr_block                 = "0.0.0.0/0"
      core_network_arn           = ""
      destination_prefix_list_id = ""
      egress_only_gateway_id     = ""
      gateway_id                 = ""
      instance_id                = null
      ipv6_cidr_block            = null
      local_gateway_id           = ""
      nat_gateway_id             = aws_nat_gateway.nat-0323de7ff8ad4c1a1.id
      network_interface_id       = ""
      transit_gateway_id         = ""
      vpc_endpoint_id            = ""
      vpc_peering_connection_id  = ""
    },
  ]
  tags = {
    "Name" = "DE-2-1-rtb-private2-us-west-2c"
  }
  tags_all = {
    "Name" = "DE-2-1-rtb-private2-us-west-2c"
  }
  vpc_id = aws_vpc.vpc-07f1d11942c14d8a5.id
}
