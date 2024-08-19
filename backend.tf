terraform {
  backend "s3" {
    bucket         = "reggie-talent-academy-686520628199-tfstates"
    key            = "projects/eks-translator-app/terraform.tfstates"
    dynamodb_table = "terraform-lock"
  }
}