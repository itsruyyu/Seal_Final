module "vpc" {
  source              = "./modules/vpc"
  vpc_cidr            = var.vpc_cidr
  public_subnets_cidr = var.public_subnets_cidr
  availability_zones  = var.availability_zones
  project_name        = var.project_name
}

resource "aws_security_group" "web" {
  name        = "${var.project_name}-web-sg"
  description = "Allow HTTP and HTTPS traffic for EC2 instances"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-web-sg"
  }
}

resource "aws_security_group" "rds" {
  name        = "${var.project_name}-rds-sg"
  description = "Allow MySQL traffic for RDS"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = module.vpc.public_subnets_cidr
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-rds-sg"
  }
}

module "rds" {
  source              = "./modules/rds"
  allocated_storage   = var.allocated_storage
  engine              = var.engine
  engine_version      = var.engine_version
  instance_class      = var.instance_class
  db_name             = var.db_name
  db_username         = var.db_username
  db_password         = var.db_password
  parameter_group_name = var.parameter_group_name
  publicly_accessible = var.publicly_accessible
  subnet_group        = module.vpc.public_subnet_ids
  security_group_id   = aws_security_group.rds.id
  project_name        = var.project_name
}

module "autoscaling" {
  source             = "./modules/autoscaling"
  ami_id             = var.ami_id
  instance_type      = var.instance_type
  security_group_id  = aws_security_group.web.id
  user_data_file     = var.user_data_file
  subnet_ids         = module.vpc.public_subnet_ids
  desired_capacity   = var.desired_capacity
  max_size           = var.max_size
  min_size           = var.min_size
  availability_zones = module.vpc.availability_zones
  scale_up_adjustment = var.scale_up_adjustment
  scale_down_adjustment = var.scale_down_adjustment
  project_name       = var.project_name
}

module "s3" {
  source         = "./modules/s3"
  project_name   = var.project_name
  environment    = var.environment
  acl            = var.s3_acl
  force_destroy  = var.s3_force_destroy
  versioning     = var.s3_versioning
  bucket_policy  = var.s3_bucket_policy
}

resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = module.s3.bucket_name  # Menunjukkan nama bucket yang dibuat oleh module S3

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid = "PublicReadGetObject"
        Effect = "Allow"
        Principal = "*"
        Action = "s3:GetObject"
        Resource = "arn:aws:s3:::${module.s3.bucket_name}/*"
      }
    ]
  })
}

