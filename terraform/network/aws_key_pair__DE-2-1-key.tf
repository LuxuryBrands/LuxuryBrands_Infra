# File generated by aws2tf see https://github.com/aws-samples/aws2tf
# aws_key_pair.DE-2-1-key:
resource "aws_key_pair" "DE-2-1-key" {
  public_key = data.aws_key_pair.DE-2-1-key.public_key
  lifecycle {
    ignore_changes = [public_key]
  }
  key_name = "DE-2-1-key"
  tags     = {}
  tags_all = {}
}
