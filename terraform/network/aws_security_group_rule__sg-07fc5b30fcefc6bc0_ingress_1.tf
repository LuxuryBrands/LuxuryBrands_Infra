# File generated by aws2tf see https://github.com/aws-samples/aws2tf
# aws_security_group_rule.sg-07fc5b30fcefc6bc0_ingress_1:
resource "aws_security_group_rule" "sg-07fc5b30fcefc6bc0_ingress_1" {
  description              = "Rule to allow connections from EC2 instances with sg-0c5dc574de179c7a2 attached"
  from_port                = 5432
  prefix_list_ids          = []
  protocol                 = "tcp"
  security_group_id        = aws_security_group.sg-07fc5b30fcefc6bc0.id
  source_security_group_id = aws_security_group.sg-0c5dc574de179c7a2.id
  to_port                  = 5432
  type                     = "ingress"
}