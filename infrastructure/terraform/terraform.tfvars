# RDS storage size in GB
allocated_storage = 20

# AMI ID for EC2 instances
ami_id = "ami-0453ec754f44f9a4a"

# AWS region to deploy resources
aws_region = "us-east-1"

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


# Maximum number of instances in Auto Scaling group
max_size = 4

# Minimum number of instances in Auto Scaling group
min_size = 1
