# File generated by aws2tf see https://github.com/aws-samples/aws2tf
# aws_security_group_rule.sg-072d3f5641460e8b5_ingress_3:
resource "aws_security_group_rule" "sg-072d3f5641460e8b5_ingress_3" {
  cidr_blocks = [
    "0.0.0.0/0",
  ]
  description       = "redis"
  from_port         = 6379
  prefix_list_ids   = []
  protocol          = "tcp"
  security_group_id = aws_security_group.sg-072d3f5641460e8b5.id
  to_port           = 6379
  type              = "ingress"
}