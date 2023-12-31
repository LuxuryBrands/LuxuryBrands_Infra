# File generated by aws2tf see https://github.com/aws-samples/aws2tf
# aws_iam_role.r-DE-2-1-extract-accounts-role-iev8xb5d:
resource "aws_iam_role" "r-DE-2-1-extract-accounts-role-iev8xb5d" {
  assume_role_policy = jsonencode(
    {
      Statement = [
        {
          Action = "sts:AssumeRole"
          Effect = "Allow"
          Principal = {
            Service = "lambda.amazonaws.com"
          }
        },
      ]
      Version = "2012-10-17"
    }
  )
  force_detach_policies = false
  managed_policy_arns = [
    format("arn:aws:iam::%s:policy/service-role/AWSLambdaBasicExecutionRole-05e82a84-de6b-4132-8178-f95f56a8ba53", data.aws_caller_identity.current.account_id),
    format("arn:aws:iam::%s:policy/service-role/AWSLambdaLambdaFunctionDestinationExecutionRole-04b1b3f2-4439-4034-a690-bd2551af54c4", data.aws_caller_identity.current.account_id),
    "arn:aws:iam::aws:policy/AmazonS3FullAccess",
    "arn:aws:iam::aws:policy/CloudWatchEventsFullAccess",
    "arn:aws:iam::aws:policy/SecretsManagerReadWrite",
  ]
  max_session_duration = 3600
  name                 = "DE-2-1-extract-accounts-role-iev8xb5d"
  path                 = "/service-role/"
  tags                 = {}
  tags_all             = {}
}
