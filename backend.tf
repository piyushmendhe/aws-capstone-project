terraform {
  backend "s3" {
    bucket         = "pmendhe-tf-state-bucket"
    key            = "capstone/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}