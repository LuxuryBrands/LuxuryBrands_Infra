# File generated by aws2tf see https://github.com/aws-samples/aws2tf
# aws_security_group_rule.sg-00f8aed2039c9e343_ingress_1:
resource "aws_security_group_rule" "sg-00f8aed2039c9e343_ingress_1" {
  from_port         = -1
  prefix_list_ids   = []
  protocol          = "icmp"
  security_group_id = aws_security_group.sg-00f8aed2039c9e343.id
  self              = true
  to_port           = -1
  type              = "ingress"
}