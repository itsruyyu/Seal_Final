variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "security_group_id" {
  description = "Security group ID for EC2 instances"
  type        = string
}

variable "user_data_file" {
  description = "Path to user data file"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for the autoscaling group"
  type        = list(string)
}

variable "desired_capacity" {
  description = "The desired capacity of the autoscaling group"
  type        = number
}

variable "max_size" {
  description = "Maximum size of the autoscaling group"
  type        = number
}

variable "min_size" {
  description = "Minimum size of the autoscaling group"
  type        = number
}

variable "availability_zones" {
  description = "Availability zones for the autoscaling group"
  type        = list(string)
}

variable "scale_up_adjustment" {
  description = "Adjustment to scale up"
  type        = number
}

variable "scale_down_adjustment" {
  description = "Adjustment to scale down"
  type        = number
}

variable "project_name" {
  description = "Project name for tagging"
  type        = string
}
