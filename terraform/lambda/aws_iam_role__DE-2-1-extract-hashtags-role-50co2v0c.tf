# File generated by aws2tf see https://github.com/aws-samples/aws2tf
# aws_iam_role.r-DE-2-1-extract-hashtags-role-50co2v0c:
resource "aws_iam_role" "r-DE-2-1-extract-hashtags-role-50co2v0c" {
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
    format("arn:aws:iam::%s:policy/service-role/AWSLambdaBasicExecutionRole-e634aa43-efd9-4ea9-a539-5008422289a0", data.aws_caller_identity.current.account_id),
    format("arn:aws:iam::%s:policy/service-role/AWSLambdaLambdaFunctionDestinationExecutionRole-81f21d51-ee25-4476-a0da-1f72309723b4", data.aws_caller_identity.current.account_id),
    "arn:aws:iam::aws:policy/AmazonEventBridgeFullAccess",
    "arn:aws:iam::aws:policy/AmazonS3FullAccess",
    "arn:aws:iam::aws:policy/CloudWatchEventsFullAccess",
    "arn:aws:iam::aws:policy/SecretsManagerReadWrite",
  ]
  max_session_duration = 3600
  name                 = "DE-2-1-extract-hashtags-role-50co2v0c"
  path                 = "/service-role/"
  tags                 = {}
  tags_all             = {}
}
