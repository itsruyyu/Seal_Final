# terraform.tfvars

# VPC Configuration
vpc_cidr = "10.0.0.0/16"
public_subnets_cidr = ["10.0.1.0/24", "10.0.2.0/24"]
availability_zones = ["us-east-1a", "us-east-1b"]
project_name = "opensid"

# RDS Configuration
allocated_storage = 20
engine = "mysql"
engine_version = "8.0"
instance_class = "db.t3.micro"
db_name = "opensid_db"
db_username = "admin"
db_password = "12345"
parameter_group_name = "default.mysql8.0"
publicly_accessible = false

# EC2 (Autoscaling) Configuration
ami_id = "ami-0c55b159cbfafe1f0"
instance_type = "t2.micro"
desired_capacity = 2
max_size = 5
min_size = 1
scale_up_adjustment = 1
scale_down_adjustment = -1
user_data_file = "./user_data.sh"  # Path to user_data file

# S3 Configuration
s3_acl = "private"
s3_force_destroy = false
s3_versioning = true
s3_bucket_policy = ""  # Use the default or an empty string if no policy is provided

