# File generated by aws2tf see https://github.com/aws-samples/aws2tf
# ../../scripts/052-get-iam-attached-role-policies.sh
# aws_iam_role_policy_attachment.r-DE-2-1-extract-hashtags-role-50co2v0c__CloudWatchEventsFullAccess:
resource "aws_iam_role_policy_attachment" "r-DE-2-1-extract-hashtags-role-50co2v0c__CloudWatchEventsFullAccess" {
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchEventsFullAccess"
  role       = aws_iam_role.r-DE-2-1-extract-hashtags-role-50co2v0c.id
}