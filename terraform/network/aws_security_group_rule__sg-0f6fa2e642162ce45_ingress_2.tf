# File generated by aws2tf see https://github.com/aws-samples/aws2tf
# aws_security_group_rule.sg-0f6fa2e642162ce45_ingress_2:
resource "aws_security_group_rule" "sg-0f6fa2e642162ce45_ingress_2" {
  from_port         = -1
  prefix_list_ids   = []
  protocol          = "icmp"
  security_group_id = aws_security_group.sg-0f6fa2e642162ce45.id
  self              = true
  to_port           = -1
  type              = "ingress"
}
