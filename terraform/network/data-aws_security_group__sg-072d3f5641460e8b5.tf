data "aws_security_group" "sg-072d3f5641460e8b5" {
  name   = "default"
  vpc_id = aws_vpc.vpc-07f1d11942c14d8a5.id
}
