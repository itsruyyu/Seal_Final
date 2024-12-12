provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source                  = "./modules/vpc"
  cidr_block              = var.cidr_block
  public_subnet_cidr_blocks = var.public_subnet_cidr_blocks
  private_subnet_cidr_blocks = var.private_subnet_cidr_blocks
  name_prefix          = var.name_prefix
}

module "ec2" {
  source               = "./modules/ec2"
  ami_id               = var.ami_id
  instance_type        = var.instance_type
  key_name             = var.key_name
  security_group_ids   = var.security_group_ids
  subnet_ids           = module.vpc.public_subnets
  desired_capacity     = var.desired_capacity
  min_size             = var.min_size
  max_size             = var.max_size
  name_prefix          = var.name_prefix
}

module "rds" {
  source                = "./modules/rds"
  db_username           = var.db_username
  db_password           = var.db_password
  db_instance_class     = var.db_instance_class
  allocated_storage     = var.allocated_storage
  vpc_security_group_ids = var.security_group_ids
  subnet_ids            = module.vpc.private_subnets
  name_prefix          = var.name_prefix
}


module "s3" {
  source = "./modules/s3"
  bucket_name = var.bucket_name
  name_prefix = var.name_prefix
}
