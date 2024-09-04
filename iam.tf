resource "aws_iam_role" "translate_polly_role" {
  name = "translate_polly_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Federated = "arn:aws:iam::614768946157:oidc-provider/147690DCCAE56101C33856FD0BC12A17"
        }
        Action = "sts:AssumeRoleWithWebIdentity"
        Condition = {
          StringEquals = {
            "147690DCCAE56101C33856FD0BC12A17:sub" = "system:serviceaccount:default:language-translator-app-role"
          }
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "AmazonPolly" {
  role       = aws_iam_role.translate_polly_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonPollyFullAccess"
}

resource "aws_iam_role_policy_attachment" "TranslateFullAccess" {
  role       = aws_iam_role.translate_polly_role.name
  policy_arn = "arn:aws:iam::aws:policy/TranslateFullAccess"
}