data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    bucket         = "my-org-terraform-states"
    key            = "dev/vpc/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-locks"
  }
}

module "eks" {
  source = "../../../modules/eks"

  cluster_name = "dev-eks"
  kubernetes_version =  var.kubernetes_version

  vpc_id     = data.terraform_remote_state.vpc.outputs.vpc_id
  subnet_ids = data.terraform_remote_state.vpc.outputs.public_subnet_ids

  coredns_addon_verion =  var.coredns_addon_verion
  desired_size = 2
  min_size     = 1
  max_size     = 3

  tags = {
    Environment = "dev"
    ManagedBy   = "terraform"
    CostCenter  = "CC1234"
    
  }
}
