variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnets_cidr" {
  description = "List of CIDR blocks for public subnets"
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "availability_zones" {
  description = "List of availability zones for the subnets"
  default     = ["us-east-1a", "us-east-1b"]
}

variable "project_name" {
  description = "Name of the project for tagging"
  default     = "opensid"
}

variable "allocated_storage" {
  description = "Storage size for the RDS instance"
  default     = 20
}

variable "engine" {
  description = "Database engine"
  default     = "mysql"
}

variable "engine_version" {
  description = "Version of the database engine"
  default     = "8.0"
}

variable "instance_class" {
  description = "Instance class for the RDS"
  default     = "db.t3.micro"
}

variable "db_name" {
  description = "Name of the database"
  default     = "opensid_db"
}

variable "db_username" {
  description = "Username for the database"
  default     = "admin"
}

variable "db_password" {
  description = "Password for the database"
  default     = "your-secure-password"
}

variable "parameter_group_name" {
  description = "Parameter group for the RDS"
  default     = "default.mysql8.0"
}

variable "publicly_accessible" {
  description = "Whether the RDS instance should be publicly accessible"
  default     = false
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  default     = "ami-0c55b159cbfafe1f0"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "desired_capacity" {
  description = "Desired capacity of the autoscaling group"
  default     = 2
}

variable "max_size" {
  description = "Maximum size of the autoscaling group"
  default     = 5
}

variable "min_size" {
  description = "Minimum size of the autoscaling group"
  default     = 1
}

variable "scale_up_adjustment" {
  description = "Adjustment to scale up the autoscaling group"
  default     = 1
}

variable "scale_down_adjustment" {
  description = "Adjustment to scale down the autoscaling group"
  default     = -1
}

variable "user_data_file" {
  description = "The user data file for EC2 instances"
  type        = string
}

variable "environment" {
  description = "The environment (dev, staging, prod)"
  type        = string
}

variable "s3_acl" {
  description = "ACL policy for S3 bucket"
  type        = string
  default     = "private"
}

variable "s3_force_destroy" {
  description = "Whether to allow forced destruction of the bucket"
  type        = bool
  default     = false
}

variable "s3_versioning" {
  description = "Enable versioning for the bucket"
  type        = bool
  default     = true
}

variable "s3_bucket_policy" {
  description = "JSON policy for the S3 bucket"
  type        = string
  default     = ""
}
