# File generated by aws2tf see https://github.com/aws-samples/aws2tf
# aws_internet_gateway.igw-004c760b24a787b60:
resource "aws_internet_gateway" "igw-004c760b24a787b60" {
  tags = {
    "Name" = "DE-2-1-igw"
  }
  tags_all = {
    "Name" = "DE-2-1-igw"
  }
  vpc_id = aws_vpc.vpc-07f1d11942c14d8a5.id
}