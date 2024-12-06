variable "min_size" {
  description = "Minimum number of instances in the Auto Scaling group"
  type        = number
  default     = 1
}

variable "max_size" {
  description = "Maximum number of instances in the Auto Scaling group"
  type        = number
  default     = 3
}

variable "desired_capacity" {
  description = "Desired capacity for the Auto Scaling group"
  type        = number
  default     = 2
}

variable "subnet_ids" {
  description = "List of subnet IDs for the Auto Scaling group"
  type        = list(string)
}

variable "ami_id" {
  description = "AMI ID for EC2 instances in the Auto Scaling group"
  type        = string
}

variable "instance_type" {
  description = "Instance type for EC2 instances in the Auto Scaling group"
  type        = string
}
