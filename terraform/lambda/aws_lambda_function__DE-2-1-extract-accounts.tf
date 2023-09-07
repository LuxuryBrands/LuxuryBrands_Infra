# File generated by aws2tf see https://github.com/aws-samples/aws2tf
# aws_lambda_function.DE-2-1-extract-accounts:
resource "aws_lambda_function" "DE-2-1-extract-accounts" {
  architectures = [
    "arm64",
  ]
  function_name = "DE-2-1-extract-accounts"
  handler       = "lambda_function.lambda_handler"
  lifecycle {
    ignore_changes = [filename]
  }
  filename                       = "DE-2-1-extract-accounts.zip"
  layers                         = []
  memory_size                    = 128
  package_type                   = "Zip"
  reserved_concurrent_executions = -1
  role                           = aws_iam_role.r-DE-2-1-extract-accounts-role-iev8xb5d.arn
  runtime                        = "python3.10"
  skip_destroy                   = false
  source_code_hash               = filebase64sha256("DE-2-1-extract-accounts.zip")
  tags                           = {}
  tags_all                       = {}
  timeout                        = 60

  ephemeral_storage {
    size = 512
  }

  tracing_config {
    mode = "PassThrough"
  }
}
