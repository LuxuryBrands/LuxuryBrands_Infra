# File generated by aws2tf see https://github.com/aws-samples/aws2tf
# aws_security_group_rule.sg-072d3f5641460e8b5_ingress_6:
resource "aws_security_group_rule" "sg-072d3f5641460e8b5_ingress_6" {
  from_port         = 0
  prefix_list_ids   = []
  protocol          = "-1"
  security_group_id = aws_security_group.sg-072d3f5641460e8b5.id
  self              = true
  to_port           = 0
  type              = "ingress"
}
