# RDS storage size in GB
allocated_storage = 20

# AMI ID for EC2 instances
ami_id = "ami-0453ec754f44f9a4a"

# AWS region to deploy resources
aws_region = "us-east-1"

# CIDR block for the VPC
cidr_block = "10.0.0.0/16"

# RDS instance class
db_instance_class = "db.t3.micro"

# RDS database password
db_password = "securepassword123"

# RDS database username
db_username = "admin"

# Desired number of instances in Auto Scaling group
desired_capacity = 2

# Instance type for EC2 instances
instance_type = "t3.micro"

# Key pair name for SSH access
key_name = "ourkey"

# Maximum number of instances in Auto Scaling group
max_size = 4

# Minimum number of instances in Auto Scaling group
min_size = 1

# List of CIDR blocks for private subnets
private_subnet_cidr_blocks = [
  "10.0.1.0/24",
  "10.0.2.0/24"
]

# List of CIDR blocks for public subnets
public_subnet_cidr_blocks = [
  "10.0.3.0/24",
  "10.0.4.0/24"
]
