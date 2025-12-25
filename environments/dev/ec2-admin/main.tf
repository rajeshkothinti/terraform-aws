data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    bucket = "my-org-terraform-states"
    key    = "dev/vpc/terraform.tfstate"
    region = "ap-south-1"
  }
}


module "eks_admin" {
  source = "../../../modules/ec2-admin"

  name      = "dev-eks-admin"
  vpc_id   = data.terraform_remote_state.vpc.outputs.vpc_id
  subnet_id = data.terraform_remote_state.vpc.outputs.private_subnet_ids[0]

  tags = {
    Environment = "dev"
    Purpose     = "eks-admin"
  }
}
