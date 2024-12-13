provider "aws" {
  region = var.aws_region
}

resource "aws_key_pair" "generated_key" {
  key_name   = "${var.name_prefix}-key"
  public_key = tls_private_key.generated.public_key_openssh

  lifecycle {
    ignore_changes = [key_name]
    prevent_destroy = true
  }
}

resource "tls_private_key" "generated" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "local_file" "private_key" {
  content  = tls_private_key.generated.private_key_pem
  filename = "${path.module}/keys/${var.name_prefix}-private-key.pem"
}

resource "aws_security_group" "default" {
  name_prefix = "${var.name_prefix}-sg"
  description = "Default security group"
  vpc_id      = data.aws_vpc.default.id

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
  key_name             = aws_key_pair.generated_key.key_name
  security_group_ids   = [aws_security_group.default.id]
  subnet_ids           = data.aws_subnets.default.ids
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
  name_prefix           = var.name_prefix
  subnet_ids           = data.aws_subnets.default.ids
}

module "s3" {
  source      = "./modules/s3"
  name_prefix = var.name_prefix
  bucket_name = "${var.name_prefix}-bucket-${random_pet.bucket_suffix.id}"
}

resource "random_pet" "bucket_suffix" {
  length    = 2
  separator = "-"
}



data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default" {
  filter {
    name   = "default-for-az"
    values = ["true"]
  }
}

data "aws_subnet" "default" {
  for_each = toset(data.aws_subnets.default.ids)
  id       = each.value
}

