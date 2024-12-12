provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source                     = "./modules/vpc"
  cidr_block                 = var.cidr_block
  public_subnet_cidr_blocks  = var.public_subnet_cidr_blocks
  private_subnet_cidr_blocks = var.private_subnet_cidr_blocks
}

module "ec2" {
  source               = "./modules/ec2"
  ami_id               = var.ami_id
  instance_type        = var.instance_type
  subnet_id            = module.vpc.public_subnets[0]
  key_name             = var.key_name
  security_group_ids   = [module.vpc.default_security_group_id] # Tambahkan keamanan VPC bawaan
  vpc_id               = module.vpc.vpc_id                     # Tambahkan atribut vpc_id
}

module "rds" {
  source                  = "./modules/rds"
  db_username             = var.db_username
  db_password             = var.db_password
  db_instance_class       = var.db_instance_class
  allocated_storage       = var.allocated_storage
  vpc_security_group_ids  = [module.vpc.default_security_group_id] # Gunakan grup keamanan bawaan VPC
  subnet_ids              = module.vpc.private_subnets
}

module "cloudfront" {
  source                 = "./modules/cloudfront"
  origin_domain_name     = var.origin_domain_name
  default_cache_behavior = var.default_cache_behavior
  price_class            = var.price_class
  geo_restriction        = var.geo_restriction
  origin_ssl_protocols   = var.origin_ssl_protocols
}


module "autoscaling" {
  source            = "./modules/autoscaling"
  min_size          = var.min_size
  max_size          = var.max_size
  desired_capacity  = var.desired_capacity
  subnet_ids        = module.vpc.public_subnets
  ami_id            = var.ami_id
  instance_type     = var.instance_type
  security_group_id = module.vpc.default_security_group_id # Tambahkan grup keamanan untuk Auto Scaling
}
