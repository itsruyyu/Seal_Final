variable "db_username" {
  description = "RDS DB username"
  type        = string
}

variable "db_password" {
  description = "RDS DB password"
  type        = string
}

variable "db_instance_class" {
  description = "RDS DB instance class"
  type        = string
}

variable "allocated_storage" {
  description = "Allocated storage for RDS"
  type        = number
  default     = 20
}

variable "vpc_security_group_ids" {
  description = "List of VPC security group IDs"
  type        = list(string)
}

variable "subnet_ids" {
  description = "List of subnet IDs for RDS"
  type        = list(string)
}
