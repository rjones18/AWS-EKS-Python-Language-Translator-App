terraform {
  backend "s3" {
    bucket         = "reggie-talent-academy-686520628199-tfstates"
    key            = "projects/eks-lta/terraform.tfstates"
    dynamodb_table = "terraform-lock"
  }
}