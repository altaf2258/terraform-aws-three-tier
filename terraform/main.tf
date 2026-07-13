module "vpc" {
  source = "./modules/vpc"

  project_name            = var.project_name
  environment             = var.environment
  vpc_cidr                = var.vpc_cidr
  enable_internet_gateway = var.enable_internet_gateway

  availability_zones  = var.availability_zones
  public_subnet_cidrs = var.public_subnet_cidrs
}