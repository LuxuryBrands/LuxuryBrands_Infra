# File generated by aws2tf see https://github.com/aws-samples/aws2tf
# aws_secretsmanager_secret.arn_aws_secretsmanager_us-west-2_862327261051_secret_DE-2-1-SECRET-T7uW5a:
resource "aws_secretsmanager_secret" "arn_aws_secretsmanager_us-west-2_862327261051_secret_DE-2-1-SECRET-T7uW5a" {
  recovery_window_in_days = 30
  name                    = "DE-2-1-SECRET"
  tags = {
    "Team" = "DE-2-1"
  }
  tags_all = {
    "Team" = "DE-2-1"
  }
}
