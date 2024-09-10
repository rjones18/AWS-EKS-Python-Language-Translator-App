resource "aws_iam_role" "translate_polly_role" {
  name = "translate_polly_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Federated = "arn:aws:iam::614768946157:oidc-provider/oidc.eks.us-east-1.amazonaws.com/id/8BDD3060D654C869ED93363A62C27FD1"
        }
        Action = "sts:AssumeRoleWithWebIdentity"
        Condition = {
          StringEquals = {
            "oidc.eks.us-east-1.amazonaws.com/id/8BDD3060D654C869ED93363A62C27FD1:sub" = "system:serviceaccount:default:translate-app-sa"
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