# File generated by aws2tf see https://github.com/aws-samples/aws2tf
# aws_security_group.sg-07fc5b30fcefc6bc0:
resource "aws_security_group" "sg-07fc5b30fcefc6bc0" {
  description = "Security group attached to de-2-1-postgres to allow EC2 instances with specific security groups attached to connect to the database. Modification could lead to connection loss."
  tags        = {}
  tags_all    = {}
  vpc_id      = aws_vpc.vpc-07f1d11942c14d8a5.id
}
