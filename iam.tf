resource "aws_iam_role" "translate_polly_role" {
  name = "translate_polly_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Federated = "arn:aws:iam::614768946157:oidc-provider/AD35929386302C488BAC6DF6F6C25399"
        }
        Action = "sts:AssumeRoleWithWebIdentity"
        Condition = {
          StringEquals = {
            "AD35929386302C488BAC6DF6F6C25399:sub" = "system:serviceaccount:default:translate-app-sa"
          }
        }
      }
    ]
  })
}
