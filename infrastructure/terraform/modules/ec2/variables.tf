variable "name_prefix" {
  description = "Prefix for naming resources"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for EC2 instances"
  type        = string
}

variable "instance_type" {
  description = "Instance type for EC2 instances"
  type        = string
}

variable "key_name" {
  description = "Key pair name for SSH access"
  type        = string
}

variable "security_group_ids" {
  description = "List of security group IDs"
  type        = list(string)
}

variable "subnet_ids" {
  description = "List of subnet IDs for Auto Scaling Group"
  type        = list(string)
}

variable "desired_capacity" {
  description = "Desired number of instances in Auto Scaling Group"
  type        = number
}

variable "min_size" {
  description = "Minimum number of instances in Auto Scaling Group"
  type        = number
}

variable "max_size" {
  description = "Maximum number of instances in Auto Scaling Group"
  type        = number
}