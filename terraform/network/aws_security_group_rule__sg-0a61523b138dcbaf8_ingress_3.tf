# File generated by aws2tf see https://github.com/aws-samples/aws2tf
# aws_security_group_rule.sg-0a61523b138dcbaf8_ingress_3:
resource "aws_security_group_rule" "sg-0a61523b138dcbaf8_ingress_3" {
  from_port         = 0
  prefix_list_ids   = []
  protocol          = "udp"
  security_group_id = aws_security_group.sg-0a61523b138dcbaf8.id
  self              = true
  to_port           = 65535
  type              = "ingress"
}
