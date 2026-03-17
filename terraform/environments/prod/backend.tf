terraform {
  backend "s3" {
    bucket         = "devops-platform-tf-state-hboss096-001"
    key            = "devops-platform/prod/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
  }
}
