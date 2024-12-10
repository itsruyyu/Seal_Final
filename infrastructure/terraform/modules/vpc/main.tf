module "vpc" {
  source = "./modules/vpc"
  name   = "OpenSID VPC"
  cidr   = var.cidr_block

  enable_dns_support = true
  enable_dns_hostnames = true

  public_subnets = ["10.0.1.0/24"]
  private_subnets = ["10.0.2.0/24"]
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnets" {
  value = module.vpc.public_subnets
}

output "private_subnets" {
  value = module.vpc.private_subnets
}
