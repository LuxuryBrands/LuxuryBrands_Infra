# File generated by aws2tf see https://github.com/aws-samples/aws2tf
# aws_lambda_function_event_invoke_config.arn_aws_lambda_us-west-2_862327261051_function_DE-2-1-extract-hashtags__LATEST:
resource "aws_lambda_function_event_invoke_config" "arn_aws_lambda_us-west-2_862327261051_function_DE-2-1-extract-hashtags__LATEST" {
  function_name                = "arn:aws:lambda:us-west-2:862327261051:function:DE-2-1-extract-hashtags"
  maximum_event_age_in_seconds = 0
  maximum_retry_attempts       = 0
  qualifier                    = "$LATEST"

  destination_config {
    on_failure {
      destination = "arn:aws:lambda:us-west-2:862327261051:function:DE-2-1-lambda-slack"
    }
    on_success {
      destination = "arn:aws:lambda:us-west-2:862327261051:function:DE-2-1-lambda-slack"
    }
  }
}
