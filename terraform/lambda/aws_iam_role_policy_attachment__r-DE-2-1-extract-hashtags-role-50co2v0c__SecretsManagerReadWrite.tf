# File generated by aws2tf see https://github.com/aws-samples/aws2tf
# ../../scripts/052-get-iam-attached-role-policies.sh
# aws_iam_role_policy_attachment.r-DE-2-1-extract-hashtags-role-50co2v0c__SecretsManagerReadWrite:
resource "aws_iam_role_policy_attachment" "r-DE-2-1-extract-hashtags-role-50co2v0c__SecretsManagerReadWrite" {
  policy_arn = "arn:aws:iam::aws:policy/SecretsManagerReadWrite"
  role       = aws_iam_role.r-DE-2-1-extract-hashtags-role-50co2v0c.id
}