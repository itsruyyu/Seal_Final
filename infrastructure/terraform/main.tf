provider "aws" {
  region = var.aws_region
}

resource "tls_private_key" "this" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "aws_key_pair" "this" {
  key_name   = "${var.name_prefix}-keypair"
  public_key = tls_private_key.this.public_key_openssh
}

module "vpc" {
  source                   = "./modules/vpc"
  cidr_block               = var.cidr_block
  public_subnet_cidr_blocks = var.public_subnet_cidr_blocks
  private_subnet_cidr_blocks = var.private_subnet_cidr_blocks
  name_prefix              = var.name_prefix
}

resource "aws_security_group" "default" {
  name_prefix = "${var.name_prefix}-sg"
  description = "Default security group"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

module "ec2" {
  source               = "./modules/ec2"
  ami_id               = var.ami_id
  instance_type        = var.instance_type
  key_name             = "TestingOpenSID"
  security_group_ids   = [aws_security_group.default.id]
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
  vpc_security_group_ids = [aws_security_group.default.id]
  subnet_ids            = module.vpc.private_subnets
  name_prefix           = var.name_prefix
}

module "s3" {
  source      = "./modules/s3"
  bucket_name = var.bucket_name
}
