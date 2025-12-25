data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    bucket         = "my-org-terraform-states"
    key            = "dev/vpc/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-locks"
  }
}

data "terraform_remote_state" "ec2" {
  backend="s3"
  config = {
    bucket         = "my-org-terraform-states"
    key            = "dev/ec2/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-locks"
  }
}

module "eks" {
  source = "../../../modules/eks"

  cluster_name = "dev-eks"

  vpc_id     = data.terraform_remote_state.vpc.outputs.vpc_id
  subnet_ids = data.terraform_remote_state.vpc.outputs.private_subnet_ids
  # cluster_security_group_id = data.terraform_remote_state.ec2.outputs.admin_sg_id

  desired_size = 2
  min_size     = 1
  max_size     = 3

  tags = {
    Environment = "dev"
    ManagedBy   = "terraform"
    CostCenter  = "CC1234"
    
  }
}
