variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "ami_id" {
  description = "AMI ID for EC2 instances"
  type        = string
}

variable "instance_type" {
  description = "Instance type for EC2 instances"
  type        = string
}

variable "db_username" {
  description = "RDS database username"
  type        = string
}

variable "db_password" {
  description = "RDS database password"
  type        = string
}

variable "db_instance_class" {
  description = "RDS instance class"
  type        = string
}

variable "allocated_storage" {
  description = "RDS storage size in GB"
  type        = number
}

variable "min_size" {
  description = "Minimum number of instances in Auto Scaling group"
  type        = number
}

variable "max_size" {
  description = "Maximum number of instances in Auto Scaling group"
  type        = number
}

variable "desired_capacity" {
  description = "Desired number of instances in Auto Scaling group"
  type        = number
}

variable "name_prefix" {
  description = "Prefix for naming resources"
  type        = string
  default     = "opensid"
}

