# File generated by aws2tf see https://github.com/aws-samples/aws2tf
# aws_route_table_association.subnet-0e29f3d0e936ffd0b__rtbassoc-08558dd4e525b624c:
resource "aws_route_table_association" "subnet-0e29f3d0e936ffd0b__rtbassoc-08558dd4e525b624c" {
  route_table_id = aws_route_table.rtb-0d6f34dd37a024a0d.id
  subnet_id      = aws_subnet.subnet-0e29f3d0e936ffd0b.id
}
