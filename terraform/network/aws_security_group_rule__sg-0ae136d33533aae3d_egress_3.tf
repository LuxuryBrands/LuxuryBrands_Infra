# File generated by aws2tf see https://github.com/aws-samples/aws2tf
# aws_security_group_rule.sg-0ae136d33533aae3d_egress_3:
resource "aws_security_group_rule" "sg-0ae136d33533aae3d_egress_3" {
  cidr_blocks = [
    "52.32.136.34/32",
  ]
  description       = "Preset_3"
  from_port         = 22
  prefix_list_ids   = []
  protocol          = "tcp"
  security_group_id = aws_security_group.sg-0ae136d33533aae3d.id
  to_port           = 22
  type              = "egress"
}