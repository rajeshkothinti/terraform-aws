module "vpc" {
  source = "../../modules/vpc"

  name                  = var.vpc_name
  vpc_cidr              = var.vpc_cidr
  enable_dns_support    = var.enable_dns_support
  enable_dns_hostnames  = var.enable_dns_hostnames
  tags                  = var.tags
}
