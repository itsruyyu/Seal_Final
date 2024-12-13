variable "name_prefix" {
  description = "Prefix for naming RDS resources"
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

variable "vpc_security_group_ids" {
  description = "List of security group IDs for RDS"
  type        = list(string)
}

variable "subnet_ids" {
  description = "List of subnet IDs for RDS instances"
  type        = list(string)
}
