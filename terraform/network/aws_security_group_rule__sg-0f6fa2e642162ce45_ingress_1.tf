# File generated by aws2tf see https://github.com/aws-samples/aws2tf
# aws_security_group_rule.sg-0f6fa2e642162ce45_ingress_1:
resource "aws_security_group_rule" "sg-0f6fa2e642162ce45_ingress_1" {
  cidr_blocks = [
    "0.0.0.0/0",
  ]
  from_port         = 22
  prefix_list_ids   = []
  protocol          = "tcp"
  security_group_id = aws_security_group.sg-0f6fa2e642162ce45.id
  to_port           = 22
  type              = "ingress"
}
