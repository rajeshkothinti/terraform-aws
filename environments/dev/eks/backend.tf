terraform {
  backend "s3" {
    bucket         = "my-org-terraform-states"
    key            = "dev/eks/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
