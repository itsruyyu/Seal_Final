variable "name_prefix" {
  description = "Prefix for naming EC2 resources"
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
  description = "List of subnet IDs for EC2 instances"
  type        = list(string)
}

variable "desired_capacity" {
  description = "Desired number of EC2 instances in Auto Scaling Group"
  type        = number
}

variable "min_size" {
  description = "Minimum number of EC2 instances in Auto Scaling Group"
  type        = number
}

variable "max_size" {
  description = "Maximum number of EC2 instances in Auto Scaling Group"
  type        = number
}
