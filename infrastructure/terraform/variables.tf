variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "us-west-2"
}

variable "cidr_block" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "ami_id" {
  description = "AMI ID for EC2 Instance"
  type        = string
}

variable "instance_type" {
  description = "Instance type for EC2"
  type        = string
  default     = "t2.micro"
}

variable "db_username" {
  description = "RDS Database username"
  type        = string
}

variable "db_password" {
  description = "RDS Database password"
  type        = string
  sensitive   = true
}

variable "security_group_ids" {
  description = "List of VPC security group IDs"
  type        = list(string)
}

variable "public_subnet_cidr_blocks" {
  description = "List of public subnet CIDR blocks"
  type        = list(string)
}

variable "private_subnet_cidr_blocks" {
  description = "List of private subnet CIDR blocks"
  type        = list(string)
}

variable "key_name" {
  description = "Key pair name for EC2 instance"
  type        = string
}

variable "db_instance_class" {
  description = "Instance class for RDS"
  type        = string
  default     = "db.t3.micro"
}

variable "allocated_storage" {
  description = "Storage allocation for RDS in GB"
  type        = number
  default     = 20
}

variable "nacl_rules" {
  description = "Network ACL rules"
  type        = list(object({
    rule_number = number
    protocol    = string
    action      = string
    cidr_block  = string
    egress      = bool
  }))
}

variable "origin_domain_name" {
  description = "Origin domain name for CloudFront distribution"
  type        = string
}

variable "default_cache_behavior" {
  description = "Default cache behavior for CloudFront"
  type        = map(any)
}

variable "price_class" {
  description = "CloudFront price class (e.g., PriceClass_100, PriceClass_200)"
  type        = string
  default     = "PriceClass_100"
}

variable "geo_restriction" {
  description = "Geo restrictions for CloudFront"
  type        = map(any)
  default     = {}
}

variable "origin_ssl_protocols" {
  description = "SSL protocols for CloudFront origin"
  type        = list(string)
  default     = ["TLSv1.2"]
}

variable "min_size" {
  description = "Minimum size for Auto Scaling group"
  type        = number
  default     = 1
}

variable "max_size" {
  description = "Maximum size for Auto Scaling group"
  type        = number
  default     = 5
}

variable "desired_capacity" {
  description = "Desired capacity for Auto Scaling group"
  type        = number
  default     = 2
}
