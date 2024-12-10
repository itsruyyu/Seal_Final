variable "ami_id" {
  description = "ID of the AMI to use for the instance"
  type        = string
}

variable "instance_type" {
  description = "Instance type for the EC2"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID where the instance will be launched"
  type        = string
}

variable "project_name" {
  description = "Name of the project for tagging"
  type        = string
}

variable "user_data_file" {
  description = "Path to the user data script"
  type        = string
}
