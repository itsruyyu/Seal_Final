variable "ami_id" {
  description = "AMI ID for EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID where EC2 instance will be deployed"
  type        = string
}

variable "key_name" {
  description = "Name of the SSH key pair to use"
  type        = string
}

variable "vpc_id" {
  description = "ID VPC untuk security group"
  type        = string
}

variable "security_group_ids" {
  description = "List of security group IDs"
  type        = list(string)
}
