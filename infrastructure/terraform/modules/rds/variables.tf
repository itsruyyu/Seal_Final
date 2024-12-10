variable "allocated_storage" {
  description = "Storage size for the RDS instance in GB"
  type        = number
}

variable "engine" {
  description = "Database engine (e.g., mysql, postgres)"
  type        = string
}

variable "engine_version" {
  description = "Version of the database engine"
  type        = string
}

variable "instance_class" {
  description = "Instance class for the RDS instance"
  type        = string
}

variable "db_name" {
  description = "Name of the database"
  type        = string
}

variable "db_username" {
  description = "Username for the database"
  type        = string
}

variable "db_password" {
  description = "Password for the database"
  type        = string
  sensitive   = true
}

variable "parameter_group_name" {
  description = "Name of the DB parameter group"
  type        = string
}

variable "publicly_accessible" {
  description = "Should the DB instance be publicly accessible?"
  type        = bool
}

variable "subnet_group" {
  description = "Subnet group for the RDS instance"
  type        = string
}

variable "security_group_id" {
  description = "Security group ID to attach to the RDS instance"
  type        = string
}

variable "project_name" {
  description = "Name of the project for tagging"
  type        = string
}
