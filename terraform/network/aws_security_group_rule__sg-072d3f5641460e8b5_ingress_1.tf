# File generated by aws2tf see https://github.com/aws-samples/aws2tf
# aws_security_group_rule.sg-072d3f5641460e8b5_ingress_1:
resource "aws_security_group_rule" "sg-072d3f5641460e8b5_ingress_1" {
  cidr_blocks = [
    "0.0.0.0/0",
  ]
  description       = "airflow"
  from_port         = 8080
  prefix_list_ids   = []
  protocol          = "tcp"
  security_group_id = aws_security_group.sg-072d3f5641460e8b5.id
  to_port           = 8080
  type              = "ingress"
}